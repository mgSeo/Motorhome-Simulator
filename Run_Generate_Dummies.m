clc, clear, close all

t = 1:60;
x = zeros(1,540);
y = zeros(1,540);
for i=1:5
    x = [x square(t*0.033*pi, 50)];
    x = [x y];
end
z = cumsum(x);
plot(z);

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

