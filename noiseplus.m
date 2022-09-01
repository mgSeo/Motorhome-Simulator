clc, clear, close all

d1_time = 180;
d2_time = 60;
d1 = zeros(1,d1_time);

rand2 = 0.1*rand(1,d2_time);
t = 1:d2_time;
d2 = zeros(0);
for i=1:3
d2 = [d2 d1];
d2 = [d2 square(t/(pi*3.1), 50)+rand2];
end
csum = cumsum(d2);

plot(csum);