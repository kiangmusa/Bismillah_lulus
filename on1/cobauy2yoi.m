 function hasilakhir = cobauy2yoi(asli);
% clear;
% close all;
%asli1 = imread('is1.png');
%asli = filtermedian(asli1,1);
% figure
% imshow(asli,[])
baris = size(asli,1);
kolom = size(asli,2);
asli=double(asli);
Kl = 8;


%%
%centroid random
% rans(1,1:Kl)=randi([1 baris],1,Kl);
% rans(2,1:Kl)=randi([1 kolom],1,Kl);
% centro=zeros(3,Kl);
% for i=1:Kl
%     centro(1,i)=asli(rans(1,i),rans(2,i),1);
%     centro(2,i)=asli(rans(1,i),rans(2,i),2);
%     centro(3,i)=asli(rans(1,i),rans(2,i),3);
% end

%%
%centroid tetap dengan k = 8
centro = zeros(3,Kl);
first = -17;
for i=1:Kl
    first = first+32;
    centro(1:3,i)=first;
end
vwx=centro;
centro=double(centro);
abc= zeros(3,Kl);
def= zeros(2,Kl,3);
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
            Rc(3,1)=asli(i,j,3);
            R = double(repmat(Rc(:,1),1,Kl));
            Rk = R-centro;
            Rsum = sum(Rk.^2,1);
            hasil = sqrt(Rsum);
            [urut,index]=sort(hasil);
            %f = hasil(index(1));
            %f = find(hasil(1,:)==min(hasil));
            label(i,j)=index(1);
        end
    end
    fin=[];
    for h=1:Kl
        [row,col]=find(label(:,:)==h);
        ab = zeros(size(row,1),1,3);
        for i=1:size(row,1)
            ab(i,1,:)=asli(row(i,1),col(i,1),:);
        end
        Rcentro = floor(mean(sum(ab(:,1,1),2)));
        Gcentro = floor(mean(sum(ab(:,1,2),2)));
        Bcentro = floor(mean(sum(ab(:,1,3),2)));
        %tambahin random NaN
        if(isnan(Rcentro))
            rar = randi([1,baris],1);
            rak = randi([1,kolom],1);
            Rcentro = asli(rar,rak,1);
            Gcentro = asli(rar,rak,2);
            Bcentro = asli(rar,rak,3);
        end
        fin=[fin [Rcentro; Gcentro ;Bcentro]];
    end
%     fin=fin';
    s = sum(sum(centro-fin,2));
end

label1=[];
% for i=1:size(label,1)
%     for j=1:size(label,2)
%         label1(i,j)=label(i,j)*2;
%     end
% end

%pixel_labels = reshape(label,baris,kolom);
figure
imshow(label,[]);

% for i=1:baris
%     for j=1:kolom
