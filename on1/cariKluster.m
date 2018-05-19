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

M = find(Mx(:)>=0);
H = find(Hx(:)>=0);
B = find(Bx(:)>=0);
hasil = [M(length(M))+1 H(length(H))+1 B(length(B))+1 ];
