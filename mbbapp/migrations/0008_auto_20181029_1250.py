# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2018-10-29 12:50
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mbbapp', '0007_auto_20181029_1239'),
    ]

    operations = [
        migrations.AlterField(
            model_name='img',
            name='name',
            field=models.CharField(max_length=80, unique=True),
        ),
        migrations.AlterField(
            model_name='img',
            name='num',
            field=models.CharField(max_length=20),
        ),
    ]
