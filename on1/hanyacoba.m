function X = hanyacoba(I)
%I = imread('IP-2.jpg');
X = zeros(size(I));
D = 2;
for i = 1:3
    X(:,:,i) = medfilt2(double(I(:,:,i)), [D D]);
end
X = uint8(X);
