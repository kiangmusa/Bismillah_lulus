% close all;
% clear;
 image = imread('g6-73.jpg');
% nColors =8;
% [cluster_idx cluster_center] = kmeans(image,nColors);
[centro1,label] = kmeansA(image);
per = pemetaan(centro1);
Kl = 8;
P_A = size(image,1);
P_B = size(image,2);
image2(1:P_A,1:P_B,1:3)=0;
image2 = uint8(image2);
kotak = zeros(200,200,3);
kotak2 = kotak;
for i=1:Kl
    kotak((((i-1)*25)+1):(i*25), 1:200,1)= centro1(1,i);
    kotak((((i-1)*25)+1):(i*25), 1:200,2)= centro1(2,i);
    kotak((((i-1)*25)+1):(i*25), 1:200,3)= centro1(3,i);
    kotak2((((i-1)*25)+1):(i*25), 1:200,1)= per(1,i);
    kotak2((((i-1)*25)+1):(i*25), 1:200,2)= per(2,i);
    kotak2((((i-1)*25)+1):(i*25), 1:200,3)= per(3,i);
    [baris, kolom] = find(label(:,:)==i);
    for j=1:length(baris)
        a = baris(j);
        b = kolom(j);
        image2(a,b,1)=per(1,i);
        image2(a,b,2)=per(2,i);
        image2(a,b,3)=per(3,i);
%         me = image(a,b,1)+per(1,i);
%         hi = image(a,b,2)+per(2,i);
%         bi = image(a,b,3)+per(3,i);
%         image2(a,b,1)= me;
%         image2(a,b,2)= hi;
%         image2(a,b,3)= bi;
%         if (me >254)
% %             per2(2,i)=per(2,i)-per(1,i);
%             image2(a,b,2)=image(a,b,2)+per(2,i)-per(1,i);
%         else 
%             image2(a,b,1)=me;
%         end
%          if (hi < 1)
% %             per2(3,i)=per(3,i)-per(2,i);
%             image2(a,b,3)=image(a,b,3)+per(3,i)+per(2,i);
%         else 
%             image2(a,b,2)=hi;
%          end
    end
end
figure
imshow(image2)
figure
imshow(uint8(label),[])
figure 
imshow(uint8(kotak))
figure 
imshow(uint8(kotak2))

