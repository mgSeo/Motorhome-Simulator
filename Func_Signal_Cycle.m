function y = Func_Signal_Cycle(t, cycle, duty)
   y = 12*square(cycle*t,duty);
   
    if min(y)<0
       y=y-min(y)*1.1;
    end
  

end