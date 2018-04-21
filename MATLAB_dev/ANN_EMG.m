%% Artificial Neural Network data classifier using MLP
% This is a classifier code based on learning weights and bias from MLP_NNSim1.m
%
% [Output description]
% 000 : Gesture 1   011 : Gesture 4    110 : Gesture 7
% 001 : Gesture 2   100 : Gesture 5
% 010 : Gesture 3   101 : Gesture 6
%
% [Input description]
% 8 EMG input channels, 7 gesture data of a fixed size each
% Load input from the directory, in this case:
%       ['gesture data/30s7g_' name '/evaluation_data/rawDataSized' num2str(data) '.mat']
% Where name is from directory, for example name = 'FERALDO' , data = 1
% Directory path will be:
%       'gesture data/30s7g_FERALDO/evaluation_data/rawDataSized1.mat'
%
% name      -> experiment subject's name (stated on directory path)
% index     -> raw evaluation data index, there are 3 data available (choose 1~3)

function ANN_EMG(name,index)
%% Input and Output
% Load evaluation data set
load(['gesture data/30s7g_' name '/evaluation_data/rawDataSized' num2str(index) '.mat']);
% Load learning weights
load(['gesture data/30s7g_' name '/training_data/learning_weights.mat']);

% Input data
% 8 EMG input arrays, 7 gesture data of a fixed size each
% Combine data by appending columns, test for the variance from normalized rest
rest_avg = ((rest_sized*ones(size(rest_sized,2),1))/size(rest_sized,2))*ones(1,size(rest_sized,2));
x = [];
for i=1:size(gesture_sized,2)
    %     data{i} = gesture_sized{i};
    data{i} = (gesture_sized{i}-rest_avg)./rest_avg;
    x = [x data{i}];
end
x = x';

% Output data
% 000 : Gesture 1   011 : Gesture 4    110 : Gesture 7
% 001 : Gesture 2   100 : Gesture 5
% 010 : Gesture 3   101 : Gesture 6
%------------- DATA LEARNING OUTPUTS, CHANGE SIZE FOR TESTING
d1 = [zeros(1,4*size(rest_sized,2)) ones(1,3*size(rest_sized,2))];
d2 = [zeros(1,2*size(rest_sized,2)) ones(1,2*size(rest_sized,2)) zeros(1,2*size(rest_sized,2)) ...
    ones(1,1*size(rest_sized,2))];
d3 = [zeros(1,1*size(rest_sized,2)) ones(1,1*size(rest_sized,2)) zeros(1,1*size(rest_sized,2)) ...
    ones(1,1*size(rest_sized,2)) zeros(1,1*size(rest_sized,2)) ones(1,1*size(rest_sized,2)) ...
    zeros(1,1*size(rest_sized,2))];
%-------------
% d1 = [zeros(1,4*400) ones(1,2*400)];
% d2 = [zeros(1,2*400) ones(1,2*400) zeros(1,2*400)];
% d3 = [zeros(1,1*400) ones(1,1*400) zeros(1,1*400) ...
%     ones(1,1*400) zeros(1,1*400) ones(1,1*400)];

% Combine in columns
D = [d1; d2; d3]';

% size of data
m = size(x,1);

for n = 1:m
    % Output yA in 1st layer of perceptron
    vA = wA*(x(n,:))' + bA;
    yA = tanh(vA);
    
    % Output yB in 2nd layer of perceptron
    vB = wB*yA + bB;
    yB = tanh(vB);
    
    % Output yC in 3rd layer of perceptron
    vC = wC*yB + bC;
    yC(:,n) = vC;
end

%% Plot figures
% learning result output plot
subplot(2,3,1); plot(yC(1,:)','b');
grid on; axis([0 m -0.5 1.5]);
title('yC, 1st Column');
subplot(2,3,4); plot(d1,'r');
grid on; axis([0 m -0.5 1.5]);
title('D, 1st Column');

subplot(2,3,2); plot(yC(2,:)','b');
grid on; axis([0 m -0.5 1.5]);
title('yC, 2nd Column');
subplot(2,3,5); plot(d2,'r');
grid on; axis([0 m -0.5 1.5]);
title('D, 2nd Column');

subplot(2,3,3); plot(yC(3,:)','b');
grid on; axis([0 m -0.5 1.5]);
title('yC, 3rd Column');
subplot(2,3,6); plot(d3,'r');
grid on; axis([0 m -0.5 1.5]);
title('D, 3rd Column');