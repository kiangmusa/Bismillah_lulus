function hasil = cariKluster(kM, kH, kB, x)
A = size(kM,2);
B = size(kH,2);
C = size(kB,2);
kMx = repmat(x(1,1),1,A);
kHx = repmat(x(1,2),1,B);
kBx = repmat(x(1,3),1,C);

Mx = kMx - kM;
Hx = kHx - kH;
Bx = kBx - kB;

Mi = find(Mx(:)>=0);
Hi = find(Hx(:)>=0);
Bi = find(Bx(:)>=0);
Mi = Mi(length(Mi))+1; 
Hi = Hi(length(Hi))+1;
Bi = Bi(length(Bi))+1;
if (Mi > A ) 
    Mi = A;
end
if (Hi > B ) 
    Hi = B;
end
if (Bi > C ) 
    Bi = C;
end

hasil = [Mi Hi Bi];