close all;
namfil={'2-1.jpg','2-2.jpg','2-3.jpg', '2-4.jpg', '2-5.jpg','2-6.jpg', '2-7.jpg', '2-8.jpg', '2-9.jpg','2-10.jpg','2-11.jpg','2-12.jpg', '2-13.jpg', '2-14.jpg','2-15.jpg'};
for i=1:15
    imwrite(uint8(recolor2{i}),namfil{i});
end