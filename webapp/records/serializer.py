from rest_framework import serializers


class RecordSerializer(serializers.Serializer):

    language = serializers.ChoiceField(choices=("go", "rust", "fortran"), required=True)
    start_time = serializers.DateTimeField(required=True)
    end_time = serializers.DateTimeField(required=True)

    def update(self, instance, validated_data):
        pass

    def create(self, validated_data):
        pass
