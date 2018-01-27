function [rgbResult] = alignChannels(red, green, blue)
% alignChannels - Given 3 images corresponding to different channels of a
%       color image, compute the best aligned result with minimum
%       aberrations
% Args:
%   red, green, blue - each is a matrix with H rows x W columns
%       corresponding to an H x W image
% Returns:
%   rgb_output - H x W x 3 color image output, aligned as desired

%% Write code here

max = realmax;
redRow = 0;
redCol = 0;
for i = -30:30
    red_s = circshift(red, i, 1);
    for j = -30:30
        red_s = circshift(red_s, j, 2);
        SSD = sum((blue(:) - red_s(:)).^2);
        if SSD < max
            max = SSD;
            redRow = i;
            redCol = j;
        end
    end   
end

max = realmax;
greenRow = 0;
greenCol= 0;
for i = -30:30
    green_s = circshift(green, i, 1);
    for j = -30:30
        green_s = circshift(green_s, j, 2);
        SSD = sum((blue(:) - green_s(:)).^2);
        if SSD < max
            max = SSD;
            greenRow = i;
            greenCol= j;
        end
    end   
end

redAlign = circshift(red, redRow, 1);
redAlign = circshift(redAlign, redCol, 2);

greenAlign = circshift(green, greenRow, 1);
greenAlign = circshift(greenAlign, greenCol, 2);

max = realmax;
blueRow = 0;
blueCol= 0;
for i = -30:30
    blue_s = circshift(blue, i, 1);
    for j = -30:30
        blue_s = circshift(blue_s, j, 2);
        SSD = sum((redAlign(:) - blue_s(:)).^2);
        if SSD < max
            max = SSD;
            blueRow = i;
            blueCol= j;
        end
    end   
end

blueAlign = circshift(blue, blueRow, 1);
blueAlign = circshift(blueAlign, blueCol, 2);

image = cat(3, red, green, blue);
figure(1);
imshow(image);

rgbResult = cat(3, redAlign, greenAlign, blueAlign);
figure(2);
imshow(rgbResult);
end
