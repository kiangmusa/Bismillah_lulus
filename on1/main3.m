clear;
close all;

asli= imread('is1.png');
%  asli = asli1(50:150,50:150,:); 
baris = size(asli,1);
kolom = size(asli,2);
a = zeros(baris+2,kolom+2,3);
a(2:baris+1,2:kolom+1,1)=asli(:,:,1);
a(2:baris+1,2:kolom+1,2)=asli(:,:,2);
a(2:baris+1,2:kolom+1,3)=asli(:,:,3);
z = zeros(baris,kolom,3);
g=0;
d=[];
for i = 2 : size(a,1)-2
    for j = 2 : size(a,2)-2
        i
        j
        if(i-1==1) 
            a(i-1,j-1:j+1,1)=a(i,j,1);
            a(i-1,j-1:j+1,2)=a(i,j,2);
            a(i-1,j-1:j+1,3)=a(i,j,3);
        end
        if(j-1==1)
            a(i-1:i+1,j-1,1)=a(i,j,1);
            a(i-1:i+1,j-1,2)=a(i,j,2);
            a(i-1:i+1,j-1,3)=a(i,j,3);
        end
        if(i+1 == size(a,1))
            a(i+1,j-1:j+1,1)=a(i,j,1);
            a(i+1,j-1:j+1,2)=a(i,j,2);
            a(i+1,j-1:j+1,3)=a(i,j,3);
        end
        if(j+1 == size(a,2))
            a(i-1:i+1,j+1,1)=a(i,j,1);
            a(i-1:i+1,j+1,2)=a(i,j,2);
            a(i-1:i+1,j+1,3)=a(i,j,3);
        end
        b = a(i-1:i+1,j-1:j+1,:);
        w1 = zeros(1,3);
        w1(1,1) = a(i,j,1);
        w1(1,2) = a(i,j,2);
        w1(1,3) = a(i,j,3);
       
        for k=1:3
            for l=1:3
                c = 1;
                w2 = zeros(1,3);
%                 w2(1,1) = b(k,l,1);
%                 w2(1,2) = b(k,l,2);
%                 w2(1,3) = b(k,l,3);
                
                while(c>0)
                    w2(1,1) = b(k,l,1);
                    w2(1,2) = b(k,l,2);
                    w2(1,3) = b(k,l,3);
                    w1
                    w2
                    ok = jarak(w1,w2)
                    if(ok<100 && ok>30)
                        d=[d;
                            i j k l];
                        g=g+1;
                        if(b(k,l,1)+5<=255)
                            b(k,l,1)=b(k,l,1)+5
                        else if (b(k,l,2)-5>=0)
                            b(k,l,2)=b(k,l,2)-5
                            else if(b(k,l,3)+5<=255)
                                b(k,l,3)=b(k,l,3)+5
                                end
                            end
                        end
                        c = 1;
                    else 
                        c = -1;
                    end
                end
            end
        end
        a(i-1:i+1,j-1:j+1,:) = b;
    end
end
hasil = uint8(a(2:baris+1,2:kolom+1,:));
imshow(hasil);
        
% for i=1:baris
%     for j=1:kolom
%         
%         a = i-1;
%         b = j-1;
%         c = 
%         if(a>0 && b>0) 
%             a = asli(i-1,j-1,:);
%             b = asli(i-1,j.:);
%             c = asli(i,j-1,:);
            