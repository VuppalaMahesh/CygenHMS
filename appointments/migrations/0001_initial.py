# Generated by Django 2.2.5 on 2019-11-06 11:44

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Appointment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('appointmentType', models.PositiveSmallIntegerField(choices=[(1, 'in-patient'), (2, 'out-patient')], default=2)),
                ('flag', models.PositiveSmallIntegerField(choices=[(0, 'closed'), (1, 'active'), (2, 'not applicable')], default=2)),
                ('bookingdate', models.DateField(null=True)),
                ('bookingtime', models.TimeField(null=True)),
            ],
        ),
        migrations.CreateModel(
            name='BlockSlots',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('blockdate', models.DateField(null=True)),
                ('blockslot', models.TimeField(null=True)),
            ],
        ),
        migrations.CreateModel(
            name='DoctorSlots',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('starttime', models.TimeField(blank=True, null=True)),
                ('endtime', models.TimeField(blank=True, null=True)),
                ('consultationfee', models.IntegerField(null=True)),
                ('breakslots', models.TextField(blank=True, null=True)),
                ('appointmnetduration', models.CharField(blank=True, max_length=100, null=True)),
            ],
        ),
    ]
