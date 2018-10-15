input_dir = 'G:\Test\atnt\s1\';
 
filenames = dir(fullfile(input_dir, '*.pgm'));
num_images = length(filenames);
images = [];

for n = 1:num_images
    filename = fullfile(input_dir, filenames(n).name);
    img = imread(filename);
    img = im2double(img);
    images(:,n) = img(:);
end

mean_face = mean(images, 2);
image_diff =[];

for n=1:num_images
    image_diff(:,n)= images(:,n)-mean_face;

end



image_diff_tr= image_diff';
L = image_diff_tr * image_diff;

[eig_vec, eig_val] = pca(L);

evec_ui= image_diff *eig_vec;

num_eigenfaces = 7;
evec_ui = evec_ui(:, 1:num_eigenfaces);

weights = evec_ui' * image_diff;


%%
 %input test image
input_img= imread('8.pgm');
input_img = im2double(input_img);
input_img_diff= input_img(:)- mean_face;

%%
 % display the eigenvectors
figure;
for n = 1:num_eigenfaces
subplot(2, ceil(num_eigenfaces/2), n);
eig_vect = reshape(evec_ui(:,n), [112, 92]);
imagesc(eig_vect);
colormap(gray); 
end
