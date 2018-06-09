 function per = pemetaan(centro)
% close all;
% clear;
% image = imread('is1.png');
% centro = kmeansA(image);
% centro = [162,239,254,243,197,239,248,247;167,129,254,195,136,166,216,232;116,90,254,129,101,119,178,214];
centroB = (centro);
% [hasil,label] = sort(mean(centro))
% for i =1 : 8
%     centroB(1:3,i) = centro(:,label(i));
% end
P_A = size(centroB,1);
P_B = size(centroB,2);
C = zeros(P_A,P_B);
centro2 = centroB;
a =1;
b=0;
while a ~=0
% for b=1:40
    a = 0;
    a
    b=b+1
    for i=1:P_B-1
        for j=i+1:P_B
            w1 = (centroB(:,i)');
            w2 = (centroB(:,j)');
            hit = jarak(w1,w2);
            if(hit>30 && hit<100)
                a = a+1;
                if(centroB(1,j)+5<=255)
                    C(1,j)=C(1,j)+5;
                    centroB(1,j)=centroB(1,j)+5;
                else if (centroB(2,j)-5>=0)
                    C(2,j)=C(2,j)-5;
                    centroB(2,j)=centroB(2,j)-5;
                    else if(centroB(3,j)+5<=255)
                        C(3,j)=C(3,j)+5;
                        centroB(3,j)=centroB(3,j)+5;
                        end
                    end
                end
            end
        end
    end
    a
end
per = centroB;
