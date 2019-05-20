from django.db import models
#from PIL import Image as Img
#import io
#from django.core.files.uploadedfile import InMemoryUploadedFile
# Create your models here.
class Surat(models.Model):
	Ady = models.CharField(max_length=100)
	image = models.ImageField()

	# def save(self, *args, **kwargs):
	# 	if self.image:
	# 		img = Img.open( io.BytesIO( self.image.read() ) )
	# 		if img.mode != "RGB":
	# 			img.convert('RGB')
	# 		width, height = img.size    #1
	# 		if width > 640 or height > 480:
	# 			width, height = 640, 480
	# 		img.resize( (width, height), Img.ANTIALIAS )   #2
			# save_buff = io.BytesIO()    #3
			# img.save( save_buff, format="JPEG", optimize=True, quality=70)   #4
			# self.image = InMemoryUploadedFile( save_buff, 'ImageField', self.image.name.split( '.' )[0], 'image/jpeg',"utf-8", None )
		# super( Surat, self ).save( *args, **kwargs )