import json
from django.db import models
from django.core import serializers
from datetime import datetime

class RecordManager(models.Manager):

    def create_record(self, token, language):
        start_time = str(datetime.now())
        end_time = ""
        duration = ""
        try:
            self.create(token=token, language=language, start_time=start_time, end_time=end_time, duration=duration)
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
    
    def update_record(self, token):
        record = self.get(token=token)
        if record:
            record.end_time = str(datetime.now())
            record.duration = ""
            record.save()
            return True, record
        else:
            return False, record


class Record(models.Model):

    class Meta:
        db_table = "log_record"

    log_record_id = models.AutoField(primary_key=True)
    token = models.CharField(max_length=20, blank=False, null=False)
    language = models.CharField(max_length=20, choices=(("g", "go"), ("r", "rust"), ("f", "fortran")),
                                blank=False, null=False)
    start_time = models.DateTimeField(blank=False, null=False)
    end_time = models.DateTimeField(null=False)
    duration = models.CharField(max_length=20, null=False, default="")
    objects = RecordManager()
