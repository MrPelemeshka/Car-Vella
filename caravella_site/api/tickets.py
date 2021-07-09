from django.core.exceptions import ObjectDoesNotExist
from django.http import JsonResponse
from django.urls import path

from caravella_site.api.utilities import createErrorJsonResponse, request_check_POST, ErrorsNames

from caravella_site.models import QaTickets, QaChat, Users


def api_create_new_ticket(request):
    request_check = request_check_POST(request)

    if request_check != 0:
        return createErrorJsonResponse(request_check)

    if 'is_authorized' not in request.session:
        return createErrorJsonResponse(ErrorsNames.AccessError)

    if 'first_message' not in request.POST:
        return createErrorJsonResponse(ErrorsNames.MissingParameterError)

    if len(request.POST['first_message']) == 0:
        return createErrorJsonResponse(ErrorsNames.EmptyParameterError)

    if len(request.POST['first_message']) > QaChat._meta.get_field('message').max_length:
        return createErrorJsonResponse(ErrorsNames.InvalidStringLengthError)

    current_user = Users.objects.get(id=request.session['user_id'])
    new_ticket = QaTickets(user=current_user)
    first_message = QaChat(ticket=new_ticket, user=current_user)
    new_ticket.save()
    first_message.save()

    return JsonResponse({'done': 'ticket_creation'})


def api_get_tickets(request):
    request_check = request_check_POST(request)

    if request_check != 0:
        return createErrorJsonResponse(request_check)

    if 'is_authorized' not in request.session:
        return createErrorJsonResponse(ErrorsNames.AccessError)

    current_user = Users.objects.get(id=request.session['user_id'])

    response = {}

    if current_user.role.access_level == 0:
        tickets = QaTickets.objects.filter(user=current_user)
        if request.POST['opened_only'] == 1:
            tickets = tickets.filter(is_closed=0)

        for ticket in tickets:
            response.update({
                len(response) + 1:
                    {
                        'ticket': ticket.ticket,
                        'creation_date': ticket.creation_date,
                        'title': ticket.title,
                        'is_closed': ticket.is_closed,
                        'is_answered': is_ticket_answered(ticket)
                    }
            })
    else:
        tickets = QaTickets.objects.all()
        if request.POST['opened_only'] == 1:
            tickets = tickets.filter(is_closed=0)

        for ticket in tickets:
            response.update({
                len(response) + 1:
                    {
                        'user': ticket.user.name + ' ' + ticket.user.surname,
                        'ticket': ticket.ticket,
                        'creation_date': ticket.creation_date,
                        'title': ticket.title,
                        'is_closed': ticket.is_closed,
                        'is_answered': is_ticket_answered(ticket)
                    }
            })

    return JsonResponse(response)


def is_ticket_answered(ticket):
    last_message = ticket.objects.filter(ticket=ticket).latest('message_time')
    return int(last_message.user.role.access_level > 0)


def api_send_ticket_message(request):
    request_check = request_check_POST(request)

    if request_check != 0:
        return createErrorJsonResponse(request_check)

    if 'is_authorized' not in request.session:
        return createErrorJsonResponse(ErrorsNames.AccessError)

    if 'message' not in request.POST \
            or 'ticket_id' not in request.POST:
        return createErrorJsonResponse(ErrorsNames.MissingParameterError)

    if len(request.POST['message']) == 0 \
            or len(request.POST['ticket_id']) == 0:
        return createErrorJsonResponse(ErrorsNames.EmptyParameterError)

    if len(request.POST['message']) > QaChat._meta.get_field('message').max_length:
        return createErrorJsonResponse(ErrorsNames.InvalidStringLengthError)

    current_user = Users.objects.get(id=request.session['user_id'])

    try:
        ticket = QaTickets.Objects.get(ticket=request.POST['ticket_id'])
    except ObjectDoesNotExist:
        return createErrorJsonResponse(ErrorsNames.SuspiciousActionError)

    if current_user.role.access_level == 0 \
            and ticket.user.id != current_user.id:
        return createErrorJsonResponse(ErrorsNames.SuspiciousActionError)

    if ticket.is_closed == 1:
        return createErrorJsonResponse(ErrorsNames.ClosedTicketError)

    message = QaChat(ticket=ticket, user=current_user, message=request.POST['message'])
    message.save()

    return JsonResponse({'done': 'message_send'})


def api_get_ticket_messages(request):
    request_check = request_check_POST(request)

    if request_check != 0:
        return createErrorJsonResponse(request_check)

    if 'is_authorized' not in request.session:
        return createErrorJsonResponse(ErrorsNames.AccessError)

    if 'ticket_id' not in request.POST:
        return createErrorJsonResponse(ErrorsNames.MissingParameterError)

    if len(request.POST['ticket_id']) == 0:
        return createErrorJsonResponse(ErrorsNames.EmptyParameterError)

    current_user = Users.objects.get(id=request.session['user_id'])

    try:
        ticket = QaTickets.Objects.get(ticket=request.POST['ticket_id'])
    except ObjectDoesNotExist:
        return createErrorJsonResponse(ErrorsNames.AccessError)

    if current_user.role.access_level == 0 \
            and ticket.user.id != current_user.id:
        return createErrorJsonResponse(ErrorsNames.AccessError)

    messages = QaChat.Objects.filter(ticket=ticket)
    response = {}

    for message in messages:
        response.update({
            len(response) + 1:
                {
                    'is_user': int(message.user.role.access_level == 0),
                    'message_time': message.message_time,
                    'message': message.message,
                }
        })

    return JsonResponse(response)


def api_close_ticket(request):
    request_check = request_check_POST(request)

    if request_check != 0:
        return createErrorJsonResponse(request_check)

    if 'is_authorized' not in request.session:
        return createErrorJsonResponse(ErrorsNames.AccessError)

    if 'ticket_id' not in request.POST:
        return createErrorJsonResponse(ErrorsNames.MissingParameterError)

    if len(request.POST['ticket_id']) == 0:
        return createErrorJsonResponse(ErrorsNames.EmptyParameterError)

    current_user = Users.objects.get(id=request.session['user_id'])

    if current_user.role.access_level == 0:
        return createErrorJsonResponse(ErrorsNames.AccessError)

    try:
        ticket = QaTickets.Objects.get(ticket=request.POST['ticket_id'])
    except ObjectDoesNotExist:
        return createErrorJsonResponse(ErrorsNames.AccessError)

    if ticket.is_closed == 1:
        return createErrorJsonResponse(ErrorsNames.ClosedTicketError)

    ticket.is_closed = 1
    ticket.save()

    return JsonResponse({'done': 'ticket_closed'})


urlpatterns = [
    path('create_new_ticket', api_create_new_ticket, name='create_new_ticket'),
    path('get_tickets', api_get_tickets, name='get_tickets'),
    path('send_ticket_message', api_send_ticket_message, name='send_ticket_message'),
    path('get_ticket_messages', api_get_ticket_messages, name='get_ticket_messages'),
    path('close_ticket', api_close_ticket, name='close_ticket'),
]
