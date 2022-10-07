function R = Func_NILM(power, dev, on_off)
% Mixed Integer LP --> SW(Sliding Window)
% sw = [1 length(power)];
len = length(power);
%%% Number of Vars
N = table();
N.fridge_low_on = len-1;
N.fridge_low_off = len-1;
N.fridge_high_on = len-1;
N.fridge_high_off = len-1;
% N.base = 1;
N.ud = len;
N.len = sum(N{:,:});

%%% Boundary of Vars
ub = ones(N.len,1);
ub(end-len+1:end) = inf;
lb = zeros(N.len,1);

%%% Constraints
% Fridge condition, low <=> high
n = N.fridge_low_on + N.fridge_low_off;
A_fridge_low_high = zeros(n, N.len);
A_fridge_low_high(1:n,1:n*2) = repmat(eye(n),1,2);
A_fridge_low_high(n+1,1:n*2) = repelem([1 0 1 0],1,N.fridge_low_on);
A_fridge_low_high(n+2,1:n*2) = repelem([0 1 0 1],1,N.fridge_low_on);
B_fridge_low_high = ones(n+2,1);

% Fridge condition, Unit Commitment
n = N.fridge_low_on + N.fridge_low_off + N.fridge_high_on + N.fridge_high_off;
A_fridge_uc = zeros(4,N.len);
A_fridge_uc(1:4,1:n) = repelem(eye(4),1,N.fridge_low_on); % only 1 turn-on or turn-off
B_fridge_uc = ones(4,1);

% Fridge types, low on<->high off, high on<->low off Unit Commitment
% n = 2;
% B_fridge_type = ones(n,1);
% A_fridge_type = zeros(n,N.len);
% A_fridge_type(1:n,1:N.fridge_low_on+N.fridge_low_off) = repelem(eye(n),1,N.fridge_low_on);
% A_fridge_type(1:n,N.fridge_low_on+N.fridge_low_off+1:N.fridge_low_on+N.fridge_low_off+N.fridge_high_on+N.fridge_high_off) = repelem(~eye(n),1,N.fridge_low_on);

% n = N.fridge_low_on + N.fridge_low_off;
% B_fridge_type = ones(n,1);
% A_fridge_type = zeros(n,N.len);
% A_fridge_type(1:n,1:n) = eye(n);
% A_fridge_type(n/2+1:n,n+1:n+N.fridge_high_on) = eye(n/2);
% A_fridge_type(1:n/2,n+N.fridge_high_on+1:n+N.fridge_high_on+N.fridge_high_off) = eye(n/2);

% Fridge On
A_fridge_on_p = zeros(N.fridge_low_on,N.len);
A_fridge_on_p(1:N.fridge_low_on,1:N.fridge_low_on) = eye(N.fridge_low_on) * on_off(1,1);
n = N.fridge_low_on + N.fridge_low_off;
A_fridge_on_p(1:N.fridge_low_on,n+1:n+N.fridge_high_on) = eye(N.fridge_high_on) * on_off(2,1);
A_fridge_on_n = -A_fridge_on_p;
A_fridge_on_p(:,end-len+1:end-1) = -eye(len-1);
A_fridge_on_n(:,end-len+1:end-1) = -eye(len-1);
B_fridge_on_p = [];
for i = 1:len-1
    s = i;
    o = i+1;
    I = dev(s) + dev(o);
    B_fridge_on_p(i,1) = I;
end
B_fridge_on_n = -B_fridge_on_p;

% Fridge Off
A_fridge_off_p = zeros(N.fridge_low_on,N.len);
n = N.fridge_low_on;
A_fridge_off_p(1:N.fridge_low_off,n+1:n+N.fridge_high_on) = eye(N.fridge_low_off) * on_off(1,2);
n = N.fridge_low_on + N.fridge_low_off + N.fridge_high_on;
A_fridge_off_p(1:N.fridge_low_off,n+1:n+N.fridge_high_on) = eye(N.fridge_high_off) * on_off(2,2);
% A_fridge_off_p(:,end-1) = 1;
A_fridge_off_n = -A_fridge_off_p;
B_fridge_off_p = [];
A_fridge_off_p(:,end-len+2:end) = -eye(len-1);
A_fridge_off_n(:,end-len+2:end) = -eye(len-1);
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

A_fridge_onoff = [A_fridge_on_p; A_fridge_on_n; A_fridge_off_p; A_fridge_off_n];
B_fridge_onoff = [B_fridge_on_p; B_fridge_on_n; B_fridge_off_p; B_fridge_off_n];

A = [A_fridge_condition; A_fridge_onoff];
B = [B_fridge_condition; B_fridge_onoff];
Aeq = [];
Beq = [];

%%% Objectives
% Uclidian distance
f = zeros(N.len,1);
f(end-len+1:end) = 99999;

%%% Other params
intcon = 1:N.len-2;
x0 = [];
options = optimoptions('intlinprog','Display','off');

[x,~,exitflag] = intlinprog(f,intcon,A,B,Aeq,Beq,lb,ub,x0,options);

%% result
R = [];
R(1:len,1) = [x(1:N.fridge_low_on); 0]; x(1:N.fridge_low_on) = [];
R(1:len,2) = [0; x(1:N.fridge_low_off)]; x(1:N.fridge_low_off) = [];
R(1:len,3) = [x(1:N.fridge_high_on); 0]; x(1:N.fridge_high_on) = [];
R(1:len,4) = [0; x(1:N.fridge_high_off)]; x(1:N.fridge_high_off) = [];
% R = table();
% R.low_on = [x(1:N.fridge_low_on); 0]; x(1:N.fridge_low_on) = [];
% R.low_off = [0; x(1:N.fridge_low_off)]; x(1:N.fridge_low_off) = [];
% R.high_on = [x(1:N.fridge_high_on); 0]; x(1:N.fridge_high_on) = [];
% R.high_off = [0; x(1:N.fridge_high_off)]; x(1:N.fridge_high_off) = [];
end