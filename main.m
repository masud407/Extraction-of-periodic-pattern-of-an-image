%% PART A: Pattern Extraction
clc
close all
clear all
% Read the Image
A = imread('C:\Users\abmasud\OneDrive - Texas Tech University\From Google drive\From Drive-latest 06.26.2022\drive-download-20220626T164016Z-004\ME__ECE_5367\ME__ECE_5367\Project2\codes\Proj2.tif');
% Fourier transform of the image
F = fft2(double(A));
F2=(fftshift(double(F)));
F1 = (log10(1+abs(fftshift(double(F)))));

%figure(1);imshow(F1,[]);colormap gray
subplot(2,3,1), imshow(F1,[]);
title ('Fourier Transformation of Original Image','FontSize', 6)

%Ideal filter design
M=size(F1,1);
N=size(F1,2);
Q1=zeros(M, N);
pp = [205 182 228 219 191 196 214];
qq = [273 275 271 280 266 282 264];
        for i=1:length(pp) 
            for i=1:length(qq)
                Q1(pp(i),qq(i))=1;
               
            end
        end
subplot(2,3,2), imshow(Q1,[]);colormap gray;
title('Image of the filter in fft domain','FontSize', 6)
%Filtered image=ifft(filter response*fft(original image))  
J=F2.*Q1;
%Taking inverse fourier transform
J1=ifftshift(J);
B1=ifft2(J1);
subplot(2,3,3); imshow(B1,[]);colormap gray;
title('Image after extracting periodic pattern','FontSize', 6)

%% PART (B): Uniform Illumination
% Reading the original image
%A = imread('C:\Users\MASUD\Desktop\ME__ECE_5367\Project2\Project_2\Proj2.tif');
%Taking fourier transform of the image
K = fft2(double(A));
K2=fftshift(double(K));
K1 = (log10(1+abs(fftshift(double(K))))); %Scaling for visualization
subplot(2,3,4),imshow(K1,[]); colormap gray;
title ('Fourier Transformation of Original Image','FontSize', 6);
% Ideal filter design
M=size(K1,1);
N=size(K1,2);
Q1=ones(M, N);
pp = [205 182 228 219 191 196 214];
qq = [273 275 271 280 266 282 264];
        for i=1:length(pp) 
            for i=1:length(qq)
                Q1((pp(i)-1):(pp(i)+1),(qq(i)-1):(qq(i)+1))=0;
                Q1(pp(i),qq(i))=1;
            end
        end
        subplot(2,3,5),colormap gray
        imshow(Q1,[]);
        title('Image of the filter in frequency domain','FontSize', 6);
   
T=K2.*Q1;
% Taking the inverse fourier transformation
J1=ifftshift(T);
B1=ifft2(J1);
subplot(2,3,6),colormap gray
imshow(B1,[]);
title('Image after Illumination correction','FontSize', 6);


