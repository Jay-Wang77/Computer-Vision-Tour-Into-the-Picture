function [foreground, img]= maskBackground(img, poss)
foreground = [];

Y = rgb2gray(img);
L = superpixels(Y,2000);
y_sp_fore= poss(:,2);
x_sp_fore= poss(:,1);
roi = poly2mask(x_sp_fore,y_sp_fore,size(img,1),size(img,2));
BW = grabcut(img,L,roi);
% BW = imcrop(img,x_sp_fore,y_sp_fore);
foreground = img;
foreground(repmat(~BW,[1 1 3])) = 0;
% foreground = fgTransparency(foreground)

img(repmat(BW,[1 1 3])) = 0;
img = inpaintExemplar(img,BW,'FillOrder','gradient');
end
