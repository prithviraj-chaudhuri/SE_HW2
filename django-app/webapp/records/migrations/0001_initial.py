# Generated by Django 3.1 on 2020-08-21 19:08

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Record',
            fields=[
                ('log_record_id', models.AutoField(primary_key=True, serialize=False)),
                ('language', models.CharField(choices=[('g', 'go'), ('r', 'rust'), ('f', 'fortran')], max_length=20)),
                ('start_time', models.DateTimeField()),
                ('end_time', models.DateTimeField()),
            ],
            options={
                'db_table': 'log_record',
            },
        ),
    ]
