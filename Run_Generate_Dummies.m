clc, clear, close all

%%% #1 On/Off 부하
fs = 10e3;
t2 = -0.1:1/fs:0.1;
w =  60e-3;
L1 = Func_Onoff(t2,w);

%%% #2 순시(Puls) 부하
fs = 10e3;
t3 = -0.1:1/fs:0.1;
w2 =  60e-3;
L2 = Func_Onoff(t2,w2/20);
%%% #3 주기성 부하
t = 0:1/1e3:0.07;
cycle = 2*pi*30;
duty = 37;
L3 = Func_Signal_Cycle(t, cycle, duty);

%%% #4 인버터 부하

%%t
plot(t2, L1,t ,L3,t3,L2)
