from django.db import models
# Create your models here.

class Tema(models.Model):
	nombre=models.CharField(max_length=30,unique=True)
	# class Meta:
	# 	 permissions=(
	# 	 	("ver_tema","permite ver el tema"),
	# 	 	)
	def __unicode__(self):
		return self.nombre

class Pregunta(models.Model):
	nombre=models.CharField(max_length=500)
	tema=models.ForeignKey(Tema)
	def __unicode__(self):
	 	return self.nombre

class Respuesta(models.Model):
	respuesta_correcta=models.CharField(max_length=500)
	respusta_opcional=models.CharField(max_length=500)
	respusta_opcional3=models.CharField(max_length=500)
	respusta_opcional4=models.CharField(max_length=500)
	respusta_opcional5=models.CharField(max_length=500)
	pregunta=models.ForeignKey(Pregunta)
	def __str__(self):
	 	return self.respuesta_correcta
