import json
from django.db import models
from django.core import serializers


class RecordManager(models.Manager):

    def create_record(self, token, language, start_time, end_time):
        try:
            self.create(token=token, language=language, start_time=start_time, end_time=end_time)
            return True
        except Exception as e:
            return False

    def get_records(self, token=None):

        try:
            if not token:
                records = self.filter().all()
            else:
                records = self.filter(token=token).all()
            return json.loads(serializers.serialize('json', [record for record in records]))
        except Exception as e:
            return []


class Record(models.Model):

    class Meta:
        db_table = "log_record"

    log_record_id = models.AutoField(primary_key=True)
    token = models.CharField(max_length=20, blank=False, null=False)
    language = models.CharField(max_length=20, choices=(("g", "go"), ("r", "rust"), ("f", "fortran")),
                                blank=False, null=False)
    start_time = models.DateTimeField(blank=False, null=False)
    end_time = models.DateTimeField(blank=False, null=False)
    objects = RecordManager()
