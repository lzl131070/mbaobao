# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2018-11-06 07:46
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mbbapp', '0016_auto_20181106_0741'),
    ]

    operations = [
        migrations.RenameField(
            model_name='cart',
            old_name='goodnum',
            new_name='good',
        ),
        migrations.RenameField(
            model_name='cart',
            old_name='username',
            new_name='user',
        ),
    ]
