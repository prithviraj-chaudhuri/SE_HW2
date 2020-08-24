import json
from django.db import models
from django.core import serializers

# Create your models here.


class TokenManager(models.Manager):

    def get_all_tokens(self):
        raw_results = self.raw("select log_token_id, token, token_used from log_token")
        results = []
        for raw_result in raw_results:
            result = dict()
            result["token"] = raw_result.token
            result["token_used"] = raw_result.token_used
            results.append(result)
        return results

    def get_unused_token(self):
        unused_tokens = self.filter(token_used=False).all()

        if unused_tokens:
            return json.loads(serializers.serialize('json', [unused_token for unused_token in unused_tokens]))
        else:
            return []

    def create_new_token(self, token: str):

        old_token = self.filter(token=token).all()

        if not old_token:

            try:
                new_token = self.create(token=token, token_used=False)
                return {
                    "status": 0,
                    "message": "success",
                    "data": [
                        {
                            "token_id": new_token.log_token_id,
                            "token": new_token.token
                        }
                    ]
                }
            except Exception as e:
                return {
                    "status": 1,
                    "message": "error",
                    "data": []
                }

        else:
            return {
                "status": 1,
                "message": "Token already exists.",
                "data": json.loads(serializers.serialize('json', [old_t for old_t in old_token]))
            }

    def update_token(self, token, token_used):

        token_entry = self.get(token=token)

        if token_entry:
            token_entry.token_used = token_used
            token_entry.save()
            return True
        else:
            return False

    def delete_token(self, token):

        token_entry = self.get(token=token)
        if token_entry:
            token_entry.delete()
            return True
        else:
            return False

    def use_token(self, token):
        unused_tokens = self.get_unused_token()
        for t in unused_tokens:
            if t['fields']['token'] == token:
                self.update_token(token, True)
                return True
        return False

class Token(models.Model):

    class Meta:
        db_table = "log_token"

    log_token_id = models.AutoField(primary_key=True)
    token = models.CharField(max_length=100, blank=False, null=False)
    token_used = models.BooleanField(default=False)
    objects = TokenManager()
