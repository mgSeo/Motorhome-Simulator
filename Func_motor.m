function csum =Func_motor(d1_time,d2_time)

d1 = zeros(1,d1_time);
t = 1:d2_time;
d2 = zeros(0);
for i=1:5
    d2 = [d2 d1];
    d2 = [d2 square(t/(pi*3.1), 50)];
end
csum = cumsum(d2);
end