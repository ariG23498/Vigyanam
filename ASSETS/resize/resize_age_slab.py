import cv2
import os

req_path = os.path.dirname(os.getcwd()) # req_path = 'E:/SIH19/sih-app-designs/ASSETS'
os.chdir(req_path + '/TESTS/Age-slab') 
files = os.listdir()
print(files)


for file in files:
	if file.endswith(".png"):
		image = cv2.imread(file)
		width = image.shape[1]	#current image's width
		height = image.shape[0]	#current image's height 

		r = 500/image.shape[1]
		dim = (500,int(r*image.shape[0]))

		resized_img = cv2.resize(image,dim,interpolation = cv2.INTER_AREA)
		cv2.imwrite(file[:-4]+'test.png', resized_img)

