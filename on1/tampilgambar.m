close all;
namfil={'g11&7.jpg','g12&6.jpg','g13&26.jpg', 'g14&15.jpg', 'g15&6.jpg','g16&73.jpg', 'g17&5.jpg', 'g18&16.jpg', 'g19&45.jpg','g110&12.jpg','g111&29.jpg','g112&8.jpg', 'g113&74.jpg', 'g114&57.jpg','g115&2.jpg'};
for i=1:15
    imwrite(uint8(recolor1{i}),namfil{i});
end
    