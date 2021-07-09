from rest_framework import serializers
from caravella_site.models import *


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = Users
        fields = ['name', 'surname']
