from django.db import models

# Create your models here.
class Registro(models.Model):
	nombre=models.CharField(max_length=100)
	email=models.EmailField()
	password=models.CharField(max_length=100)
	fecha=models.DateField()
	hora=models.TimeField()
	def __unicode__(self):
		return self.nombre