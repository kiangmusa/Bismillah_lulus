function hasil = bbsort(A)
P_A = size(A,1);
for i=P_A:-1:2 
    for j=2:i 
        if(A(j-1)>A(j)) 
            tmp=A(j-1);
            A(j-1) = A(j);
            A(j) = tmp;
        end
    end
end
hasil = A;