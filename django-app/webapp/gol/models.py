import json
from django.db import models
from django.core import serializers

# Create your models here.


class ScriptManager(models.Manager):

    def get_all_scripts(self):
        raw_results = self.raw("select script_id, script_title, download_link, raw_url from scripts")
        results = []
        for raw_result in raw_results:
            result = dict()
            result["script_id"] = raw_result.script_id
            result["script_title"] = raw_result.script_title
            result["download_link"] = raw_result.download_link
            result["raw_url"] = raw_result.raw_url
            results.append(result)
        return results


class Scripts(models.Model):

    class Meta:
        db_table = "scripts"

    script_id = models.AutoField(primary_key=True)
    script_title = models.CharField(max_length=100, blank=False, null=False)
    download_link = models.CharField(max_length=500, blank=False, null=False)
    raw_url = models.CharField(max_length=500, blank=False, null=False)

    objects = ScriptManager()