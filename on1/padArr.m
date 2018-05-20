function hasil = padArr(A,P)
P_A = size(A,1);
P_B = size(A,2);
PP_A = size(A,1)+(P*2);
PP_B = size(A,2)+(P*2);
Z = zeros(PP_A, PP_B,3);
for i=P+1:PP_A-P 
    for j=P+1:PP_B-P
        Z(i,j,:) = A(i-P,j-P,:);
    end
end
hasil = Z;