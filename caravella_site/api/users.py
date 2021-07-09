import hashlib
import re
import uuid

from django.core.exceptions import ObjectDoesNotExist
from django.core.files.storage import default_storage
from django.http import JsonResponse
from django.urls import path

from caravella_site.api.utilities import ErrorsNames, createErrorJsonResponse, request_check_POST
from caravella_site.models import Users, Roles


def api_set_user_image(request):
    request_check_protocol = request_check_POST(request)

    if request_check_protocol != 0:
        return createErrorJsonResponse(request_check_protocol)

    if 'is_authorized' not in request.session:
        return createErrorJsonResponse(ErrorsNames.NotAuthorizedSessionError)

    if 'image' not in request.FILES:
        return createErrorJsonResponse(ErrorsNames.MissingParameterError)

    if len(request.FILES) == 0:
        return createErrorJsonResponse(ErrorsNames.NoFileError)

    data = request.FILES['image']

    file_ext_list = data.name.split('.')
    file_ext = file_ext_list[len(file_ext_list) - 1]

    if file_ext != 'png' \
            and file_ext != 'jpeg':
        return createErrorJsonResponse(ErrorsNames.InvalidImageError)

    data.name = str(uuid.uuid4()).replace('-', '') + '.' + file_ext

    default_storage.save('users/' + data.name, data)

    current_user = Users.objects.get(id=request.session['user_id'])
    if current_user.profile_photo_path is not None \
            and default_storage.exists(current_user.profile_photo_path):
        default_storage.delete(current_user.profile_photo_path)

    current_user.profile_photo_path = 'users/' + data.name
    current_user.save()

    return JsonResponse({'done': 'image_profile_upload'})


def api_create_user(request):
    request_check = request_check_POST(request)

    if request_check != 0:
        return createErrorJsonResponse(request_check)

    if 'login' not in request.POST \
            or 'password' not in request.POST \
            or 'name' not in request.POST \
            or 'surname' not in request.POST \
            or 'age' not in request.POST \
            or 'email' not in request.POST:
        return createErrorJsonResponse(ErrorsNames.MissingParameterError)

    if len(request.POST['login']) == 0 \
            or len(request.POST['password']) == 0 \
            or len(request.POST['name']) == 0 \
            or len(request.POST['surname']) == 0 \
            or len(request.POST['age']) == 0 \
            or len(request.POST['email']) == 0:
        return createErrorJsonResponse(ErrorsNames.EmptyParameterError)

    if len(request.POST['login']) > Users._meta.get_field('username').max_length \
            or len(request.POST['password']) > 64 \
            or len(request.POST['name']) > Users._meta.get_field('name').max_length \
            or len(request.POST['surname']) > Users._meta.get_field('surname').max_length \
            or len(request.POST['email']) > Users._meta.get_field('email').max_length:
        return createErrorJsonResponse(ErrorsNames.InvalidStringLengthError)

    if 'role' in request.POST \
            and 'is_authorized' not in request.session:
        return createErrorJsonResponse(ErrorsNames.NotAuthorizedSessionError)

    if 'role' in request.POST \
            and request.session['access_level'] < 2:
        return createErrorJsonResponse(ErrorsNames.AccessError)

    if 'role' in request.POST \
            and len(request.POST['role']) == 0:
        return createErrorJsonResponse(ErrorsNames.EmptyParameterError)

    if 'role' in request.POST \
            and len(request.POST['role']) > 64:
        return createErrorJsonResponse(ErrorsNames.InvalidStringLengthError)

    if len(request.POST['login']) < 6:
        return createErrorJsonResponse(ErrorsNames.ShortLoginError)

    if Users.objects.filter(username=request.POST['login']).exists():
        return createErrorJsonResponse(ErrorsNames.NotUniqueLoginError)

    if 100 < request.POST['age'] < 18:
        return createErrorJsonResponse(ErrorsNames.InvalidIntegerValueError)

    if len(request.POST['password']) < 8:
        return createErrorJsonResponse(ErrorsNames.WeakPasswordError)

    if not re.search(r'.+@.+\..+', request.POST['email']):
        return createErrorJsonResponse(ErrorsNames.InvalidEmailError)

    if Users.objects.filter(email=request.POST['email']).exists():
        return createErrorJsonResponse(ErrorsNames.NotUniqueEmailError)

    if 'role' in request.POST:
        try:
            user_role = Roles.objects.get(codename=request.POST['role'])
        except ObjectDoesNotExist:
            return createErrorJsonResponse(ErrorsNames.RoleDoesntExistError)
    else:
        user_role = Roles.objects.get(codename='role.user')

    pass_hash = hashlib.sha512(str.encode(request.POST['password'], encoding='utf-8')).hexdigest()

    new_user = Users(username=request.POST['login'],
                     role=user_role,
                     key_fingerprint=pass_hash,
                     age=request.POST['age'],
                     name=request.POST['name'],
                     surname=request.POST['surname'],
                     email=request.POST['surname'])

    new_user.save()

    request.session['is_authorized'] = True
    request.session['user_id'] = new_user.id
    request.session['access_level'] = new_user.role.access_level

    request.session.cycle_key()

    return JsonResponse({'done': 'user_creation'})


