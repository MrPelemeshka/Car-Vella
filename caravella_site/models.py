# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Activities(models.Model):
    name = models.CharField(max_length=128)
    codename = models.CharField(unique=True, max_length=128)

    class Meta:
        managed = False
        db_table = 'activities'


class BicycleRentPayments(models.Model):
    id = models.IntegerField(primary_key=True)
    rent = models.ForeignKey('BicyclesRents', models.DO_NOTHING)
    total_cost = models.DecimalField(max_digits=10, decimal_places=0)
    payment_time = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = False
        db_table = 'bicycle_rent_payments'
        unique_together = (('id', 'rent'),)


class BicyclesInventory(models.Model):
    inventory_id = models.AutoField(primary_key=True)
    bicycle = models.ForeignKey('BicyclesList', models.DO_NOTHING)
    bicycles_parking = models.ForeignKey('BicyclesParkings', models.DO_NOTHING, blank=True, null=True)
    is_rented_now = models.IntegerField(default=0)

    class Meta:
        managed = False
        db_table = 'bicycles_inventory'
        unique_together = (('inventory_id', 'bicycle'),)


class BicyclesList(models.Model):
    name = models.CharField(max_length=64)
    rent_price = models.FloatField()
    photo_path = models.CharField(max_length=256, blank=True, null=True)
    info = models.CharField(max_length=512, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'bicycles_list'


class BicyclesParkings(models.Model):
    name = models.CharField(max_length=128)
    address = models.CharField(max_length=128)

    class Meta:
        managed = False
        db_table = 'bicycles_parkings'


class BicyclesRents(models.Model):
    user = models.ForeignKey('Users', models.DO_NOTHING, blank=True, null=True)
    bicycle_inventory = models.ForeignKey(BicyclesInventory, models.DO_NOTHING, blank=True, null=True)
    rent_start_time = models.DateTimeField(auto_now_add=True)
    rent_start_use_time = models.DateTimeField(blank=True, null=True)
    rent_end_use_time = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'bicycles_rents'


class Brands(models.Model):
    name = models.CharField(max_length=128)

    class Meta:
        managed = False
        db_table = 'brands'


class CarsInventory(models.Model):
    inventory_id = models.AutoField(primary_key=True)
    car = models.ForeignKey('CarsList', models.DO_NOTHING)
    cars_parking = models.ForeignKey('CarsParkings', models.DO_NOTHING, blank=True, null=True)
    is_rented_now = models.IntegerField(default=0)

    class Meta:
        managed = False
        db_table = 'cars_inventory'
        unique_together = (('inventory_id', 'car'),)


class CarsList(models.Model):
    brand = models.ForeignKey(Brands, models.DO_NOTHING)
    name = models.CharField(max_length=255)
    rent_price = models.FloatField()
    photo_path = models.CharField(max_length=256, blank=True, null=True)
    info = models.CharField(max_length=1024, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'cars_list'
        unique_together = (('id', 'brand'),)


class CarsParkings(models.Model):
    name = models.CharField(max_length=128)
    address = models.CharField(max_length=128)

    class Meta:
        managed = False
        db_table = 'cars_parkings'


class CarsRentPayments(models.Model):
    id = models.IntegerField(primary_key=True)
    rent = models.ForeignKey('CarsRents', models.DO_NOTHING)
    total_cost = models.DecimalField(max_digits=10, decimal_places=0)
    payment_time = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = False
        db_table = 'cars_rent_payments'
        unique_together = (('id', 'rent'),)


class CarsRents(models.Model):
    users = models.ForeignKey('Users', models.DO_NOTHING, blank=True, null=True)
    cars_inventory_inventory = models.ForeignKey(CarsInventory, models.DO_NOTHING, blank=True, null=True)
    rent_start_time = models.DateTimeField(auto_now_add=True)
    rent_start_use_time = models.DateTimeField(blank=True, null=True)
    rent_end_use_time = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'cars_rents'


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class DriverValidationResult(models.Model):
    drivers_validation = models.ForeignKey('DriversValidation', models.DO_NOTHING)
    is_validated = models.IntegerField()
    comments = models.CharField(max_length=512, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'driver_validation_result'
        unique_together = (('id', 'drivers_validation'),)


class DriversValidation(models.Model):
    user = models.ForeignKey('Users', models.DO_NOTHING)
    validation_manager = models.ForeignKey('Users', models.DO_NOTHING, blank=True, null=True, related_name='manager')
    document_photo_path = models.CharField(max_length=256)

    class Meta:
        managed = False
        db_table = 'drivers_validation'


class PromoConditions(models.Model):
    name = models.CharField(max_length=64, blank=True, null=True)
    codename = models.CharField(max_length=64)

    class Meta:
        managed = False
        db_table = 'promo_conditions'


class PromoTypes(models.Model):
    name = models.CharField(max_length=64, blank=True, null=True)
    codename = models.CharField(max_length=64)

    class Meta:
        managed = False
        db_table = 'promo_types'


class Promocodes(models.Model):
    code = models.CharField(unique=True, max_length=64)
    activations_count = models.IntegerField(default=0)
    activations_limit = models.IntegerField()
    active_until = models.DateTimeField()
    promo_type = models.ForeignKey(PromoTypes, models.DO_NOTHING, db_column='promo_type')
    reward = models.IntegerField()
    promo_condition = models.ForeignKey(PromoConditions, models.DO_NOTHING, db_column='promo_condition')
    condition_value = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'promocodes'


class PromocodesActivations(models.Model):
    promocodes = models.ForeignKey(Promocodes, models.DO_NOTHING)
    users = models.OneToOneField('Users', models.DO_NOTHING, primary_key=True)
    activation_time = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = False
        db_table = 'promocodes_activations'
        unique_together = (('users', 'promocodes'),)


class QaChat(models.Model):
    Objects = models.Manager
    ticket = models.OneToOneField('QaTickets', models.DO_NOTHING, primary_key=True)
    user = models.ForeignKey('Users', models.DO_NOTHING)
    message_time = models.DateTimeField(auto_now_add=True)
    message = models.CharField(max_length=2048, db_collation='utf8mb4_0900_ai_ci')

    class Meta:
        managed = False
        db_table = 'qa_chat'


class QaTickets(models.Model):
    Objects = models.Manager
    ticket = models.IntegerField(primary_key=True)
    user = models.ForeignKey('Users', models.DO_NOTHING, db_column='user')
    title = models.CharField(max_length=128)
    creation_date = models.DateTimeField(auto_now_add=True)
    is_closed = models.IntegerField(default=0)

    class Meta:
        managed = False
        db_table = 'qa_tickets'
        unique_together = (('ticket', 'user'),)


class Roles(models.Model):
    Objects = models.Manager
    name = models.CharField(max_length=64, blank=True, null=True)
    codename = models.CharField(unique=True, max_length=128)
    access_level = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'roles'


class Users(models.Model):
    Objects = models.Manager
    role = models.ForeignKey(Roles, models.DO_NOTHING)
    username = models.CharField(max_length=64)
    key_fingerprint = models.CharField(max_length=128)
    creation_time = models.DateTimeField(auto_now_add=True)
    name = models.CharField(max_length=64)
    surname = models.CharField(max_length=64)
    age = models.IntegerField()
    is_validated_driver = models.IntegerField(default=0)
    email = models.CharField(max_length=128)
    is_email_confirmed = models.IntegerField(default=0)
    profile_photo_path = models.CharField(max_length=256, blank=True, null=True)
    is_user_blocked = models.IntegerField(default=0)

    class Meta:
        managed = False
        db_table = 'users'


class UsersActivities(models.Model):
    users = models.OneToOneField(Users, models.DO_NOTHING, primary_key=True)
    activities = models.ForeignKey(Activities, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'users_activities'
        unique_together = (('users', 'activities'),)


class UsersPasswordRecoveryTokens(models.Model):
    token = models.CharField(primary_key=True, max_length=64)
    user = models.ForeignKey(Users, models.DO_NOTHING)
    creation_time = models.DateTimeField(auto_now_add=True)
    expiration_time = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'users_password_recovery_tokens'
        unique_together = (('token', 'user'),)
