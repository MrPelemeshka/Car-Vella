from django.core.exceptions import ObjectDoesNotExist
from django.http import JsonResponse
from django.urls import path

from datetime import datetime

from caravella_site.api.utilities import createErrorJsonResponse, ErrorsNames, request_check_POST
from caravella_site.models import Promocodes, Users, PromoTypes, PromoConditions

PromoConditions_Codenames = \
    [
        'rent_minutes',
        'rent_cost',
        'loyalty_months',
        'new_users',
        'no_conditions',
    ]

PromoTypes_Codenames = \
    [
        'discount',
        'free_minutes',
    ]


def api_add_promocode(request):
    request_check_protocol = request_check_POST(request)

    if request_check_protocol != 0:
        return createErrorJsonResponse(request_check_protocol)

    if 'is_authorized' not in request.session:
        return createErrorJsonResponse(ErrorsNames.AccessError)

    if 'code' not in request.POST \
            or 'until' not in request.POST \
            or 'activation_limit' not in request.POST \
            or 'condition' not in request.POST \
            or 'condition_value' not in request.POST \
            or 'reward_type' not in request.POST \
            or 'reward_value' not in request.POST:
        return createErrorJsonResponse(ErrorsNames.MissingParameterError)

    if len(request.POST['code']) == 0 \
            or len(request.POST['active_until']) == 0 \
            or len(request.POST['activation_limit']) == 0 \
            or len(request.POST['condition_type']) == 0 \
            or len(request.POST['condition_value']) == 0 \
            or len(request.POST['promo_type']) == 0 \
            or len(request.POST['promo_value']) == 0:
        return createErrorJsonResponse(ErrorsNames.EmptyParameterError)

    if len(request.POST['code']) > Promocodes._meta.get_field('code').max_length:
        return createErrorJsonResponse(ErrorsNames.InvalidStringLengthError)

    if not isinstance(request.POST['condition_value'], int) \
            or not isinstance(request.POST['reward_value'], int):
        return createErrorJsonResponse(ErrorsNames.InvalidIntegerValueError)

    if request.POST['condition_value'] < 0 \
            or request.POST['reward_value'] < 0:
        return createErrorJsonResponse(ErrorsNames.InvalidIntegerValueError)

    if request.POST['promo_type'] not in PromoTypes_Codenames:
        return createErrorJsonResponse(ErrorsNames.UnsupportedPromoTypeError)

    if request.POST['condition_type'] not in PromoConditions_Codenames:
        return createErrorJsonResponse(ErrorsNames.UnsupportedPromoConditionError)

    if request.POST['promo_type'] == 'discount' and \
            ErrorsNames.MissingParameterError > request.POST['promo_value'] or request.POST['promo_value'] < 0:
        return createErrorJsonResponse(ErrorsNames.InvalidIntegerValueError)

    if request.POST['activation_limit'] < 1:
        return createErrorJsonResponse(ErrorsNames.InvalidIntegerValueError)

    try:
        until_time = datetime.strptime(request.POST['active_until'], '%d.%m.%y %H:%M:%S')
    except ValueError:
        return createErrorJsonResponse(ErrorsNames.InvalidDateError)

    current_user = Users.objects.get(id=request.session['user_id'])

    if current_user.role.access_level == 0:
        return createErrorJsonResponse(ErrorsNames.AccessError)

    promo_type = PromoTypes.Objects.filter(codename=request.POST['reward_type'])
    promo_condition = PromoConditions.Objects.filter(codename=request.POST['condition_type'])

    new_code = Promocodes(code=request.POST['code'],
                          activations_limit=request.POST['activation_limit'],
                          active_until=until_time,
                          promo_type=promo_type,
                          reward=request.POST['reward_value'],
                          promo_condition=promo_condition,
                          condition_value=request.POST['condition_value'])

    new_code.save()

    return JsonResponse({'done': 'promo_created'})


def api_get_promocodes_list(request):
    request_check_protocol = request_check_POST(request)

    if request_check_protocol != 0:
        return createErrorJsonResponse(request_check_protocol)

    if 'is_authorized' not in request.session:
        return createErrorJsonResponse(ErrorsNames.AccessError)

    current_user = Users.objects.get(id=request.session['user_id'])

    if current_user.role.access_level == 0:
        return createErrorJsonResponse(ErrorsNames.AccessError)

    codes = Promocodes.Objects.filter(active_until__gt=datetime.now())

    response = {}

    for code in codes:
        response.update({
            len(response) + 1:
                {
                    'code': code.code,
                    'activations_count': code.activations_count,
                    'activations_limit': code.activations_limit,
                    'active_until': code.active_until,
                    'promo_type': code.promo_type.name,
                    'promo_value': code.reward,
                    'condition_type': code.promo_condition.name,
                    'condition_value': code.condition_value,
                }
        })

    return JsonResponse(response)


def api_get_supported_promo(request):
    request_check_protocol = request_check_POST(request)

    if request_check_protocol != 0:
        return createErrorJsonResponse(request_check_protocol)

    if 'is_authorized' not in request.session:
        return createErrorJsonResponse(ErrorsNames.AccessError)

    current_user = Users.objects.get(id=request.session['user_id'])

    if current_user.role.access_level == 0:
        return createErrorJsonResponse(ErrorsNames.AccessError)

    conditions = PromoConditions.Objects.all()
    types = PromoTypes.Objects.all()

    response = {}

    json_conditions = {}
    json_types = {}

    for condition in conditions:
        json_conditions.update({
            len(json_conditions)+1:
                {
                    'name': condition.name,
                    'codename': condition.codename,
                }

        })

    for promo_type in types:
        json_types.update({
            len(json_types) + 1:
                {
                    'name': promo_type.name,
                    'codename': promo_type.codename,
                }

        })

    response.update({
        'types': json_types
    })

    response.update({
        'conditions': json_conditions
    })

    return JsonResponse(response)

def api_activate_promo(request):
    request_check_protocol = request_check_POST(request)

    if request_check_protocol != 0:
        return createErrorJsonResponse(request_check_protocol)

    if 'is_authorized' not in request.session:
        return createErrorJsonResponse(ErrorsNames.AccessError)

    if len(request.POST['code']) == 0:
        return createErrorJsonResponse(ErrorsNames.MissingParameterError)

    if len(request.POST['code']) > Promocodes._meta.get_field('code').max_length:
        return createErrorJsonResponse(120)

    try:
        code = Promocodes.Objects.get(code=request.POST['code'])
    except ObjectDoesNotExist:
        return createErrorJsonResponse(ErrorsNames.InvalidPromoCodeError)




urlpatterns = [
    path('add_promocode', api_add_promocode, name='add_promocode'),
    path('get_promocodes_list', api_get_promocodes_list, name='get_promocodes_list'),
    path('get_supported_promo', api_get_supported_promo, name='get_supported_promo'),
    path('activate_promo', api_activate_promo, name='activate_promo'),
]
