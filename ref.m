clear,clc,close all;

%syms t

%f = piecewise(t>=5&t<8,12*t-60,t>=8&t<11,(7/3)*t+(36-56/3),t>=11&t<20,-(4/9)*t+(43+44/9), 0);
%fplot(f, [0 30])
%ylim([-5 45])

t=0:0.1:30;
p = [];
for i=1:length(t)
if t(i)>=5 & t(i)<8
p(i) = 12*t(i)-40;
elseif t(i)>=8&t(i)<11
p(i) = (7/3)*t(i)+(56-56/3);
elseif t(i)>=11&t(i)<20
p(i) = -(4/9)*t(i)+(63+44/9);
else
p(i) = 0;
end
end

figure()
plot(t, p)

figure()
p = [p p p p p p];
plot(p)