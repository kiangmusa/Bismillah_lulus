close all;
clear;
image = imread('biru.jpg');
[centro1,label] = kmeansA(image);
per = pemetaan(centro1);
P_A = size(image,1);
P_B = size(image,2);
image2(1:P_A,1:P_B,1:3)=0;
image2 = uint8(image2);
for i=1:8
    [baris, kolom] = find(label(:,:)==i);
    for j=1:length(baris)
        a = baris(j);
        b = kolom(j);
        me = image(a,b,1)+per(1,i);
        hi = image(a,b,2)+per(2,i);
        bi = image(a,b,3)+per(3,i);
        image2(a,b,1)= me;
        image2(a,b,2)= hi;
        image2(a,b,3)= bi;
%         if (me >254)
%             per2(2,i)=per(2,i)-per(1,i);
%             image2(a,b,2)=image(a,b,2)+per(2,i);
%         else 
%             image2(a,b,1)=me;
%         end
%          if (hi >254)
%             per2(3,i)=per(3,i)-per(2,i);
%             image2(a,b,3)=image(a,b,3)+per(3,i);
%         else 
%             image2(a,b,2)=hi;
%          end
    end
end
figure
imshow(image2)
figure
imshow(uint8(label),[])
