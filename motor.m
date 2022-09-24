%motor

t5= 1:1000;

cycle2= 2*pi/((54+6)*10);
duty2=10;

L5=Func_Signal_Cycle(t5, cycle2, duty2);
plot(t5,L5)