function [hasilakhir,label2] = kmeansB(asli);
% clear;
% close all;
% asli = imread('g1-7.jpg');
%asli = filtermedian(asli1,1);
% figure
% imshow(asli,[])
baris = size(asli,1);
kolom = size(asli,2);
asli=double(asli);



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
%centroid tetap dengan k = 8
% centro = zeros(3,Kl);
% first = -17;
% for i=1:Kl
%     first = first+32;
%     centro(1:3,i)=first;
% end

%%
%centro awal ditentukan
% centro(1:3,1) = [230;25;75];
% centro(1:3,2) = [60; 180; 75];
% centro(1:3,3) = [255; 225; 25];
% centro(1:3,4) = [0;130;200];
% centro(1:3,5) = [245;130;48];
% centro(1:3,6) = [145;30;180];
% centro(1:3,7) = [70;240;240];
% centro(1:3,8) = [240;50;230];
% centro(1:3,9) = [210;245;60];
% centro(1:3,10) = [250;190;190];
% centro(1:3,11) = [0;128;128];
% centro(1:3,12) = [230;190;255];
% centro(1:3,13) = [170;110;40];
% centro(1:3,14) = [255;250;200];
% centro(1:3,15) = [128;0;0];
% centro(1:3,16) = [170;255;195];
% centro(1:3,17) = [128;128;0];
% centro(1:3,18) = [255;215;180];
% centro(1:3,19) = [0;0;128];
% centro(1:3,20) = [128;128;128];
% centro(1:3,21) = [255;255;255];
% centro(1:3,22) = [0;0;0];
%%
Kl = 50;
centro = zeros(3,Kl);
first =7;
for i=1:16
    centro(1,i)=first;
    centro(2:3,i) = 0;
    first = first+16;
end
first =7;
for i=17:32
    centro(2,i)=first;
    centro(1,i) = 0;
    centro(3,i) = 0;
    first = first+16;
end
first =7;
for i=33:48
    centro(3,i)=first;
    centro(1:2,i) = 0;
    first = first+16;
end
centro(1:3,49) = [255;255;255];
centro(1:3,50) = [0;0;0];
% vwx=centro;
centro=double(centro);
% abc= zeros(3,Kl);
% def= zeros(2,Kl,3);
fin = centro;
% bakol = zeros(baris,kolom);
% label=zeros(baris,kolom);
s=1;
ct = 0;
count = [];
while(s ~= 0)
    ct = ct + 1;
    create = repmat(ct,1,size(centro,2));
%     count = [count;centro;create];
    centro = fin;
    Kl = size(fin,2);
    label = zeros(baris,kolom);
    for i = 1:baris
        for j = 1:kolom
            Rc(1,1) = asli(i,j,1);
            Rc(2,1) = asli(i,j,2);
            Rc(3,1) = asli(i,j,3);
            R = double( repmat( Rc( :, 1),1,Kl));
            Rk = R - centro;
            Rsum = sum(Rk.^2,1);
            hasil = sqrt(Rsum);
            [urut, index] = sort(hasil);
            %f = hasil(index(1));
            %f = find(hasil(1,:)==min(hasil));
            label(i, j) = index(1);
        end
    end
    fin=[];
    hit = 0;
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
        if(~isnan(Rcentro))
              hit = hit+1;
%             rar = randi([1, baris],1);
%             rak = randi([1, kolom],1);
              fin = [fin [Rcentro; Gcentro ;Bcentro]];
        end
%          if(isnan(Rcentro))
%             rar = randi([1, baris],1);
%             rak = randi([1, kolom],1);
%             Rcentro = asli(rar, rak,1);
%             Gcentro = asli(rar, rak,2);
%             Bcentro = asli(rar, rak,3);
%         end
        
%         fin = [fin [Rcentro; Gcentro ;Bcentro]];
    end
%     fin=fin';
%     s2 = sum(fin);
%     fin2 = [];
%     if(ct==1)
%         for h =1:21
%             if(s2(1,h)~=0)
%                 fin2=[fin2 [fin(:,h)]];
%             end
%         end
%     else
%          for h =1:Kl
%             if(s2(1,h)~=0)
%                 fin2=[fin2 [fin(:,h)]];
%             end
%          end
%     end
    if(hit ~= Kl)
        s = sum(sum(fin));
    else 
        s = sum( sum(centro - fin,2));
    end
end

% for i=1:size(label,1)
%     for j=1:size(label,2)
%         label1(i,j)=label(i,j)*2;
%     end
% end

%pixel_labels = reshape(label,baris,kolom);
% figure
% imshow(label,[]);
hasilakhir = fin;
label2 = label;
% for i=1:baris
%     for j=1:kolom
