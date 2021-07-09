import json

from django.http import JsonResponse
from enum import Enum


class ErrorsNames(Enum):
    MissingParameterError = 100
    EmptyParameterError = 101
    NotPOSTRequestError = 102
    EmptyPostError = 103
    GETinPOSTError = 104

    NotAuthorizedSessionError = 110
    DoubleAuthorizationError = 111
    AccessError = 112
    MissingCSRFToken = 113
    CSRFViolation = 114

    InvalidStringLengthError = 120
    InvalidIntegerValueError = 121
    InvalidDateError = 122
    NoFileError = 123
    InvalidFileError = 124
    InvalidImageError = 125

    NotUniqueLoginError = 200
    ShortLoginError = 201
    WeakPasswordError = 202
    InvalidEmailError = 203
    NotUniqueEmailError = 204
    RoleDoesntExistError = 205
    TooManySignUpsError = 206

    InvalidAuthDataError = 210
    UserBlockedError = 211
    MaxAuthAttemptsError = 212
    SuspiciousActionError = 213
    IPAddressBlockedError = 214
    APIKeyIsInvalid = 215

    ClosedTicketError = 220

    InvalidPromoCodeError = 230
    ConditionsAreNotMetError = 231

    UnsupportedPromoTypeError = 240
    UnsupportedPromoConditionError = 241

    InvalidCarIDError = 300
    InvalidBicycleIDError = 301
    NoRentError = 302
    AlreadyRentError = 303
    AllCarsWithThisIDAreRentedError = 304
    AllBicyclesWithThisIDAreRentedError = 305
    RentNotPaidError = 306
    DoubleRentPaymentError = 307
    InvalidMoneyCountRentPaymentError = 307


reasons = {
    ErrorsNames.MissingParameterError.value: 'Missing parameters',
    ErrorsNames.EmptyParameterError.value: 'Empty parameters',
    ErrorsNames.NotPOSTRequestError.value: 'Not POST methods are prohibited',
    ErrorsNames.EmptyPostError.value: 'Empty POST request',
    ErrorsNames.GETinPOSTError.value: 'The POST request has the GET data in URI',

    ErrorsNames.NotAuthorizedSessionError.value: 'This session is not authorized',
    ErrorsNames.DoubleAuthorizationError.value: 'This session is already authorized',
    ErrorsNames.AccessError.value: 'Access denied',
    ErrorsNames.MissingCSRFToken.value: 'CSRF token is missing. Aborting request',
    ErrorsNames.CSRFViolation.value: 'CSRF attack detected',

    ErrorsNames.InvalidStringLengthError.value: 'Invalid string length',
    ErrorsNames.InvalidIntegerValueError.value: 'Invalid integer value',
    ErrorsNames.InvalidDateError.value: 'Invalid date. Use %d.%m.%y %H:%M:%S format',
    ErrorsNames.NoFileError.value: 'No files presented',
    ErrorsNames.InvalidFileError.value: 'This is not a valid file',
    ErrorsNames.InvalidImageError.value: 'This is not a valid image',

    ErrorsNames.NotUniqueLoginError.value: 'This login is already used',
    ErrorsNames.ShortLoginError.value: 'Login is too short',
    ErrorsNames.WeakPasswordError.value: 'Password too weak',
    ErrorsNames.InvalidEmailError.value: 'Invalid email address',
    ErrorsNames.NotUniqueEmailError.value: 'This email address is already used',
    ErrorsNames.RoleDoesntExistError.value: "Role doesn't exist",
    ErrorsNames.TooManySignUpsError.value: 'Only one sing up per hour',

    ErrorsNames.InvalidAuthDataError.value: 'Auth data is invalid',
    ErrorsNames.UserBlockedError.value: 'User blocked',
    ErrorsNames.MaxAuthAttemptsError.value: 'Max auth attempts',
    ErrorsNames.SuspiciousActionError.value: 'Suspicious action. Request aborted',
    ErrorsNames.IPAddressBlockedError.value: 'IP address is blocked',
    ErrorsNames.APIKeyIsInvalid.value: 'Invalid API key',

    ErrorsNames.ClosedTicketError.value: 'Ticket is closed',

    ErrorsNames.InvalidPromoCodeError.value: 'Invalid promo code',
    ErrorsNames.ConditionsAreNotMetError.value: 'Conditions of the promo are not met',

    ErrorsNames.UnsupportedPromoTypeError.value: 'Unsupported promo condition',
    ErrorsNames.UnsupportedPromoCondition.value: 'Unsupported promo type',

    ErrorsNames.InvalidCarID.value: 'Invalid car ID',
    ErrorsNames.AllCarsWithThisIDAreRented.value: 'All cars with this ID are rented',
    ErrorsNames.AlreadyRent.value: 'User already rent something',
    ErrorsNames.NoRent.value: 'User does not rent anything',
    ErrorsNames.InvalidBicycleID.value: 'Invalid bicycle ID',
    ErrorsNames.AllBicyclesWithThisIDAreRented.value: 'All bicycles with this ID are rented',
    ErrorsNames.RentNotPaidError.value: 'Rent is not paid',
    ErrorsNames.DoubleRentPaymentError.value: 'Rent is already paid',
    ErrorsNames.InvalidMoneyCountRentPaymentError.value: 'Invalid money count to do rent payment',
}


def createErrorJsonResponse(code):
    return JsonResponse({'Error': code.value, 'Reason': reasons.get(code.value, 'Unknown reason')})


def request_check_POST(request):
    if request.method != 'POST':
        return ErrorsNames.NotPOSTRequestError

    if len(request.POST) == 0:
        return ErrorsNames.EmptyPostError

    if len(request.GET) != 0:
        return ErrorsNames.GETinPOSTError

    return 0
