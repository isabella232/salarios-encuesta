# Generated by Django 3.0 on 2019-12-23 19:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('encuesta', '0013_auto_20191221_1445'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Answer',
        ),
        migrations.AddField(
            model_name='answerset',
            name='ip_address',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='answerset',
            name='recaptcha_score',
            field=models.DecimalField(decimal_places=1, max_digits=2, null=True),
        ),
    ]
