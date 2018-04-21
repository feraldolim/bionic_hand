%% Multi Layer Perceptron application to train network using EMG data
% Constructed using the predetermined neurons inside input, hidden, and
% output layers.
%
% [Output description]
% 000 : Gesture 1   011 : Gesture 4    110 : Gesture 7
% 001 : Gesture 2   100 : Gesture 5
% 010 : Gesture 3   101 : Gesture 6
%
% [Input description]
% 8 EMG input channels, 7 gesture data of a fixed size each
% Load input from the directory, in this case:
%       ['gesture data/30s7g_' name '/training_data/rawDataSized1.mat']
% Where name is from directory, for example name: 'FERALDO'
% Directory path will be:
%       'gesture data/30s7g_FERALDO/training_data/rawDataSized1.mat'
%
% name      -> experiment subject's name (stated on directory path)
%
function MLP_NNSim1(name)
%% Input and Output
load(['gesture data/30s7g_' name '/training_data/rawDataSized1.mat']);

% Input data
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
[~,input_size] = size(x);
m = size(x,1);

%% Determine input, hidden, and output layer nodes
input_layer = 3;
hidden_layer = 5;
output_layer = 3;

%% Initiate weights and bias, specify learning rate and learning process
% weights
wA = rand(input_layer,input_size);      
wB = rand(hidden_layer,input_layer);    
wC = rand(output_layer,hidden_layer);   

% bias
bA = rand(input_layer,1);               
bB = rand(hidden_layer,1);              
bC = rand(output_layer,1);              

% learning rate
lr = 0.1;

% learning process
lp = 5;

%% Learning algorithm
for count = 1:lp
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
        
        % Error output
        d = D(n,:);
        e(n,:) = d - yC(:,n)';             
        
        % Delta, weight difference, weight, and bias respectively (C)
        dC = -e(n,:)';                 
        dwC = -lr*dC*yB';         
        wC = wC + dwC;            
        bC = bC - lr*dC;          
        
        % Delta, weight difference, weight, and bias respectively (B)
        dB = wC'*dC.*dtanh(vB);   
        dwB = -lr*dB*yA';        
        wB = wB + dwB;            
        bB = bB - lr*dB;          
        
        % Delta, weight difference, weight, and bias respectively (A)
        dA = wB'*dB.*dtanh(vA);   
        dwA = -lr*dA*x(n,:);      
        wA = wA + dwA;            
        bA = bA - lr*dA;          
    end
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

save(['gesture data/30s7g_' name '/training_data/learning_weights.mat'],'wA','wB','wC','bA','bB','bC');