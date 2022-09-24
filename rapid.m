%순시부하

t3 = -0.1:1/10e3:0.3;
w2 =  1e-3;
L2 = Func_Onoff(t3,w2);
plot(t3,L2)