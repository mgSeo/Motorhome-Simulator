function y = Func_Signal_Cycle(t, cycle, duty)
   y = square(cycle*t,duty)+randn(size(t))/50;
    if min(y)<0
       y=y-min(y)*1.1;
    end
end