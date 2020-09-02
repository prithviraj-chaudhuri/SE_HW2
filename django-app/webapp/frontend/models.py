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

    def filter_records_1(self):
        try:
            records_ques = self.filter(question_id=1).all().values("question_id","token","response")
            return json.dumps(list(records_ques))
        except Exception as e:
            return []
    def filter_records_2(self):
        try:
            records_ques = self.filter(question_id=2).all().values("question_id","token","response")
            return json.dumps(list(records_ques))
        except Exception as e:
            return []
    def filter_records_3(self):
        try:
            records_ques = self.filter(question_id=3).all().values("question_id","token","response")
            return json.dumps(list(records_ques))
        except Exception as e:
            return []
    def filter_records_4(self):
        try:
            records_ques = self.filter(question_id=4).all().values("question_id","token","response")
            return json.dumps(list(records_ques))
        except Exception as e:
            return []
    def filter_records_5(self):
        try:
            records_ques = self.filter(question_id=5).all().values("question_id","token","response")
            return json.dumps(list(records_ques))
        except Exception as e:
            return []
    def filter_records_6(self):
        try:
            records_ques = self.filter(question_id=6).all().values("question_id","token","response")
            return json.dumps(list(records_ques))
        except Exception as e:
            return []
    def filter_records_7(self):
        try:
            records_ques = self.filter(question_id=7).all().values("question_id","token","response")
            return json.dumps(list(records_ques))
        except Exception as e:
            return []
    def filter_records_8(self):
        try:
            records_ques = self.filter(question_id=8).all().values("question_id","token","response")
            return json.dumps(list(records_ques))
        except Exception as e:
            return []

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
