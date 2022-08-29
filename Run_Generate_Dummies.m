clc, clear, close all

%%% #1 On/Off 부하

%t2 = -0.1:1/10e3:0.3;
%w =  (60e-3);
%L1 = Func_Onoff(t2-0.1,w);

%%% #2 순시(Puls) 부하

%t3 = -0.1:1/10e3:0.3;
%w2 =  1e-3;
%L2 = Func_Onoff(t2,w2);

%%% #3 주기성 부하
%밤주기
%t = 1:1000;
%cycle = 0.000967;
%duty = 65.67;

%L3 = Func_Signal_Cycle(t, cycle, duty);

%모터 모드
t5= 1:1000;
prompt="mode?";
k=input(prompt);
cycle2=modevalue(k);
duty2=10;

L5=Func_Signal_Cycle(t5, cycle2, duty2);

%%종합
%L4= L1+L2+L3;


%%t
plot(t5 ,L5)
