clear, clc, close all

% add path
addpath('../data')
addpath('../Func/')

% read data
load('VABJ0077_Accumulated_5min_datas.mat');
Data = movevars(Data, 'outdoor_temp', 'after', 'indoor_temp');
Data = movevars(Data, 'power', 'after', 'outdoor_temp');
% 1~14634, 14635~35289; <= Data.timestamp plot 해보면 알게됨.
data = Data(14635:35289,:);

% get sw of data
[dev, sw] = Func_get_SW(data.power);

% get on/off status of fridge
load('Fridge_param.mat') % 추후 수정필요
IDX = [[1:height(data)]' zeros(height(data),4)];
for w = 1:height(sw)
    idx = Func_NILM(data.power(sw.L(w):sw.R(w)),dev(sw.L(w):sw.R(w)),dyn);
    IDX(sw.L(w):sw.R(w),2:5) = round(idx);
end

Fridge = array2table(IDX);
titles = ["index","tp1_on", "tp1_off", "tp2_on", "tp2_off"];
for i = 1:5
    Fridge.Properties.VariableNames(i) = titles(i);
end