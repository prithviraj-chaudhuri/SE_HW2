from django.db import models
from django.core import serializers
from django.core.validators import MinValueValidator, MaxValueValidator
import json


# Create your models here.


class QuestionnaireManager(models.Manager):

    def get_all_questions(self):

        questions = self.filter().all()

        if questions:
            return json.loads(serializers.serialize('json', [question for question in questions]))
        else:
            return []


class Questionnaire(models.Model):

    class Meta:
        db_table = "log_questionnaire"

    question_id = models.AutoField(primary_key=True)
    question = models.CharField(max_length=10000, blank=False, null=False)
    objects = QuestionnaireManager()


class QuestionnaireResponseManager(models.Manager):

    def create_new_responses(self, responses):

        for response in responses:
            self.create(token=response["token"], question_id=response["question_id"],
                        response=response["response"])

        return responses

    def get_responses(self, token=None):

        if token:
            responses = self.filter(token=token).all()
        else:
            responses = self.filter().all()

        return json.loads(serializers.serialize('json', [response for response in responses]))


class QuestionnaireResponse(models.Model):

    class Meta:
        db_table = "log_questionnaire_response"

    log_questionnaire_response_id = models.AutoField(primary_key=True)
    token = models.CharField(max_length=20, null=False, blank=False)
    question_id = models.BigIntegerField(null=False, blank=False)
    response = models.PositiveIntegerField(default=1, validators=[
        MinValueValidator(1), MaxValueValidator(5)
    ])
    objects = QuestionnaireResponseManager()
