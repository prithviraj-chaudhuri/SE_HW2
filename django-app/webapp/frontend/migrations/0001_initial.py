# Generated by Django 3.1 on 2020-08-23 19:05

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Questionnaire',
            fields=[
                ('question_id', models.AutoField(primary_key=True, serialize=False)),
                ('question', models.CharField(max_length=10000)),
            ],
            options={
                'db_table': 'log_questionnaire',
            },
        ),
    ]
