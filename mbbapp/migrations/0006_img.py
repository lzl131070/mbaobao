# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2018-10-29 12:37
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mbbapp', '0005_user_token'),
    ]

    operations = [
        migrations.CreateModel(
            name='Img',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('num', models.CharField(max_length=20)),
                ('img', models.CharField(max_length=256)),
                ('name', models.CharField(max_length=256)),
            ],
        ),
    ]