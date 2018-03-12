clear all;
close all;
asli = imread('contoh1.jpg');
baris = size(asli,1);
kolom = size(asli,2);
Kl = 5;

rans(1,1:Kl)=randi([1 size(asli,1)],1,Kl);
rans(2,1:Kl)=randi([1 size(asli,2)],1,Kl);
centro=zeros(3,Kl);
for i=1:Kl
    centro(1,i)=asli(rans(1,i),rans(2,i),1);
    centro(2,i)=asli(rans(1,i),rans(2,i),2);
    centro(3,i)=asli(rans(1,i),rans(2,i),3);
end
vwx=centro;
centro=double(centro);
abc= zeros(3,Kl);
def= zeros(2,Kl,3);
d = centro;
bakol = zeros(baris,kolom);
% while (sum(sum(d)) ~= 0)
%     def= zeros(2,Kl,3);
%     bakol = zeros(baris,kolom);
    for i=1:baris
        for j=1:kolom
            kecil = 1000;
            titik = 0;
            for k=1:Kl
                R = (double(asli(i,j,1)-centro(1,k)))^2;
                G = (double(asli(i,j,2)-centro(2,k)))^2;
                B = (double(asli(i,j,3)-centro(3,k)))^2;
                jum1 = R+G+B;
                jum2 = sqrt(jum1);
                if(kecil>jum2)
                    kecil=uint8(jum2);
                    titik=k;
                end
            end
            bakol(i,j)=titik;
            def(1,titik,1)=def(1,titik,1)+double(asli(i,j,1));
            def(1,titik,2)=def(1,titik,2)+double(asli(i,j,2));
            def(1,titik,3)=def(1,titik,3)+double(asli(i,j,3));
            def(2,titik,2)=def(2,titik,2)+1;
        end
    end
    ce1=zeros(3,Kl);
    for k=1:Kl
        if(def(2,k,2)==0)
            ce1(1,k)=0;
            ce1(2,k)=0;
            ce1(3,k)=0; 
        else
            ce1(1,k)=def(1,k,1)/def(2,k,2);
            ce1(2,k)=def(1,k,2)/def(2,k,2);
            ce1(3,k)=def(1,k,3)/def(2,k,2);
        end
    end
    d=floor(ce1-centro);
    centro=floor(ce1);
% end
pixel_labels = reshape(bakol,baris,kolom);
imshow(pixel_labels,[])
               
                
