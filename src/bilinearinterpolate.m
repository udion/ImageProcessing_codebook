function [ oImg ] = bilinearinterpolate(iImg, newParams)
%BILINEARINTERPOLATE Summary of this function goes here
% to do a bilinear interpolation on image matrix
R = size(iImg,1);
C = size(iImg,2);
n_chals = size(iImg,3);
R_ = newParams(1);
C_ = newParams(2);

sR = R/R_;
sC = C/C_;

[cf,rf] = meshgrid(1:C_, 1:R_);
cf = cf*sC;
rf = rf*sR;
r = floor(rf);
c = floor(cf);

%placing cap on the values
r(r<1) = 1;
c(c<1) = 1;
r(r>R-1) = R-1;
c(c>C-1) = C-1;

d_r = rf-r;
d_c = cf-c;

iInd1 = sub2ind([R,C],r,c);
iInd2 = sub2ind([R,C],r+1,c);
iInd3 = sub2ind([R,C],r,c+1);
iInd4 = sub2ind([R,C],r+1,c+1);

oImg = zeros(R_,C_,n_chals);
oImg = cast(oImg, class(iImg));

for i=1:n_chals
    chanI = iImg(:,:,i);
    
    tmp = chanI(iInd1).*(1-d_r).*(1-d_c) + ...
        chanI(iInd2).*(d_r).*(1-d_c) + ...
        chanI(iInd3).*(1-d_r).*(d_c) + ...
        chanI(iInd4).*(d_r).*(d_c);
    oImg(:,:,i) =  cast(tmp, class(iImg));
end

