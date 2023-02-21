%import image 
clc; clear;
obj = imread('C:\Users\yash\Desktop\footballwhite.jpg');
imshow(obj)  

% segment image 
red = obj(:,:,1);
green = obj(:,:,2);  
blue = obj(:,:,3);
figure(1);
subplot(2,2,1); imshow(obj); title('Original image');
subplot(2,2,2); imshow(red); title(' Red plane');
subplot(2,2,3); imshow(green); title('Green plane');
subplot(2,2,4); imshow(blue); title('Blue plane ');
%threshold blue phase 
figure(2)
level= 0.3;
bw2 = imbinarize(blue,level);
subplot(2,2,1);imshow(bw2); title('Blue plane threshold');

%Remove noise 
fill = imfill(bw2,'holes');
subplot(2,2,2); imshow(fill); title('Holes filled');
clear = imclearborder(fill);
subplot(2,2,3); imshow(clear); title('clear the border');
se = strel('disk',7);
open = imopen(fill,se); 
subplot(2,2,4); imshow(open); title('Remove small blobs');

%Measure diameter of object 
diameter = regionprops(open,'MajorAxisLength')
figure(3)
imshow(obj);
d = imdistline;