% Problem 1: Image Alignment

%% 1. Load images (all 3 channels)
red = load('../data/red.mat');  % Red channel
red = red.red;
green = load('../data/green.mat');  % Green channel
green = green.green;
blue = load('../data/blue.mat');  % Blue channel
blue = blue.blue;

%% 2. Find best alignment
% Hint: Lookup the 'circshift' function
tic;
rgbResult = alignChannels(red, green, blue);
toc;

%% 3. Save result to rgb_output.jpg (IN THE "results" folder)
imwrite(rgbResult, '../result/rbg_output4.jpg');