input_dir = 'C:\Users\MyPC\Desktop\Test\atnt\s1\';
 
filenames = dir(fullfile(input_dir, '*.pgm'));
num_images = length(filenames);
images = [];

for n = 1:num_images
    filename = fullfile(input_dir, filenames(n).name);
    img = imread(filename);
%     figure
%     imshow(img);
    images(:,n) = img(:);
end

mean_face = mean(images, 2);
% shifted_im = images - repmat(mean_face, 1, num_images);
shifted_images =[];

for n=1:num_images
    shifted_images(:,n)= images(:,n)-mean_face;

end

