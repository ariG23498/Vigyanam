import cv2
import os
import csv

req_path = os.path.dirname(os.getcwd()) # req_path = 'E:/SIH19/sih-app-designs/ASSETS'
os.chdir(req_path + '/TESTS') # for Age-slab dir -> '/Age-slab'
files = os.listdir()

# print(files)

img_detail = dict()

for file in files:
	if file.endswith(".png"):
		img = cv2.imread(file)
		img_detail[file] = img.shape

# print(img_detail)

with open('asset_detail.csv', 'w') as csv_file:
    writer = csv.writer(csv_file)
    for key, value in img_detail.items():
       writer.writerow([key, value])