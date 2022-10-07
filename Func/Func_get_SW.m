function [dev, sw] = Func_get_SW(power)
dev = [0; power(2:end)-power(1:end-1)]; % power deviation

k = 3;
idx = kmeans(dev,k);
k_mean = [mean(dev(idx==1)) mean(dev(idx==2)) mean(dev(idx==3))];
state.on = find(k_mean == max(k_mean));
state.off = find(k_mean == min(k_mean));
temp = mink(k_mean,2);
state.idle = find(k_mean == temp(2));

on = idx==state.on;
off = idx==state.off;
idle = idx==state.idle;

mat_L = zeros(height(on),1); mat_R = zeros(height(on),1); % def Left, Right index of SW
tol.L = 2; tol.R = 2;
mat_L(find(on == 1)-tol.L) = 1;
mat_R(find(off == 1)+tol.R) = 1;

dev_L = [0;mat_L(2:end)+mat_L(1:end-1)];
mat_L(dev_L == 2) = 0;

dev_R = [mat_R(2:end)+mat_R(1:end-1); 0];
mat_R(dev_R == 2) = 0;

L = find(mat_L == 1);
R = find(mat_R == 1);
test = L;
test(1:height(R),2) = R;
% omitted sw-left
for i = 1:height(L)-1
    if L(i+1) < R(i) % right omitted
        R = [R(1:i-1);L(i+1)-tol.L;R(i:end)];
        test(1:height(R),2) = R;
    elseif L(i) > R(i) % left omitted
        L = [L(1:i-1);R(i-1)+tol.L;L(i:end)];
    end
end

if height(L) > height(R)
    L(end) = [];
end

sw = table(L,R);
end