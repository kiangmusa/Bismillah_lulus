close all;
clear;
image = imread('g15-2.jpg');
% image = hanyacoba(image);
figure
imshow(image)
% image=(image(100:150,100:150,:));
% nColors =8;
% [cluster_idx cluster_center] = kmeans(image,nColors);
[centro1,label] = kmeans2(image);

[per,up,de,total] = pemetaanV2(centro1);
Kl = size(centro1,2);
P_A = size(image,1);
P_B = size(image,2);
image2(1:P_A,1:P_B,1:3)=double(image);
image3 = image2;
kotak = zeros(200,200,3);
kotak2 = kotak;
if(total>0)
    for i=1:Kl
        kotak((((i-1)*25)+1):(i*25), 1:200,1)= centro1(1,i);
        kotak((((i-1)*25)+1):(i*25), 1:200,2)= centro1(2,i);
        kotak((((i-1)*25)+1):(i*25), 1:200,3)= centro1(3,i);
        kotak2((((i-1)*25)+1):(i*25), 1:200,1)= per(1,i);
        kotak2((((i-1)*25)+1):(i*25), 1:200,2)= per(2,i);
        kotak2((((i-1)*25)+1):(i*25), 1:200,3)= per(3,i);

            [baris, kolom] = find(label(:,:)==i);
            for j=1:length(baris)
                a = baris(j);
                b = kolom(j);
                image3(a,b,1)=per(1,i);
                image3(a,b,2)=per(2,i);
                image3(a,b,3)=per(3,i);
                me = image(a,b,1)+up(1,i);
                hi = image(a,b,2)+up(2,i);
                bi = image(a,b,3)+up(3,i);
                isi=[-1;-1;-1];
                image2(a,b,1)= me;
                image2(a,b,2)= hi;
                image2(a,b,3)= bi;
                if(de==1)
                    if(me<=255 && me>=0)
                        isi(1,1) = me;
                    else 
                        if(hi-up(1,i)>=0)
                            isi(2,1) = hi-up(1,i);
                        else if(bi+up(2,i)-up(1,i)>=0) 
                                isi(3,1) = bi+up(2,i)-up(1,i);
                            end
                        end
                    end
                    if(isi(2,1)==-1)
                        if(hi>=0)
                            isi(2,1) = hi;
                        else if(bi+up(2,1) >=0)
                                isi(3,1) = bi+up(2,1);
                            end
                        end
                    end
                    if(isi(3,1)==-1) 
                        if(bi>=0)
                            isi(3,1)=bi;
                        end
                    end           
                else
                    if(de==2)
                    if(hi<=255 && hi>=0)
                        isi(2,1) = hi;
                    else 
                        if(bi-up(2,i)>=0)
                            isi(3,1) = bi-up(2,i);
                        else if(me+up(3,i)-up(2,i)>=0) 
                                isi(1,1) = me+up(3,i)-up(2,i);
                            end
                        end
                    end
                    if(isi(3,1)==-1)
                        if(bi>=0)
                            isi(3,1) = bi;
                        else if(me+up(3,1) >=0)
                                isi(1,1) = me+up(3,1);
                            end
                        end
                    end
                    if(isi(1,1)==-1) 
                        if(hi>=0)
                            isi(1,1)=me;
                        end
                    end
                   else 
                   if(de==3)
                    if(bi<=255 && bi>=0)
                        isi(3,1) = bi;
                    else 
                        if(me-up(3,i)>=0)
                            isi(1,1) = me-up(3,i);
                        else if(hi+up(1,i)-up(3,i)>=0) 
                                isi(2,1) = hi+up(1,i)-up(3,i);
                            end
                        end
                    end
                    if(isi(1,1)==-1)
                        if(me>=0)
                            isi(1,1) = me;
                        else if(hi+up(1,1) >=0)
                                isi(2,1) = hi+up(1,1);
                            end
                        end
                    end
                    if(isi(2,1)==-1) 
                        if(hi>=0)
                            isi(2,1)=hi;
                        end
                    end           
                end
                end
                end
                image2(a,b,1) = isi(1,1);
                image2(a,b,2) = isi(2,1);
                image2(a,b,3) = isi(3,1);


    %         if (me >254)
    % %             per2(2,i)=per(2,i)-per(1,i);
    %             image2(a,b,2)=image(a,b,2)+per(2,i)-per(1,i);
    %         else 
    %             image2(a,b,1)=me;
    %         end
    %          if (hi < 1)
    % %             per2(3,i)=per(3,i)-per(2,i);
    %             image2(a,b,3)=image(a,b,3)+per(3,i)+per(2,i);
    %         else 
    %             image2(a,b,2)=hi;
    %          end
            end
    end
    else 
        msgbox('Tidak terdapat perubahan, pewarnaan ulang tidak diperlukan');
    
end
figure
imshow(uint8(image2))
figure
imshow(uint8(image3))
figure
imshow(uint8(label),[])
figure 
imshow(uint8(kotak))
figure 
imshow(uint8(kotak2))

% iM1 = [0 60 120 180 255];
% iH1 = [0 60 120 180 255];
% iB1 = [0 60 120 180 255];
iM1 = [0 45 85 115 145 185 225 255];
iH1 = [0 15 35 55 75 95 115 135 155 175 195 215 235 255];
iB1 = [0 25 55 85 115 155 195 255];
do =[];
P_B1= size(per,2);
for i=1:P_B1-1
    for j=i+1:P_B1
        w1 = (per(:,i)');
        w2 = (per(:,j)');
        hit = jarakV2(w1,w2,iM1,iH1,iB1);
        do = [do
            hit i j];
    end
end
f = find(do(:,1)<100);