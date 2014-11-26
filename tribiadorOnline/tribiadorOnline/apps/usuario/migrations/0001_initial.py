# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import tribiadorOnline.apps.usuario.thumbs
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Perfil',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('pais', models.CharField(max_length=b'30')),
                ('avatar', tribiadorOnline.apps.usuario.thumbs.ImageWithThumbsField(upload_to=b'img_user')),
                ('user', models.OneToOneField(to=settings.AUTH_USER_MODEL)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
