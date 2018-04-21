%% Two Output Classifier Test using Single Layered Perceptron
function SLP_learn_test

%% Input and Output
% Load data from dataSonar.mat
load rawData data data_size

% Get the column size and row size
[rowsize,~] = size(data);

% 1. Get input testing data
for n = 2:rowsize
    for m = 1:7
        x{m,n-1} = data{n,m};
    end
end
% Choose which data to classifiy here!
xtest = x(5:6,2:9);
% Output
%y = [0 1]';

%% Initiate weights and bias, specify learning rate
w = rand(1,8);           % weights
b = rand(1);              % bias
m = max(size(xtest{1,1}));    % size of data
s = max(size(xtest{2,1}));

learning_sample = [xtest{1,1} xtest{1,2} xtest{1,3} xtest{1,4} xtest{1,5} xtest{1,6} xtest{1,7} xtest{1,8} zeros(m,1) ;...
    xtest{2,1} xtest{2,2} xtest{2,3} xtest{2,4} xtest{2,5} xtest{2,6} xtest{2,7} xtest{2,8} ones(s,1)];

% 2. Learning rate used here is 0.01.
lr = 0.01;                

%% Learning algorithm
% 3. Here the learning process is set to 1000 times.
lp = 1000;
for i = 1:lp
    for n = 1:(m+s)
        v = w*learning_sample(n,1:8)' + b;      % new v
        yp(n) = sgn(v);         % calculate output
        e(n) = learning_sample(n,9) - yp(n);    % error calculation
        w = w + lr*e(n)*learning_sample(n,1:8); % learning algorithm
        b = b + lr*e(n)*1;      % updated bias
    end
    if i == 0.25*lp
        disp('25% done.');
    elseif i == 0.5*lp
        disp('50% done.');
    elseif i == 0.75*lp
        disp('75% done.');
    elseif i == 1*lp
        disp('100% done.'); 
    end
    E(i) = e*e';                % square error
end

%% Plot figures
% 4. Perceptron classification results
figure
ts=1:(m+s); 
plot(ts,yp,'*',ts,learning_sample(:,9),'or');

% 5. Square error versus iterations
figure
tk=1:lp; 
plot(tk,E); 

