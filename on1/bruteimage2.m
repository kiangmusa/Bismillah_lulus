clear;
close all;
dr=0;
asli1= imread('g11-29.jpg');
asli = asli1(:,:,:);
figure 
imshow(asli);
% asli = hasil;
baris = size(asli,1);
kolom = size(asli,2);
iM1 = [0 45 95 125 165 195 225 255];
iH1 = [0 95 115 135 155 175 195 215 235 255];
iB1 = [0 25 65 105 145 185 215 255];

% iM1 = [0 51 103 155 207 255];
% iH1 = [0 51 103 155 207 255];
% iB1 = [0 51 103 155 207 255];
% iM1 = [0 60 120 180 255];
% iH1 = [0 5 45 65 85 115 135 155 175 195 225 255];
% iB1 = [0 25 65 95 125 185 255];

sM = size(iM1,2);
sH = size(iH1,2);
sB = size(iB1,2);
[c,d]=max([sM,sH,sB]);
% a = zeros(baris+2,kolom+2,3);
% a(2:baris+1,2:kolom+1,1)=asli(:,:,1);
% a(2:baris+1,2:kolom+1,2)=asli(:,:,2);
% a(2:baris+1,2:kolom+1,3)=asli(:,:,3);
z = zeros(baris,kolom,3);
s = 10;
a = 101;
r = zeros(baris,kolom);
 while (a>0)
    a=0;
    for i = 2 : baris-1
        for j = 2 : kolom-1
            g=zeros(3,3);
            b = asli(i-1:i+1,j-1:j+1,:);
            for k=1:3
                for m=1:3
                    w1 = zeros(1,3);
                    w1(1,1) = asli(i,j,1);
                    w1(1,2) = asli(i,j,2);
                    w1(1,3) = asli(i,j,3);
                    w2 = zeros(1,3);
                    w2(1,1) = b(k,m,1);
                    w2(1,2) = b(k,m,2);
                    w2(1,3) = b(k,m,3);
                    hit = jarakV2(w1,w2,iM1,iH1,iB1);
                    if(hit>50 && hit<100)
                        g(k,m)=1;
                    end
                end
            end
%             i
%             j
           
            for k=1:3
                for m=1:3
                    if(k~=2 || m ~=2)
