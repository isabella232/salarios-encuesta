# Generated by Django 3.0 on 2019-12-23 22:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('encuesta', '0014_auto_20191223_1344'),
    ]

    operations = [
        migrations.AlterField(
            model_name='answeritem',
            name='answer',
            field=models.CharField(max_length=200),
        ),
    ]
