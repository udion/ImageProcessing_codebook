function avgI = pixAvg(I)
%this sets the value of each channel of the pixel
%equal to the average of the values in 3 channels of that
%pixel, the final image will be a grayscale kind of image
    r = I(:,:,1);
    b = I(:,:,2);
    g = I(:,:,3);
    
    avgI = (r+b+g)/3;
end

