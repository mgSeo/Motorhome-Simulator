function R = Func_NILM(power, dev, dyn)
% Mixed Integer LP --> SW(Sliding Window)
% sw = [1 length(power)];
len = length(power);
%%% Number of Vars
N = table();
N.fridge_dev = len-1;
N.ud_dev = len;
N.len = N.fridge_dev * 4 + N.ud_dev;

%%% Boundary of Vars
ub = ones(N.len,1);
ub(N.fridge_dev*4+1:end) = inf;
lb = zeros(N.len,1);

%%% Constraints
% Fridge condition, low <=> high
n = N.fridge_dev + N.fridge_dev;
A_fridge_low_high = zeros(n, N.len);
A_fridge_low_high(1:n,1:n*2) = repmat(eye(n),1,2);
A_fridge_low_high(n+1,1:n*2) = repelem([1 0 1 0],1,N.fridge_dev);
A_fridge_low_high(n+2,1:n*2) = repelem([0 1 0 1],1,N.fridge_dev);
A_fridge_low_high(n+3,1:n*2) = repelem([1 0 0 1],1,N.fridge_dev);
A_fridge_low_high(n+4,1:n*2) = repelem([0 1 1 0],1,N.fridge_dev);
B_fridge_low_high = ones(n+4,1);

% Fridge condition, Unit Commitment
n = N.fridge_dev*4;
A_fridge_uc = zeros(4,N.len);
A_fridge_uc(1:4,1:n) = repelem(eye(4),1,N.fridge_dev); % only 1 turn-on or turn-off
B_fridge_uc = ones(4,1);

% Fridge On
A_fridge_on_p = zeros(N.fridge_dev,N.len);
A_fridge_on_p(1:N.fridge_dev,1:N.fridge_dev) = eye(N.fridge_dev) * dyn.avg(1,1);
n = N.fridge_dev + N.fridge_dev;
A_fridge_on_p(1:N.fridge_dev,n+1:n+N.fridge_dev) = eye(N.fridge_dev) * dyn.avg(2,1);
A_fridge_on_n = -A_fridge_on_p;
A_fridge_on_p(:, N.fridge_dev*4 + 1 : N.fridge_dev*4 + N.ud_dev - 1) = -eye(N.ud_dev-1);
A_fridge_on_n(:, N.fridge_dev*4 + 1 : N.fridge_dev*4 + N.ud_dev - 1) = -eye(N.ud_dev-1);
B_fridge_on_p = [];
for i = 1:len-1
    s = i;
    o = i+1;
    I = power(s) + power(o);
    B_fridge_on_p(i,1) = I;
end
B_fridge_on_n = -B_fridge_on_p;

% Fridge Off
A_fridge_off_p = zeros(N.fridge_dev,N.len);
n = N.fridge_dev;
A_fridge_off_p(1:N.fridge_dev,n+1:n+N.fridge_dev) = eye(N.fridge_dev) * dyn.avg(1,2);
n = N.fridge_dev + N.fridge_dev + N.fridge_dev;
A_fridge_off_p(1:N.fridge_dev,n+1:n+N.fridge_dev) = eye(N.fridge_dev) * dyn.avg(2,2);
A_fridge_off_n = -A_fridge_off_p;
B_fridge_off_p = [];
A_fridge_off_p(:, N.fridge_dev*4 + 2 : N.fridge_dev*4 + N.ud_dev) = -eye(N.ud_dev-1);
A_fridge_off_n(:, N.fridge_dev*4 + 2 : N.fridge_dev*4 + N.ud_dev) = -eye(N.ud_dev-1);
for i = 2:len
    s = i - 1;
    o = i;
    I = dev(s) + dev(o);
    B_fridge_off_p(i-1,1) = I;
end
B_fridge_off_n = -B_fridge_off_p;

% Combination of constriants
A_fridge_condition = [A_fridge_low_high; A_fridge_uc];
B_fridge_condition = [B_fridge_low_high; B_fridge_uc];

A_fridge_onoff = [A_fridge_on_p; A_fridge_on_n; A_fridge_off_p; A_fridge_off_n];% A_fridge_pattern_on_p; A_fridge_pattern_on_n; A_fridge_pattern_off_p; A_fridge_pattern_off_n];
B_fridge_onoff = [B_fridge_on_p; B_fridge_on_n; B_fridge_off_p; B_fridge_off_n];% B_fridge_pattern_on_p; B_fridge_pattern_on_n; B_fridge_pattern_off_p; B_fridge_pattern_off_n];

A = [A_fridge_condition; A_fridge_onoff];
B = [B_fridge_condition; B_fridge_onoff];
Aeq = [];
Beq = [];

%%% Objectives
% Uclidian distance
f = zeros(N.len,1);
f(end-N.ud_dev+1:end) = 99999;

%%% Other params
intcon = 1:N.len-N.ud_dev;
x0 = [];
options = optimoptions('intlinprog','Display','off');

[x,~,exitflag] = intlinprog(f,intcon,A,B,Aeq,Beq,lb,ub,x0,options);

%% result
R = [];
R(1:len,1) = [x(1:N.fridge_dev); 0]; x(1:N.fridge_dev) = [];
R(1:len,2) = [0; x(1:N.fridge_dev)]; x(1:N.fridge_dev) = [];
R(1:len,3) = [x(1:N.fridge_dev); 0]; x(1:N.fridge_dev) = [];
R(1:len,4) = [0; x(1:N.fridge_dev)]; x(1:N.fridge_dev) = [];
% R = table();
% R.low_on = [x(1:N.fridge_dev); 0]; x(1:N.fridge_dev) = [];
% R.low_off = [0; x(1:N.fridge_dev)]; x(1:N.fridge_dev) = [];
% R.high_on = [x(1:N.fridge_dev); 0]; x(1:N.fridge_dev) = [];
% R.high_off = [0; x(1:N.fridge_dev)]; x(1:N.fridge_dev) = [];
end