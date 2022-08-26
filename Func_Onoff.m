function y=Func_Onoff(t,w)
y= rectpuls(t,w)+randn(size(t))/10;
end