import string
import time

from django.utils.crypto import get_random_string
from django.utils.http import http_date

from caravella_site.api.utilities import ErrorsNames, createErrorJsonResponse

# csrf protection. Comment this to enable csrf protection
# Use x-csrftoken header to transfer token from client's cookie
csrf_disabled = True

always_update_token = False


def csrf_middleware(get_response):
    # Единовременная настройка и инициализация.
    def middleware(request):

        if 'is_authorized' in request.session \
                and not csrf_disabled:
            if 'csrf_token' not in request.COOKIES:
                request.session.flush()
            else:
                if 'X-Csrftoken' not in request.headers:
                    return createErrorJsonResponse(ErrorsNames.MissingCSRFToken)

                if request.session['csrf_token'] != request.headers['X-Csrftoken']:
                    return createErrorJsonResponse(ErrorsNames.CSRFViolation)

        response = get_response(request)

        if 'is_authorized' in request.session \
                and not csrf_disabled \
                and (always_update_token or 'csrf_token' not in request.session):
            generate_anti_csrf_token(request, response)
        return response

    return middleware


def generate_anti_csrf_token(request, response):
    new_csrf_token = get_random_string(32, allowed_chars=string.ascii_letters + string.digits)
    request.session['csrf_token'] = new_csrf_token
    max_age = request.session.get_expiry_age()
    expires_time = time.time() + max_age
    expires = http_date(expires_time)
    response.set_cookie('csrf_token', new_csrf_token,
                        max_age=max_age,
                        expires=expires)
