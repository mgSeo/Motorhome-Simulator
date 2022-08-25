clc, clear, close all

%%% #1 On/Off 부하

%%% #2 순시(Puls) 부하
t = 0:1/1e3:0.07;
cycle = 2*pi*30;
duty = 37;
L2 = Func_Signal_Cycle(t, cycle, duty);

%%% #3 주기성 부하

%%% #4 인버터 부하

%%
plot(t,L2)