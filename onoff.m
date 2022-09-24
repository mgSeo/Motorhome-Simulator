%onoff부하
t2 = -0.1:1/10e3:0.3;
w =  (60e-3);
L1 = Func_Onoff(t2-0.1,w)/2;
plot(t2,L1)