clear;
close all;
he = imread('g12-8.jpg');
% Reading and displaying image %

% imshow(he), title('LISS 4 + CARTOSAT 1 fused image');
% text(size(he,2),size(he,1)+15,...
% 'Image courtesy of RS and GIS , Civil Engg, MANIT Bhopal,INDIA', ...
% 'FontSize',7,'HorizontalAlignment','right');
%%
% Creating color transformation from sRGB to L*a*b %
cform = makecform('srgb2lab');
% Applying above color transform to the sRGB image %
lab_he = applycform(he,cform);
% Converting into double %
ab = double(lab_he(:,:,2:3));
ac = double(he(:,:,:));
% obtaining rows and columns of transformed image %
nrows = size(ac,1);
ncols = size(ac,2);
% Reshaping image taking each value column wise %
%ab = reshape(ab,nrows*ncols,3);
ac = reshape(ac,nrows*ncols,3);
% No of clusters to be created with five iterations %
nColors =8;
kotak = zeros(200,200,3);
[cluster_idx cluster_center] = kmeans(ac,nColors);
pixel_labels = reshape(cluster_idx,nrows,ncols);
P_A = size(he,1);
P_B = size(he,2);
image2(1:P_A,1:P_B,1:3)=0;
image2 = uint8(image2);
% Reshaping and showing the clusters 
for i=1:nColors
    kotak((((i-1)*25)+1):(i*25), 1:200,1)= cluster_center(i,1);
    kotak((((i-1)*25)+1):(i*25), 1:200,2)= cluster_center(i,2);
    kotak((((i-1)*25)+1):(i*25), 1:200,3)= cluster_center(i,3);
    [baris, kolom] = find(pixel_labels(:,:)==i);
    for j=1:length(baris)
        a = baris(j);
        b = kolom(j);
        image2(a,b,1)=cluster_center(i,1);
        image2(a,b,2)=cluster_center(i,2);
        image2(a,b,3)=cluster_center(i,3);

    end
end
    figure
imshow(uint8(kotak))
figure
imshow(image2)
% jum = 0;
R = pixel_labels;
G = pixel_labels;
B = pixel_labels;
baris = size(pixel_labels,1);
kolom = size(pixel_labels,2);
for i=1:size(pixel_labels,1)
    for j=1:size(pixel_labels,2)
        if(pixel_labels(i,j)==1)
            R(i,j)=he(i,j,1)+40;
            G(i,j)=he(i,j,2)-50;
            B(i,j)=he(i,j,3)+40;
%         elseif(pixel_labels(i,j)==2)
%             R(i,j)=he(i,j,1);
%             G(i,j)=he(i,j,2);
%             B(i,j)=he(i,j,3);
%             if(G(i,j)>255)
%                 G(i,j)=255;
%             end
%         elseif(pixel_labels(i,j)==3)
%             R(i,j)=he(i,j,1);
%             G(i,j)=he(i,j,2);
%             B(i,j)=he(i,j,3);
%         elseif(pixel_labels(i,j)==4)
%             R(i,j)=he(i,j,1);
%             G(i,j)=he(i,j,2);
%             B(i,j)=he(i,j,3);
%         elseif(pixel_labels(i,j)==5)
%             R(i,j)=he(i,j,1);
%             G(i,j)=he(i,j,2);
%             B(i,j)=he(i,j,3);
        end
    end
end
% 
% figure
% imshow(he)
% figure

