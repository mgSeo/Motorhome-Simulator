
t=0:0.1:100;
p = [];
for i=1:length(t)
if t(i)>=5 & t(i)<8
p(i) = 12*t(i)-40;
elseif t(i)>=8&t(i)<11
p(i) = (7/3)*t(i)+(56-56/3);
elseif t(i)>=11&t(i)<20
p(i) = -(4/9)*t(i)+(63+44/9);
elseif t(i)>=20 & t(i)<35
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