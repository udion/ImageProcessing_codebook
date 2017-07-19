I = imread('../images/input/img1.jpg');
imshow(I);
%to convert it into myGreyscale
myGreyI = pixAvg(I);
figure;
imshow(myGreyI);
figure;
imhist(myGreyI);

%to improve the contrast of the image
%I will use histogram equality
betterContrast = histeq(myGreyI);
figure;
imshow(betterContrast);
figure;
imhist(betterContrast);

%writing the images
imwrite(myGreyI,'../images/output/b4ContrastImg1.jpg');
imwrite(betterContrast, '../images/output/afterContrastImg1.jpg');