clear;
namfil = {'g1-7.jpg','g2-6.jpg','g3-26.jpg', 'g4-15.jpg', 'g5-6.jpg','g6-73.jpg', 'g7-5.jpg', 'g8-16.jpg', 'g9-45.jpg','g10-12.jpg','g11-29.jpg','g12-8.jpg', 'g13-74.jpg', 'g14-57.jpg','g15-2.jpg'};
a = cell(15,1);
for i=1:size(namfil,2) 
    d = {imread(namfil{i})};
    a(i) = d;
end
waktu = [];
for i =1:3
    tic;
    al = 2+3;
%     do = imread(namfil{1});
    waktu = [waktu
        toc];
end
