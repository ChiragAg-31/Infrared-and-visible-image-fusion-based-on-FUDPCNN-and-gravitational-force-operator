clear all
close all
img1=imread('IR1.bmp');  %Infrared Image
figure, imshow(img1)
img2=imread('VS1.bmp');  %Visible Image
figure, imshow(img2)
tic
img1=double(img1);
img2=double(img2);
img1=img1/255;%Image Normalization
img2=img2/255;%Image Normalization
F=MAIN_FUSION_FUDPCNN_Grav_Force(img1,img2);
F=F*255;
F=uint8(F);
t=toc;
figure, imshow(F)






        