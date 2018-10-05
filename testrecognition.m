input_dir = 'C:\Users\MyPC\Desktop\Test\atnt\s1\';

 
filenames = dir(fullfile(input_dir, '*.pgm'));
num_images = length(filenames);
images = [];

for n = 1:num_images
    filename = fullfile(input_dir, filenames(n).name);
    img = imread(filename);
    
    images(:, n) = img(:);
end


