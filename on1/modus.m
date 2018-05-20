function hasil = modus(A)
P_A= size(A,1);

Modus = [A(1),1];
for i=2 :P_A
    [a,b] = find(Modus(:,1)==A(i));
    if length(b)~=0
        Modus(a,2)=Modus(a,2)+1;
    else
        Modus = [Modus;A(i) 1];
    end
end
[a,b] = find(Modus(:,2)==max(Modus(:,2)));
hasil = Modus(a(1));    