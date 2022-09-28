clear,clc,close all;

%syms t

%f = piecewise(t>=5&t<8,12*t-60,t>=8&t<11,(7/3)*t+(36-56/3),t>=11&t<20,-(4/9)*t+(43+44/9), 0);
%fplot(f, [0 30])
%ylim([-5 45])

t=0:0.01:200;
p = [];
for i=1:length(t)
if t(i)>=116 & t(i)<119
p(i) = 1.09440688622912*t(i)-78.4825375205039;
elseif t(i)>=146 & t(i)<148
p(i) = 5.50475240950933*t(i)-765.862575906783;
elseif t(i)>=170 & t(i)<172
p(i) = -3.1111961131269*t(i)+590.666696174285;
else
p(i) = 0;
end
end

figure()
p = [p ];
plot(p)