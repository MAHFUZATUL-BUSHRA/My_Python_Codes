import cv2
import numpy as np

# Code Segment 01 : Read Saved Image
img = cv2.imread("path_to_image/image_name.png")
cv2.imshow("Image",img)
cv2.waitKey(0)


# Code Segment 02 : Read saved Video
frameWidth = 640
frameHeight = 480
cap = cv2.VideoCapture("path_to_video/video_name.mp4")
while True:
    success, img = cap.read()
    img = cv2.resize(img, (frameWidth, frameHeight))
    cv2.imshow("Result", img)
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break


# Code Segment 03 : Take Videostream from Webcam
frameWidth = 640
frameHeight = 480
cap = cv2.VideoCapture(0)
cap.set(3, frameWidth)
cap.set(4, frameHeight)
cap.set(10, 150)
while True:
    success, img = cap.read()
    cv2.imshow("videostream", img)
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break


# Code Segemnt 04 : basic image manipulation 
# functions
img = cv2.imread("path_to_image/image_name.png")
kernel = np.ones((5,5),np.uint8)
 
imgGray = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
imgBlur = cv2.GaussianBlur(imgGray,(7,7),0)
imgCanny = cv2.Canny(img,150,200)
imgDialation = cv2.dilate(imgCanny,kernel,iterations=1)
imgEroded = cv2.erode(imgDialation,kernel,iterations=1)
 
cv2.imshow("Gray Image",imgGray)
cv2.imshow("Blur Image",imgBlur)
cv2.imshow("Canny Image",imgCanny)
cv2.imshow("Dialation Image",imgDialation)
cv2.imshow("Eroded Image",imgEroded)
cv2.waitKey(0)



# Code Segemnt 05 : image crop and resize
img = cv2.imread("path_to_image/image_name.png")
print(img.shape)

imgResize = cv2.resize(img,(1000,500))
print(imgResize.shape)

imgCropped = img[46:119,352:495]

cv2.imshow("Image",img)
#cv2.imshow("Image Resize",imgResize)
cv2.imshow("Image Cropped",imgCropped)

cv2.waitKey(0)


# Code Segment 06 : Face detection in Photos
import cv2
import numpy as np

faceCascade= cv2.CascadeClassifier("all_haarcascades/haarcascade_frontalface_default.xml")
img = cv2.imread('Resources/Lenna.png')
imgGray = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)

faces = faceCascade.detectMultiScale(imgGray,1.1,4)

for (x,y,w,h) in faces:
    cv2.rectangle(img,(x,y),(x+w,y+h),(255,0,0),2)


cv2.imshow("Result", img)
cv2.waitKey(0)


# Code Segment 07 : Face detection in Video Stream

faceCascade= cv2.CascadeClassifier("all_haarcascades/haarcascade_frontalface_default.xml")
frameWidth = 640
frameHeight = 480
cap = cv2.VideoCapture(0)
cap.set(3, frameWidth)
cap.set(4, frameHeight)
cap.set(10, 150)
while True:
    success, img = cap.read()
    imgGray = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
    faces = faceCascade.detectMultiScale(imgGray,1.1,4)
    for (x,y,w,h) in faces:
        cv2.rectangle(img,(x,y),(x+w,y+h),(255,0,0),2)

    cv2.imshow("videostream", img)

    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

