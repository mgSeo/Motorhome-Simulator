clc, clear, close all

%%% #1 On/Off 부하

t2 = -0.1:1/10e3:0.3;
w =  (60e-3);
L1 = Func_Onoff(t2-0.1,w)/2;
plot(t2,L1)
%%% #2 순시(Puls) 부하

%t3 = -0.1:1/10e3:0.3;
%w2 =  1e-3;
%L2 = Func_Onoff(t2,w2);

%%% #3 주기성 부하
%밤주기

%t = 1:10000;
%cycle = 0.000967;
%duty = 65.67;
%L3 = Func_Signal_Cycle(t, cycle, duty);

%모터 모드
t5= 1:1000;

cycle2= 2*pi/((54+6)*10);
duty2=10;

L5=Func_Signal_Cycle(t5, cycle2, duty2);

%%종합
%L4= L1+L2+L3;

%모터54
%t = 1:60;
%x = zeros(1,540);
%y = zeros(1,540);
%for i=1:5
  %  x = [x square(t*0.033*pi, 50)];
   % x = [x y];
%end
%z = cumsum(x);
%plot(z);

%모터48
%t = 1:60;
%x = zeros(1,480);
%y = zeros(1,480);
%for i=1:5
 %   x = [x square(t*0.033*pi, 50)];
  %  x = [x y];
%end
%z = cumsum(x);
%plot(z);

%모터42
%t = 1:60;
%x = zeros(1,420);
%y = zeros(1,420);
%for i=1:5
 %   x = [x square(t*0.033*pi, 50)];
 %   x = [x y];
%end
%z = cumsum(x);
%plot(z);

%모터36
%t = 1:60;
%x = zeros(1,360);
%y = zeros(1,360);
%for i=1:5
 %   x = [x square(t*0.033*pi, 50)];
  %  x = [x y];
%end
%z = cumsum(x);
%plot(z);

%모터30
%t = 1:60;
%x = zeros(1,300);
%y = zeros(1,300);
%for i=1:5
 %   x = [x square(t*0.033*pi, 50)];
  %  x = [x y];
%end
%z = cumsum(x);
%plot(z);

%모터24
%t = 1:60;
%x = zeros(1,240);
%y = zeros(1,240);
%for i=1:5
 %   x = [x square(t*0.033*pi, 50)];
  %  x = [x y];
%end
%z = cumsum(x);
%plot(z);

%모터18
%t = 1:60;
%x = zeros(1,180);
%y = zeros(1,180);
%for i=1:5
 %   x = [x square(t*0.033*pi, 50)];
  %  x = [x y];
%end
%z = cumsum(x);
%plot(z);

%모터12
%t = 1:60;
%x = zeros(1,120);
%y = zeros(1,120);
%for i=1:5
 %   x = [x square(t*0.033*pi, 50)];
  %  x = [x y];
%end
%z = cumsum(x);
%plot(z);

%모터6
%t = 1:60;
%x = zeros(1,60);
%y = zeros(1,60);
%for i=1:5
 %   x = [x square(t*0.033*pi, 50)];
  %  x = [x y];
%end
%z = cumsum(x);
%plot(z);

%모터54 최고값 변화 테스트
%t = 1:60;
%x = zeros(1,540);
%y = zeros(1,540);
%for i=1:3
 %   x = [x 0.03*square(t*0.033*pi, 50)];
  %  x = [x y];
%end
%z = cumsum(x);
%plot(z);

%%t
%plot(t5 ,L5)