def api_login(request):
    request_check = request_check_POST(request)

    if request_check != 0:
        return createErrorJsonResponse(request_check)

    if 'login' not in request.POST \
            or 'password' not in request.POST:
        return createErrorJsonResponse(ErrorsNames.MissingParameterError)

    if len(request.POST['login']) == 0 \
            or len(request.POST['password']) == 0:
        return createErrorJsonResponse(ErrorsNames.EmptyParameterError)

    if len(request.POST['login']) > Users._meta.get_field('username').max_length \
            or len(request.POST['password']) > 64:
        return createErrorJsonResponse(ErrorsNames.InvalidStringLengthError)

    if 'is_authorized' in request.session:
        return createErrorJsonResponse(ErrorsNames.DoubleAuthorizationError)

    pass_hash = hashlib.sha512(str.encode(request.POST['password'], encoding='utf-8')).hexdigest()

    # PyCharm Community version do not fully support Django.
    # This 'error' can be fixed by explicit "objects = models.Manager()" in model class

    try:
        user_info = Users.objects.get(username=request.POST['login'], key_fingerprint=pass_hash)
    except ObjectDoesNotExist:
        return createErrorJsonResponse(ErrorsNames.InvalidAuthDataError)

    if user_info.is_user_blocked == 1:
        return createErrorJsonResponse(ErrorsNames.UserBlockedError)

    request.session.cycle_key()

    request.session['is_authorized'] = True
    request.session['user_id'] = user_info.id
    request.session['access_level'] = user_info.role.access_level

    return JsonResponse({'done': 'auth'})


def api_logout(request):
    request_check = request_check_POST(request)

    if request_check != 0 and request_check != ErrorsNames.EmptyPostError:
        return createErrorJsonResponse(request_check)

    if 'is_authorized' not in request.session:
        return createErrorJsonResponse(ErrorsNames.NotAuthorizedSessionError)

    request.session.flush()

    response = JsonResponse({'done': 'logout'})
    response.delete_cookie('csrf_token')

    return response


def api_get_user_info(request):
    request_check = request_check_POST(request)

    if request_check != 0:
        return createErrorJsonResponse(request_check)

    if 'is_authorized' not in request.session:
        return createErrorJsonResponse(ErrorsNames.NotAuthorizedSessionError)

    current_user = Users.objects.get(id=request.session['user_id'])

    return JsonResponse(
        {
            'name': current_user.name,
            'surname': current_user.surname,
            'access_level': current_user.role.access_level,
            'age': current_user.age,
            'email': current_user.email,
            'is_email_confirmed': current_user.is_email_confirmed,
            'profile_photo_path': current_user.profile_photo_path,
            'is_user_blocked': current_user.is_user_blocked,
            'is_validated_driver': current_user.is_validated_driver,
        }
    )


def api_get_all_users_list(request):
    request_check = request_check_POST(request)

    if request_check != 0:
        return createErrorJsonResponse(request_check)

    if 'role_codename' not in request.POST:
        return createErrorJsonResponse(ErrorsNames.MissingParameterError)

    if 'is_authorized' not in request.session:
        return createErrorJsonResponse(ErrorsNames.NotAuthorizedSessionError)

    if request.session['access_level'] < 2:
        return createErrorJsonResponse(ErrorsNames.AccessError)

    users = Users.objects.all()

    response = {}

    for user in users:
        if user.role.codename == request.POST['role_codename'] \
                or len(request.POST['role_codename']) == 0:
            response.update({
                len(response) + 1: {
                    'name': user.name,
                    'surname': user.surname,
                    'age': user.age,
                    'email': user.email,
                    'profile_photo_path': user.profile_photo_path,
                    'is_user_blocked': user.is_user_blocked,
                    'is_validated_driver': user.is_validated_driver,
                }
            })

    return JsonResponse(response)


def api_get_roles_list(request):
    request_check = request_check_POST(request)

    if request_check != 0:
        return createErrorJsonResponse(request_check)

    if 'is_authorized' not in request.session:
        return createErrorJsonResponse(ErrorsNames.NotAuthorizedSessionError)

    if request.session['access_level'] < 2:
        return createErrorJsonResponse(ErrorsNames.AccessError)

    roles = Roles.objects.all()

    response = {}

    for role in roles:
        response.update({
            len(response) + 1: {
                'name': role.name,
                'codename': role.codename,
                'access_level': role.access_level,
            }
        })

    return JsonResponse(response)


urlpatterns = [
    path('login', api_login, name='login'),
    path('logout', api_logout, name='logout'),
    path('create_user', api_create_user, name='create_user'),
    path('set_user_image', api_set_user_image, name='set_user_image'),
    path('get_user_info', api_get_user_info, name='get_user_info'),
    path('get_all_users_list', api_get_all_users_list, name='get_all_users_list'),
    path('get_roles_list', api_get_roles_list, name='get_roles_list'),
]
