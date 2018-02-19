%% Knife Edge Detection Function

% edge function only reads a 2D array and for some reason our knife edge
% image is stored as a 3D array. Have to convert to RGB, then from RBS to
% grayscale in order to reduce to 2D 

RGB= imread('knife-mean.png');
%imshow(RGB);
I = rgb2gray(RGB);
figure
%imshow(I)
%IM2 = imcomplement(I);
%BW = edge(IM2);
BW=edge(I,'sobel');
final_I=imcomplement(BW);
%imshow(BW);
imshow(final_I);

% select an AOI (the edge)
[AOI, rect] = imcrop(final_I); % where [xmin ymin width height]
figure
imagesc(AOI)
colormap gray;
axis image;
colorbar;

% if pixel=black or a value of 0, then store pixel location in vector

[row, column] = find(AOI == 0);        

% find a best fit line for the edge values
% find the line y=mx+b that defines the edge

plot(row,column)
xlabel('row')
ylabel('column')
        
% -0.082*(row)+ 46=column ** this is the eqn for edge **
% find where perp line intersects with edge line

% perp_slop = 12.195

% find the distance of the pixels in the image 
% then find the perpendicular distance of each pixel to that edge by...
% finding the intersection of horizontal, perp line to edge line and
% measuring distance from pixel to that point on the edge
% also don't forget to make the edge line 0

distance_vec=zeros(1,size(AOI))
for i=1:size(AOI)
    
dist=sqrt((y2-y1)^2+(x2-x1)^2);%%%% Where (x1,y1) and (x2,y2) are coordinates of two pixels




