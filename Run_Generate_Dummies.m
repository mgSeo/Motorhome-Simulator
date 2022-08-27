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
t = 0:1:1100;
%밤주기
if t<=200
   cycle = 200;
   duty = 62.5; %%66.67
%낮주기
elseif 200<t<=700
    cycle = 250;
    duty=66.67;
%밤주
elseif t>700
    cycle = 200;
     duty = 62.5;
end
L3 = Func_Signal_Cycle(t, cycle, duty);

%%종합
%L4= L1+L2+L3;


%%t
plot(t ,L3)
