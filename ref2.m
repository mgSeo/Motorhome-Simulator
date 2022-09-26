clear,clc,close all;

t=0:0.1:60;
p = [];
for i=1:length(t)
if t(i)>=20 & t(i)<35
p(i) = -0.02*t(i)+38;
elseif t(i)>=35 & t(i)<40
p(i) = -3.9*t(i)+173.8;
else
p(i) = 0;
end
end

figure()
p = [p p p p p p];
plot(p)