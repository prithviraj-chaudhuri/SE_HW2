import json
from django.db import models
from django.core import serializers
from datetime import datetime

class RecordManager(models.Manager):

    def create_record(self, token, language):
        start_time = datetime.now().isoformat()
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
    
    def update_record(self, token, language):
        record = self.get(token=token, language=language)
        if record:
            start_time = datetime.strptime(record.start_time, '%Y-%m-%dT%H:%M:%S.%f')
            end_time = datetime.now()
            record.end_time = end_time.isoformat()
            difference = (end_time - start_time)
            record.duration = str(difference.total_seconds())
            record.save()
            return True
        else:
            return False


class Record(models.Model):

    class Meta:
        db_table = "log_record"

    log_record_id = models.AutoField(primary_key=True)
    token = models.CharField(max_length=20, blank=False, null=False)
    language = models.BigIntegerField(null=False, blank=False)
    start_time = models.CharField(max_length=100, null=False)
    end_time = models.CharField(max_length=100, null=False)
    duration = models.CharField(max_length=200, null=False, default="")
    objects = RecordManager()
