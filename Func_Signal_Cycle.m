function y = Func_Signal_Cycle(t, cycle, duty)
    y = square(cycle*t,duty)+randn(size(t))/10;
    if min(y) < 0
        y = y - min(y)*1.1;
    end

    % 참조: https://kr.mathworks.com/help/signal/ref/square.html#mw_38a6b971-f966-4d08-a2c1-21fd2396b127
end