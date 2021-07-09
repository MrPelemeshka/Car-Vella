from django.core.exceptions import ObjectDoesNotExist
from django.http import JsonResponse
from django.urls import path
from django.utils.datetime_safe import datetime

from caravella_site.api.utilities import ErrorsNames, createErrorJsonResponse, request_check_POST
from caravella_site.models import CarsList, CarsInventory, Users, CarsRents


def api_get_list(request):
    request_check = request_check_POST(request)

    if request_check != 0 and request_check != ErrorsNames.EmptyPostError:
        return createErrorJsonResponse(request_check)

    cars = CarsList.objects.all()

    response = {}

    for car in cars:
        response.update({
            len(response) + 1: {
                'id': car.id,
                'brand': car.brand.name,
                'name': car.name,
                'rent_price': car.rent_price,
                'photo_path': car.photo_path,
                'info': car.info,
            }
        })

    return JsonResponse(response)


def api_get_car_info(request):
    request_check = request_check_POST(request)

    if request_check != 0:
        return createErrorJsonResponse(request_check)

    if 'id' not in request.POST:
        return createErrorJsonResponse(ErrorsNames.MissingParameterError)

    try:
        car = CarsList.objects.get(id=request.POST['id'])
    except ObjectDoesNotExist:
        return createErrorJsonResponse(ErrorsNames.InvalidCarID)

    return JsonResponse({
                'id': car.id,
                'brand': car.brand.name,
                'name': car.name,
                'rent_price': car.rent_price,
                'photo_path': car.photo_path,
                'info': car.info,
    })


def api_rent(request):
    request_check = request_check_POST(request)

    if request_check != 0:
        return createErrorJsonResponse(request_check)

    if 'id' not in request.POST:
        return createErrorJsonResponse(ErrorsNames.MissingParameterError)

    if 'is_authorized' not in request.session:
        return createErrorJsonResponse(ErrorsNames.NotAuthorizedSessionError)

    if 'rented_car_id' in request.session \
            or 'rented_bicycle_id' in request.session:
        return createErrorJsonResponse(ErrorsNames.AlreadyRent)

    try:
        car_info = CarsList.objects.get(id=request.POST['id'])
    except ObjectDoesNotExist:
        return createErrorJsonResponse(ErrorsNames.InvalidCarID)

    inventory_cars = CarsInventory.filter(car_id=car_info.id, is_rented_now=0)

    if len(inventory_cars) == 0:
        return createErrorJsonResponse(ErrorsNames.AllCarsWithThisIDAreRented)

    rented_car = inventory_cars[0]

    request.session['rented_car_id'] = rented_car.inventory_id
    rented_car.is_rented_now = 1
    rented_car.save()

    rent_info = CarsRents(
        users=Users.objects.get(id=request.session['user_id']),
        cars_inventory_inventory=rented_car.inventory_id,
        rent_start_use_time=datetime.now)
    rent_info.save()

    return JsonResponse({'done': 'start_car_rent'})


def api_get_rent(request):
    request_check = request_check_POST(request)

    if request_check != 0 and request_check != ErrorsNames.EmptyPostError:
        return createErrorJsonResponse(request_check)

    try:
        rent = CarsRents.objects.get(cars_inventory_inventory=request.session['rented_car_id'])
    except ObjectDoesNotExist:
        del request.session['rented_car_id']
        return createErrorJsonResponse(ErrorsNames.InvalidCarID)

    return JsonResponse({
                'rent_start_time': rent.rent_start_time,
                'rent_start_use_time': rent.rent_start_use_time,
                'id': rent.cars_inventory_inventory.id,
                'brand': rent.cars_inventory_inventory.brand.name,
                'name': rent.cars_inventory_inventory.name,
                'rent_price': rent.cars_inventory_inventory.rent_price,
                'photo_path': rent.cars_inventory_inventory.photo_path,
                'info': rent.cars_inventory_inventory.info,
    })


def api_end_rent(request):
    request_check = request_check_POST(request)

    if request_check != 0 and request_check != ErrorsNames.EmptyPostError:
        return createErrorJsonResponse(request_check)

    if 'rented_car_id' not in request.session:
        return createErrorJsonResponse(ErrorsNames.NoRent)

    if 'rent_is_paid' not in request.session:
        return createErrorJsonResponse(ErrorsNames.RentNotPaidError)

    try:
        rent = CarsRents.objects.get(cars_inventory_inventory=request.session['rented_car_id'])
    except ObjectDoesNotExist:
        del request.session['rented_car_id']
        return createErrorJsonResponse(ErrorsNames.InvalidCarID)

    car = rent.cars_inventory_inventory
    car.is_rented_now = 0
    car.save()

    rent.rent_end_use_time = datetime.now
    rent.save()

    del request.session['rent_is_paid']
    del request.session['rented_car_id']

    return JsonResponse({'done': 'rent_ended'})


def api_pay_car_rent(request):
    request_check = request_check_POST(request)

    if request_check != 0:
        return createErrorJsonResponse(request_check)

    if 'money_paid' not in request.POST:
        return createErrorJsonResponse(ErrorsNames.MissingParameterError)

    if 'rented_car_id' not in request.session:
        return createErrorJsonResponse(ErrorsNames.NoRent)

    if 'rent_is_paid' in request.session:
        return createErrorJsonResponse(ErrorsNames.DoubleRentPaymentError)

    try:
        rent = CarsRents.objects.get(cars_inventory_inventory=request.session['rented_car_id'])
    except ObjectDoesNotExist:
        del request.session['rented_car_id']
        return createErrorJsonResponse(ErrorsNames.InvalidCarID)

    car = rent.cars_inventory_inventory

    if (datetime.now() - rent.rent_start_time).total_seconds()/60*car.rent_price == request.POST['money_paid']:
        return createErrorJsonResponse(ErrorsNames.InvalidMoneyCountRentPaymentError)

    request.session['rent_is_paid'] = 1

    return JsonResponse({'done': 'car_rent_payment'})


urlpatterns = [
    path('list', api_get_list, name='list'),
    path('car', api_get_car_info, name='get_car_info'),
    path('rent', api_rent, name='rent'),
    path('rent_info', api_get_rent, name='rent_info'),
    path('end_rent', api_end_rent, name='end_rent'),
    path('pay_car_rent', api_pay_car_rent, name='pay_car_rent'),
]