clc, clear, close all

%%되는건가


%%% #1 On/Off 부하

t2 = -0.1:1/10e3:0.3;
w =  (60e-3);
L1 = Func_Onoff(t2-0.1,w);

%%% #2 순시(Puls) 부하

t3 = -0.1:1/10e3:0.3;
w2 =  1e-3;
L2 = Func_Onoff(t2,w2);
%%% #3 주기성 부하
t = -0.1:1/10e3:0.3;
cycle = 2*pi*30;
duty = 37;
L3 = Func_Signal_Cycle(t, cycle, duty);

%%종합
L4= L1+L2+L3;

%%% #4 인버터 부하

%%t
plot(t2, L1,t ,L3,t3,L2,t,L4)
