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
se = 10;
centro2 = centroB;
a =1;
b=0;
while a ~=0
% for b=1:40
    a = 0;
    for i=1:P_B-1
        for j=i+1:P_B
            w1 = (centroB(:,i)');
            w2 = (centroB(:,j)');
            hit = jarak(w1,w2);
            if(hit<100)
                a = a+1
%                 if(centroB(1,j)+se<=255 && centroB(1,j)-se>=0)
%                     a
%                     if(w2(1,1)>w1(1,1))
%                         centroB(1,j)=centroB(1,j)+se;
%                     else 
%                         centroB(1,j) = centroB(1,j)-se;
%                     end
%                 else if(centroB(1,i)+se<=255 && centroB(1,i)-se>=0)
%                         b
%                         if(w1(1,1)>w2(1,1))
%                             centroB(1,i)=centroB(1,i)+se;
%                         else 
%                             centroB(1,i) = centroB(1,i)-se;
%                         end
%                     else if(centroB(2,j)+se<=255 && centroB(2,j)-se>=0)    
%                         if(w1(1,2)<w2(1,2))
%                             centroB(2,j)=centroB(2,j)+se;
%                         else 
%                             centroB(2,j) = centroB(2,j)-se;
%                         end
%                         else if (centroB(2,i)+se<=255 && centroB(2,i)-se>=0)
%                                 if(w1(1,2)>w2(1,2))
%                                     centroB(2,i)=centroB(2,i)+se;
%                                 else 
%                                     centroB(2,i) = centroB(2,i)-se;
%                                 end
%                             end
%                         end
%                     end
%                 end
                        
                if(centroB(1,j)+se<255)
                    C(1,j)=C(1,j)+se;
                    centroB(1,j)=centroB(1,j)+se;
                else if (centroB(2,j)-se>0)
                    C(2,j)=C(2,j)-se;
                    centroB(2,j)=centroB(2,j)-se;
                    else if(centroB(3,j)-se>0)
                        C(3,j)=C(3,j)-se;
                        centroB(3,j)=centroB(3,j)-se;
                        end
                    end
                end
            end
        end
    end
    a
end
per = centroB;
