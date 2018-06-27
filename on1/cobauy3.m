clear all;
close all;
asli = (imread('contoh1.jpg'));
baris = size(asli,1);
kolom = size(asli,2);
Kl = 5;
cform = makecform('srgb2lab');
% Applying above color transform to the sRGB image %
lab_he = applycform(asli,cform);
% Converting into double %
asli = double(lab_he(:,:,2:3));

% for i=1:baris
%     for j=1:kolom
%         R = (asli(i,j,1)/2)-20;
%         G = (asli(i,j,1)/2)+30;
%         B = (asli(i,j,1)/2)-10;
%         asli(i,j,1) = uint8(R);
%         asli(i,j,2) = uint8(G);
%         asli(i,j,3) = uint8(B);
%     end
% end
rans(1,1:Kl)=randi([1 baris],1,Kl);
rans(2,1:Kl)=randi([1 kolom],1,Kl);
centro=zeros(2,Kl);
for i=1:Kl
    centro(1,i)=asli(rans(1,i),rans(2,i),1);
    centro(2,i)=asli(rans(1,i),rans(2,i),2);
    %centro(3,i)=asli(rans(1,i),rans(2,i),3);
end
vwx=centro;
centro=double(centro);
abc= zeros(2,Kl);
def= zeros(2,Kl,2);
fin = centro;
bakol = zeros(baris,kolom);
% label=zeros(baris,kolom);
s=1;
while(s~=0)
    centro=fin;
    label=zeros(baris,kolom);
    
    for i=1:baris
        for j=1:kolom
            Rc(1,1)=asli(i,j,1);
            Rc(2,1)=asli(i,j,2);
            %Rc(3,1)=asli(i,j,3);
            R = double(repmat(Rc(:,1),1,Kl));
            Rk = R-centro;
            Rsum = sum(Rk,1);
            hasil = sqrt(Rsum.^2);
            f = find(hasil(1,:)==min(hasil));
            label(i,j)=f(1,1);
        end
    end
    fin=[];   
    for h=1:Kl
        [row,col]=find(label(:,:)==h);
        ab = zeros(size(row,1),1,2);
        for i=1:size(row,1)
            ab(i,1,:)=asli(row(i,1),col(i,1),:);
        end
        Rcentro = floor(mean(sum(ab(:,1,1),2)));
        Gcentro = floor(mean(sum(ab(:,1,2),2)));
        %Bcentro = floor(mean(sum(ab(:,1,3),2)));
        fin=[fin
            Rcentro Gcentro]; %Bcentro];
    end
    fin=fin';
    s = sum(sum(centro-fin,2));
end
pixel_labels = reshape(label,baris,kolom);
imshow(pixel_labels,[]);
nColors =8;
kotak = zeros(200,200,3);
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
% for i=1:baris
%     for j=1:kolom
    