# Generated by Django 2.2.5 on 2019-11-06 12:22

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('bms', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='appointbed',
            old_name='appointmentid',
            new_name='appointment',
        ),
        migrations.RenameField(
            model_name='appointbed',
            old_name='bedid',
            new_name='bed',
        ),
    ]
