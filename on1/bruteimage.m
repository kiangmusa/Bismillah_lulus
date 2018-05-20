clear;
close all;

asli = imread('contoh1.jpg');
baris = size(asli,1);
kolom = size(asli,2);
% baris = 40;
% kolom = 40;
d=[];
for i=1:baris
    for j=1:kolom
        e=[];
        for k=1:baris
            for l=1:kolom
                b(1,1:3)=asli(i,j,:);
                b(2,1:3)=asli(k,l,:);
                e=[e jarak(double(b(1,:)),double(b(2,:)))];
            end
        end
        d=[d; e];
    end
end
f = [];
for i =1:baris
    for j=1:kolom
       f=[f; [i,j]];
    end
end
c = {}
for i=1:baris*kolom
    k1= reshape(d(i,:),baris,kolom); 
    c{f(i,1),f(i,2)}=k1;
end

                