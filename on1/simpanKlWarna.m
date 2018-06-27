function [R,G,B] = simpanKlWarna(file)
% file = 'kluster.xlsx';
R = xlsread(file,'A:A');
G = xlsread(file,'B:B');
B = xlsread(file,'C:C');