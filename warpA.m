function [ warp_im ] = warpA( im, A, out_size )
% warp_im=warpAbilinear(im, A, out_size)
% Warps (w,h,1) image im using affine (3,3) matrix A 
% producing (out_size(1),out_size(2)) output image warp_im
% with warped  = A*input, warped spanning 1..out_size
% Uses nearest neighbor mapping.
% INPUTS:
%   im : input image
%   A : transformation matrix 
%   out_size : size the output image should be
% OUTPUTS:
%   warp_im : result of warping im by A
X = 1:out_size(2);
Y = 1:out_size(1);
warp_im = zeros(out_size(2), out_size(1));

for i = 1:out_size(2)
    for j = 1:out_size(1)
        sourceCoord = inv(A) * [X(i); Y(j); 1];
        x = round(sourceCoord(1));
        y = round(sourceCoord(2));
        if x < 1 || x > out_size(2) || y < 1 || y > out_size(1)
            warp_im(j, i) = 0;
        else
            warp_im(j, i) = im(y, x);
        end
    end
end
warp_im = warp_im(:, 1:150);