%%
% creating five element array %
% segmented_images = cell(5);
% % Creating tiles for three different colors %
% rgb_label = repmat(pixel_labels,[1 1 3]);
% % Assigning clustered objects to array(segmented_image) %
% for k = 1:nColors
% color = he;
% color(rgb_label ~= k) = 0;
% segmented_images{k} =color;
% end
% %%
% % displaying different cluster objects %
% figure
% imshow(segmented_images{1}), title('objects in cluster 1');
% %%
% figure
% imshow(segmented_images{2}), title('objects in cluster 2');
% %%
% figure
% imshow(segmented_images{3}), title('objects in cluster 3');
% %%
% figure
% imshow(segmented_images{4}), title('objects in cluster 4');
% %%
% figure
% imshow(segmented_images{5}), title('objects in cluster 5');
% %%
% 
% %%
% % Evaluating mean of all cluster centers %
% mean_cluster_value = mean(cluster_center,2);
% % Sorting the mean cluster array and storing sorted index in idx %
% [tmp, idx] = sort(mean_cluster_value);
% %%
% n1_cluster_num = idx(1);
% L = lab_he(:,:,1);
% n1_idx = find(pixel_labels == n1_cluster_num);
% L_n1 = L(n1_idx);
% is_light_n1 = im2bw(L_n1,graythresh(L_n1));
% nuclei_labels = repmat(uint8(0),[nrows ncols]);
% nuclei_labels(n1_idx(is_light_n1==false)) = 1;
% nuclei_labels = repmat(nuclei_labels,[1 1 3]);
% n1_nuclei = he;
% n1_nuclei(nuclei_labels ~= 1) = 0;
% figure
% imshow(n1_nuclei), title('n1 nuclei');
% %%
% n2_cluster_num = idx(2);
% L = lab_he(:,:,1);
% n2_idx = find(pixel_labels == n2_cluster_num);
% L_n2 = L(n2_idx);
% is_light_n2 = im2bw(L_n2,graythresh(L_n2));
% nuclei_labels = repmat(uint8(0),[nrows ncols]);
% nuclei_labels(n2_idx(is_light_n2==false)) = 1;
% nuclei_labels = repmat(nuclei_labels,[1 1 3]);
% n2_nuclei = he;
% n2_nuclei(nuclei_labels ~= 1) = 0;
% figure
% imshow(n2_nuclei), title('n2 nuclei');
% %%
% n3_cluster_num = idx(3);
% L = lab_he(:,:,1);
% n3_idx = find(pixel_labels == n3_cluster_num);
% L_n3 = L(n3_idx);
% is_light_n3 = im2bw(L_n3,graythresh(L_n3));
% nuclei_labels = repmat(uint8(0),[nrows ncols]);
% nuclei_labels(n3_idx(is_light_n3==false)) = 1;
% nuclei_labels = repmat(nuclei_labels,[1 1 3]);
% n3_nuclei = he;
% n3_nuclei(nuclei_labels ~= 1) = 0;
% figure
% imshow(n3_nuclei), title('n3 nuclei');
% %%
% n4_cluster_num = idx(4);
% L = lab_he(:,:,1);
% n4_idx = find(pixel_labels == n4_cluster_num);
% L_n4 = L(n4_idx);
% is_light_n4 = im2bw(L_n4,graythresh(L_n4));
% nuclei_labels = repmat(uint8(0),[nrows ncols]);
% nuclei_labels(n4_idx(is_light_n4==false)) = 1;
% nuclei_labels = repmat(nuclei_labels,[1 1 3]);
% n4_nuclei = he;
% n4_nuclei(nuclei_labels ~= 1) = 0;
% figure
% imshow(n4_nuclei), title('n4 nuclei');
% %%
% n5_cluster_num = idx(5);
% L = lab_he(:,:,1);
% n5_idx = find(pixel_labels == n5_cluster_num);
% L_n5 = L(n5_idx);
% is_light_n5 = im2bw(L_n5,graythresh(L_n5));
% nuclei_labels = repmat(uint8(0),[nrows ncols]);
% nuclei_labels(n5_idx(is_light_n5==false)) = 1;
% nuclei_labels = repmat(nuclei_labels,[1 1 3]);
% n5_nuclei = he;
% n5_nuclei(nuclei_labels ~= 1) = 0;
% figure
% imshow(n5_nuclei), title('n5 nuclei');