%                         if((sum(asli(i,j,:))/3)<230) && (sum(b(k,m,:))/3)<230
                            ulang =0;
                            w1 = zeros(1,3);
                            w1(1,1) = asli(i,j,1);
                            w1(1,2) = asli(i,j,2);
                            w1(1,3) = asli(i,j,3);
                            w2 = zeros(1,3);
                            w2(1,1) = b(k,m,1);
                            w2(1,2) = b(k,m,2);
                            w2(1,3) = b(k,m,3);
                            hit = jarakV2(w1,w2,iM1,iH1,iB1);
                            hit2 = 50;
    %                         r=0;
                            if(g(k,m)==1)
                              a = a+1;
                              while(hit2<100)
                                 if(d==1)
                                     if(r(i,j)==0) 
                                         if(asli(i,j,1)+s<255)
                                            asli(i,j,1)=asli(i,j,1)+s;
                                            else if (asli(i,j,2)-s>0)
                                                asli(i,j,2)=asli(i,j,2)-s;
                                                else if(asli(i,j,3)+s<255)
                                                    asli(i,j,3)=asli(i,j,3)+s;
                                                    else
                                                        r(i,j)=1;
                                                    end
                                                end
                                         end
                                     end

                                     if(r(i,j)==1)
                                         if(asli(i,j,2)+s<255)
                                             asli(i,j,2)= asli(i,j,2)+s;
                                         else
                                             r(i,j)=2;
                                         end
                                     end
                                     if(r(i,j)==2)
                                         asli(i,j,3)=asli(i,j,3)-s;
    %                                      asli(i,j,3) = asli(i,j,3)-s;
                                     end

                                 else if (d==2)
                                         if(r(i,j)==0)
                                            if(asli(i,j,2)+s<255)
                                                asli(i,j,2)=asli(i,j,2)+s;
                                                else if (asli(i,j,3)-s>0)
                                                    asli(i,j,3)=asli(i,j,3)-s;
                                                    else if(asli(i,j,1)+s<255)
                                                        asli(i,j,1)=asli(i,j,1)+s;
                                                        else 
                                                            r(i,j)=1;
                                                        end
                                                    end
                                            end
                                         end
                                     if(r(i,j)==1)
                                         if(asli(i,j,3)+s<255)
                                             asli(i,j,3)= asli(i,j,3)+s;
                                         else
                                             r(i,j)=2;
                                         end
                                     end
                                     if(r(i,j)==2)
                                         asli(i,j,1)=asli(i,j,1)-s;
    %                                      asli(i,j,3) = asli(i,j,3)-s;
                                     end
                                     else if( d==3)
                                             if(r(i,j)==0)
                                                  if(asli(i,j,3)+s<255)
                                                    asli(i,j,3)=asli(i,j,3)+s;
                                                    else if (asli(i,j,1)-s>0)
                                                        asli(i,j,1)=asli(i,j,1)-s;
                                                        else if(asli(i,j,2)+s<255)
                                                            asli(i,j,2)=asli(i,j,2)+s;
                                                            else 
                                                                r(i,j)=1;
                                                            end
                                                        end
                                                  end
                                             end
                                         if(r(i,j)==1)
                                             if(asli(i,j,1)+s<255)
                                                 asli(i,j,1)= asli(i,j,1)+s;
                                             else
                                                 r(i,j)=2;
                                             end
                                         end
                                        if(r(i,j)==2)
                                         asli(i,j,2)=asli(i,j,2)-s;
    %                                      asli(i,j,3) = asli(i,j,3)-s;
                                        end    
                                      end
                                     end
                                 end
                                w1 = zeros(1,3);
                                w1(1,1) = asli(i,j,1);
                                w1(1,2) = asli(i,j,2);
                                w1(1,3) = asli(i,j,3);
                                w2 = zeros(1,3);
                                w2(1,1) = b(k,m,1);
                                w2(1,2) = b(k,m,2);
                                w2(1,3) = b(k,m,3);
                                hit2 = jarakV2(w1,w2,iM1,iH1,iB1);
    %                             if(hit==hit2)
    %                                 if(d==1)
    %                                  if(asli(i,j,2)+s<255)
    %                                     asli(i,j,2)=asli(i,j,2)+s;
    %                                     else if (asli(i,j,3)-s>0)
    %                                         asli(i,j,3)=asli(i,j,3)-s;
    %                                         end
    %                                  end
    %                              else if (d==2)
    %                                       if(asli(i,j,3)+s<255)
    %                                         asli(i,j,3)=asli(i,j,3)+s;
    %                                         else if (asli(i,j,1)-s>0)
    %                                             asli(i,j,1)=asli(i,j,1)-s;                                      
    %                                             end
    %                                       end
    %                                  else if( d==3)
    %                                           if(asli(i,j,1)+s<255)
    %                                             asli(i,j,1)=asli(i,j,1)+s;
    %                                             else if (asli(i,j,2)-s>0)
    %                                                 asli(i,j,2)=asli(i,j,2)-s;
    %                                                 end
    %                                           end
    %                                      end
    %                                  end
    %                                 end
    %                             end
    %                     while(c>=0)
    %                         c=0;
    % %                         w2(1,1) = b(k,m,1);
    % %                         w2(1,2) = b(k,m,2);
    % %                         w2(1,3) = b(k,m,3);
    %                         w1(1,1) = asli(i,j,1);
    %                         w1(1,2) = asli(i,j,2);
    %                         w1(1,3) = asli(i,j,3);
    %                         w1;
    %                         w2;
    %                         ok = jarak(w1,w2);
    %                         i
    %                         j
    % %                         k
    % %                         m
    %                         if(ok<100 && ok>50)
    %                             per = per+1;
    %                             c=c+1;
    %                             ulang = ulang+1;
    %                             d=[d;
    %                                 i j k m];
    %                             g=g+1;
    %                             if ulang<10
    %                                 
    %                                 if(asli(i,j,1)+s<255)
    %                                     asli(i,j,1)=asli(i,j,1)+s;
    %                                 else if (asli(i,j,2)-s>0)
    %                                     asli(i,j,2)=asli(i,j,2)-s;
    %                                     else if(asli(i,j,3)+s<255)
    %                                         asli(i,j,3)=asli(i,j,3)+s;
    %                                         end
    %                                     end
    %                                 end
    %                             else  asli(i,j,3)=asli(i,j,3)-s;
    %                             c = 1;
    %                             end
                        end
                        end
                        end
                    end
                end
            end
        end
%     end
%     if(a<200)
%         dr=1;
%     end
    a
end
figure
imshow(asli);
        
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
            