%reads in the image, converts it to grayscale
dark = double(rgb2gray(imread('flower.bmp')));

%apply SVD and get the top 10 singulars
[U,S,V]=svd(dark);
singular_values=max(S);
% plot(singular_values);
singulars=singular_values(1:10);
% figure
% plot(singulars);

%reconstruct and display the image using the three SVD matrices
recon=U*S*V';
imshow(uint8(recon));

prompt1='Please input k, we will use the top k singular values\n';
k=input(prompt1);

S_k=[S(1:k,1:k),zeros(k,300-k);zeros(300-k,300)];
recon_k=U*S_k*V';
figure
imshow(uint8(recon_k));

figure
imshow(uint8(recon-recon_k));
