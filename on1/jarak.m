%function hasil = jarak(ww2)
clear;
iM = [0 55 95 125 165 195 235 255];
iH = [0 5 45 65 85 115 135 155 175 195 225 255];
iB = [0 25 65 95 125 185 255];


w1 = [220 165 79]; %warna 1
w2 = [225 150 65]; %warna 2

d1 = cariKluster(iM,iH,iB,w1); %fungsi menentukan letak kluster dr w1
d2 = cariKluster(iM,iH,iB,w2); %fungsi menentukan letak kluster dr w2 
d3 = abs(d1-d2); %mencari selisih dari kluster w1 dan w2
t = true;
t1 = true;
t2 = true;
t3 = true;
if( (d3(1)<2) && (d3(2)<2) && (d3(3)<2)) %jika semua kluster RGB hanya berbeda 1 atau sama
    if (w1(1)>w2(1)) %jika nilai R w1>w2, M1=R dr w2 dan M2=R dr w1
        t1 = false;
        M1 = w2(1);
        M2 = w1(1);
    else %jika tidak, maka M1=R dr w1 dan M2=R dr w2
        M1 = w1(1);
        M2 = w2(1);
    end
    if (w1(2)>w2(2)) 
        t2 = false;
        H1 = w2(2);
        H2 = w1(2);
    else 
        H1 = w1(2);
        H2 = w2(2);
    end
    if (w1(3)>w2(3))
        t3 = false;
        B1 = w2(3);
        B2 = w1(3);
    else 
        B1 = w1(3);
        B2 = w2(3);
    end
else %jika ada salah satu elemen warna berbeda jauh antar klusternya, maka t = false
    t = false;
end
if (t) %jika t true, yang artinya elemen warna saling berdekatan klusternya
    if(t1) %jika tidak terjadi pertukaran
        if(d3(1)==0) %jika R dari w1 dan w2 berada dalam 1 kluster
            jM = ((M2-M1) /(iM(d1(1))-iM(d1(1)-1)));
        else %jika berada dalam kluster yang berdekatan
            jM1 = (iM(d1(1))-M1) / (iM(d1(1))-iM(d1(1)-1));
            jM2 = (M2-(iM(d2(1)-1))) / (iM(d2(1))-iM(d2(1)-1));
            jM = jM1+jM2;
        end
    else
        if(d3(1)==0)
            jM = ((M2-M1) /(iM(d2(1))-iM(d2(1)-1)));
        else
            jM1 = (iM(d2(1))-M1) / (iM(d2(1))-iM(d2(1)-1));
            jM2 = (M2-(iM(d1(1)-1))) / (iM(d1(1))-iM(d1(1)-1));
            jM = jM1+jM2;
        end
    end 
    
    if(t2)
        if(d3(2)==0)
            jH = ((H2-H1) /(iH(d1(2))-iH(d1(2)-1)));
        else
            jH1 = (iH(d1(2))-H1) / (iH(d1(2))-iH(d1(2)-1));
            jH2 = (H2-(iH(d2(2)-1))) / (iH(d2(2))-iM(d2(2)-1));
            jH = jH1+jH2;
        end
    else
        if(d3(2)==0)
            jH = ((H2-H1) /(iH(d2(2))-iH(d2(2)-1)));
        else
            jH1 = (iH(d2(2))-H1) / (iH(d2(2))-iH(d2(2)-1));
            jH2 = (H2-(iH(d1(2)-1))) / (iH(d1(2))-iH(d1(2)-1));
            jH = jH1+jH2;
        end
    end 
    
    if(t3)
        if(d3(3)==0)
            jB = ((B2-B1) /(iB(d1(3))-iB(d1(3)-1)));
        else
            jB1 = (iB(d1(3))-B1) / (iB(d1(3))-iB(d1(3)-1));
            jB2 = (B2-(iB(d2(3)-1))) / (iB(d2(3))-iB(d2(3)-1));
            jB = jB1+jB2;
        end
    else
        if(d3(3)==0)
            jB = ((B2-B1) /(iB(d2(3))-iB(d2(3)-1)));
        else
            jB1 = (iB(d2(3))-B1) / (iB(d2(3))-iB(d2(3)-1));
            jB2 = (B2-(iB(d1(3)-1))) / (iB(d1(3))-iB(d1(3)-1));
            jB = jB1+jB2;
        end
    end
    ok = [jM, jH, jB];
    ok = sum(ok,2);
else 
    ok = 0;
end
    
