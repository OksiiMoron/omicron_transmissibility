%[text] # Zadatak 1:
load T_data_matrix_input.mat
T_data_matrix_input;

%[text] ## Data transformation
% tabela prebacena u matricu radi matematickih operacija.
T_modified = T_data_matrix_input{:, :};

% Treci koren za immunity_proxy, boosters, older pop, diabetes
T_modified(:, [1,3,7,9]) = nthroot(T_modified(:, [1,3,7,9]),3);


% transformacija kolona fully vacc i HDI
T_modified(:, [2,10]) = -sqrt((max(T_modified(:, [2,10]))-T_modified(:, [2,10])));

% logaritam gustine populacije, cardiovasc, R_avg
T_modified(:, [5,8,18]) = log(T_modified(:, [5,8,18]));

% transformacija mobility retail, mobility grocery
T_modified(:, [11,12]) = log(T_modified(:, [11,12]) - min(T_modified(:, [11,12])));

% transformacija mobility parks, mobility transit
T_modified(:, [13,14]) = nthroot((T_modified(:, [13,14])-min(T_modified(:, [13,14]))), 3);

% kvadriranje median age
T_modified(:, 3) = T_modified(:, 3).^2;

% transformacija mobility workplace
T_modified(:, 15) = sqrt((T_modified(:, 15)-min(T_modified(:,15))));

% transformacija mobility residential
T_modified(:, 16) = nthroot(-(max(T_modified(:,16))-T_modified(:,16)),3);

%[text] ## Detekcija outliera i zamena istih medianom
bez_autlajera = DnRoutlier(T_modified);

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright","rightPanelPercent":32.3}
%---
