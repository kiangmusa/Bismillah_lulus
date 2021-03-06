%  function [hasilakhir,label2] = kmeansA(asli);
clear;
close all;
asli1 = imread('p1.png');
asli = filtermodus(asli1,2);
figure
imshow(asli1)
baris = size(asli,1);  %panjang dari gambar
kolom = size(asli,2); %lebar dari gambar
asli=double(asli);
Kl = 4; %jumlah K awal


%%
% centroid random
% rans(1,1:Kl)=randi([1 baris],1,Kl);
% rans(2,1:Kl)=randi([1 kolom],1,Kl);
% centro=zeros(3,Kl);
% for i=1:Kl
%     centro(1,i)=asli(rans(1,i),rans(2,i),1);
%     centro(2,i)=asli(rans(1,i),rans(2,i),2);
%     centro(3,i)=asli(rans(1,i),rans(2,i),3);
% end

%%
% centroid tetap dengan k = 4
% centro = zeros(3,Kl);
first = -32;
for i=1:Kl
    first = first+64;
    centro(1:3,i)=first;
end

%%
%centro awal ditentukan
% centro(1,1) = 255;
% centro(2,1) = 0;
% centro(3,1) = 0;
% 
% centro(1,2) = 0;
% centro(2,2) = 255;
% centro(3,2) = 0;
% 
% centro(1,3) = 0;
% centro(2,3) = 0;
% centro(3,3) = 255;
% 
% centro(1,4) = 0;
% centro(2,4) = 0;
% centro(3,4) = 0;
% 
% centro(1,5) = 255;
% centro(2,5) = 255;
% centro(3,5) = 255;
% vwx=centro;


%% proses kmeans
centro=double(centro);
% abc= zeros(3,Kl);
% def= zeros(2,Kl,3);
fin = centro; 
% bakol = zeros(baris,kolom);
label=zeros(baris,kolom);
s=1; 
 ct = 0; 
 cs = 0;
% count = [];
index0 = 1;
while(s ~= 0 || index0~=0)
    if (s==0)
        tot = sum(fin);
        fc = find(tot(:)==0);
        if(size(fc,1)>0)
%             ct = ct+1
            for i=1:size(fc,1)
                [abaris,akolom] = find(label(:,:)==0);
                rar = randi([1, size(abaris,1)],1);
                Rcentro = asli(abaris(rar), akolom(rar),1);
                Gcentro = asli(abaris(rar), akolom(rar),2);
                Bcentro = asli(abaris(rar), akolom(rar),3);
                fd = [Rcentro; Gcentro ;Bcentro];
                fin(1:3,fc(i))=fd;
    %             fin = [fin [Rcentro; Gcentro ;Bcentro]]; 
                Kl = size(fin,2);
            end
        else 
%             cs = cs+1
            [abaris,akolom] = find(label(:,:)==0);
            rar = randi([1, size(abaris,1)],1);
            Rcentro = asli(abaris(rar), akolom(rar),1);
            Gcentro = asli(abaris(rar), akolom(rar),2);
            Bcentro = asli(abaris(rar), akolom(rar),3);
            fin = [fin [Rcentro; Gcentro ;Bcentro]]; 
            Kl = size(fin,2);
            
        end
    end
    
%     ct = ct + 1;
%     create = repmat(ct,1,size(centro,2));
% %   count = [count;centro;create];
    centro = fin;
    label = zeros(baris,kolom);
    for i = 1:baris
        for j = 1:kolom
            Rc(1,1) = asli(i,j,1);
            Rc(2,1) = asli(i,j,2);
            Rc(3,1) = asli(i,j,3);
            R = double(repmat( Rc( :, 1),1,Kl));
            Rk = R - centro;
            Rsum = sum(Rk.^2,1);
            hasil = sqrt(Rsum);
            [urut, index] = sort(hasil);
            %f = hasil(index(1));
            %f = find(hasil(1,:)==min(hasil));
            if(hasil(index(1)) < 100)
                label(i, j) = index(1);
%             else 
%                 label(i,j)=9;
            end
        end
    end
    fin=[];
    for h = 1:Kl
        [row,col] = find(label(:,:) == h);
        ab = zeros(size(row,1),1,3);
        for i = 1:size(row,1)
            ab(i,1,:) = asli(row(i,1),col(i,1),:);
        end
        Rcentro = floor(mean(sum(ab(:,1,1),2)));
        Gcentro = floor(mean(sum(ab(:,1,2),2)));
        Bcentro = floor(mean(sum(ab(:,1,3),2)));
        %tambahin random NaN
        if(isnan(Rcentro))
            Rcentro = 0;
            Gcentro = 0;
            Bcentro = 0;
        end
%             %find(label(:,:) == 9);
%             rar = randi([1, baris],1);
%             rak = randi([1, kolom],1);
%             Rcentro = asli(rar, rak,1);
%             Gcentro = asli(rar, rak,2);
%             Bcentro = asli(rar, rak,3);
%         end
        
        fin = [fin [Rcentro; Gcentro ;Bcentro]];
    end
%     fin=fin';
    s = sum( sum(centro - fin,2));
    index0 = size(find(label(:,:) == 0),1);
end

% for i=1:size(label,1)
%     for j=1:size(label,2)
%         label1(i,j)=label(i,j)*2;
%     end
% end

%pixel_labels = reshape(label,baris,kolom);
% figure
% imshow(label,[]);
kotak = zeros(200,200,3);
hasilakhir = fin;
label2 = label;
image2 = zeros(baris,kolom,3);
for i=1:Kl
    kotak((((i-1)*25)+1):(i*25), 1:200,1)= fin(1,i);
    kotak((((i-1)*25)+1):(i*25), 1:200,2)= fin(2,i);
    kotak((((i-1)*25)+1):(i*25), 1:200,3)= fin(3,i);
    [pbaris, pkolom] = find(label(:,:)==i);
    for j=1:length(pbaris)
        a = pbaris(j);
        b = pkolom(j);
        image2(a,b,1)=fin(1,i);
        image2(a,b,2)=fin(2,i);
        image2(a,b,3)=fin(3,i);
    end
end
% kotak = uint8(kotak);
% image2 = uint8(kotak);
% figure
% imshow(uint8(kotak));
% figure
% imshow(uint8(image2));
% for i=1:baris
%     for j=1:kolom
