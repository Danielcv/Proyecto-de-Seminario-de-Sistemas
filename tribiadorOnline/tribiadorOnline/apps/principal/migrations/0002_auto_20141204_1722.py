# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('principal', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='tema',
            options={'permissions': (('ver_tema', 'permite ver el tema'),)},
        ),
        migrations.AddField(
            model_name='respuesta',
            name='respusta_opcional3',
            field=models.CharField(default=1, max_length=500),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='respuesta',
            name='respusta_opcional4',
            field=models.CharField(default=1, max_length=500),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='respuesta',
            name='respusta_opcional5',
            field=models.CharField(default=1, max_length=500),
            preserve_default=False,
        ),
    ]
