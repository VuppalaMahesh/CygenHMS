# Generated by Django 2.2.5 on 2019-11-06 11:44

from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('appointments', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Bill',
            fields=[
                ('billid', models.SlugField(editable=False, primary_key=True, serialize=False)),
                ('amount', models.IntegerField(blank=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='BillGroup',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('group', models.PositiveSmallIntegerField(choices=[(1, 'OPD'), (2, 'LAB'), (3, 'MED')])),
            ],
        ),
        migrations.CreateModel(
            name='consultfee',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('amount', models.IntegerField(null=True)),
                ('is_paid', models.BooleanField(default=False)),
                ('generate_date', models.CharField(blank=True, max_length=300, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Consultion',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('amount', models.IntegerField(null=True)),
                ('is_paid', models.BooleanField(default=False)),
                ('timestamp', models.DateTimeField(default=django.utils.timezone.now)),
                ('appointment', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='appointments.Appointment')),
            ],
        ),
    ]
