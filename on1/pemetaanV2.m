 function per = pemetaanV2(centro)
% close all;
% clear;
% image = imread('is1.png');
% centro = kmeansA(image);
% centro = [162,239,254,243,197,239,248,247;167,129,254,195,136,166,216,232;116,90,254,129,101,119,178,214];
% iM1 = [0 60 120 180 255];
% iH1 = [0 60 120 180 255];
% iB1 = [0 60 120 180 255];

% iM1 = [0 60 120 180 255];
% iH1 = [0 5 45 65 85 115 135 155 175 195 225 255];
% iB1 = [0 25 65 95 125 185 255];

iM1 = [0 51 103 155 207 255];
iH1 = [0 51 103 155 207 255];
iB1 = [0 51 103 155 207 255];

sM = size(iM1,2);
sH = size(iH1,2);
sB = size(iB1,2);
[c,d]=max([sM,sH,sB]);
centroB = (centro);
% [hasil,label] = sort(mean(centro))
% for i =1 : 8
%     centroB(1:3,i) = centro(:,label(i));
% end
P_A = size(centroB,1);
P_B = size(centroB,2);
se = 10;
centro2 = centroB;
a =1;
while a >0
% for b=1:40
    a = 0;
    for i=1:P_B-1
        for j=i+1:P_B
            w1 = (centroB(:,i)');
            w2 = (centroB(:,j)');
            hit = jarakV2(w1,w2,iM1,iH1,iB1);
            hit2 = 50;
            if(hit>50 && hit<100)
                a = a+1;
                b=0;
                while(hit2<100)                  
                  if(d==1)
                    if(centroB(1,j)+se<255)
                        centroB(1,j)=centroB(1,j)+se;                        
                    else if (centroB(2,j)-se>0)
                        centroB(2,j)=centroB(2,j)-se;                        
                        else if(centroB(3,j)-se>0)
                            centroB(3,j)=centroB(3,j)-se;
                            b=b+1;
                            end
                        end
                    end
                  else if (d==2)
                        if(centroB(2,j)+se<255)
                            centroB(2,j)=centroB(2,j)+se;
                            b=b+1;
                        else if (centroB(3,j)-se>0)
                            centroB(3,j)=centroB(3,j)-se;
                            b=b+1;
                            else if(centroB(1,j)-se>0)
                                centroB(1,j)=centroB(1,j)-se;
                                b=b+1;
                                end
                            end
                        end
                      else if(d==3)
                            if(centroB(3,j)+se<255)
                                centroB(3,j)=centroB(3,j)+se;
                                b=b+1;
                            else if (centroB(1,j)-se>0)
                                centroB(1,j)=centroB(1,j)-se;
                                b=b+1;
                                else if(centroB(2,j)-se>0)
                                    centroB(2,j)=centroB(2,j)-se;
                                    b=b+1;
                                end
                            end
                            end
                          end
                      end
                  end
                w1 = (centroB(:,i)');
                w2 = (centroB(:,j)');
                hit2 = jarakV2(w1,w2,iM1,iH1,iB1);  
                end          
                      
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
                        
                
            end
        end
    end
    a
end

per = centroB;
