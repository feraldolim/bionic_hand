function [E,Cy] = get_PCA_comp(threshold, filter_flag)

% Declare separate directory for unfiltered and filtered data
if filter_flag == 1
  load_dir = '/home/feraldo/ROS_ws/bionic_hand_ws/data/filtered/emg_array_*.csv'
  file_dir = '/home/feraldo/ROS_ws/bionic_hand_ws/data/filtered/';
elseif filter_flag == 0
  load_dir = '/home/feraldo/ROS_ws/bionic_hand_ws/data/unfiltered/emg_array_*.csv'
  file_dir = '/home/feraldo/ROS_ws/bionic_hand_ws/data/unfiltered/';
endif

% Collect EMG data here, and calculate number of gestures
emg_files = dir(load_dir);
file_size = size(emg_files,1);

for i=1:file_size
  % Separate rest gesture and other gestures
  file_name = [file_dir emg_files(i).name];
  if i==1
    rest = load(file_name);
  else
    gesture{i-1} = load(file_name);
  endif

  % Remove 1st empty row and calculate each data's array size from raw EMG data
  if isequal(rest(1,:),zeros(1,8))
    rest(1,:) = [];
    array_size(i) = size(rest,1);
  elseif isequal(gesture{i-1}(1,:),zeros(1,8))
    gesture{i-1}(1,:) = [];
    array_size(i) = size(gesture{i-1},1);
  endif
end

% Time specifications:
Fs = min(array_size)/30;        % samples per 30 second
dt = 1/Fs;                      % seconds per sample
StopTime = 30;                  % seconds
t = (0:dt:StopTime-dt)';
N = size(t,1);

% Frequency specifications:
dF = Fs/N;                      % hertz
f = -Fs/2:dF:Fs/2-dF;           % hertz

% Apply Fourier Transform to the gestures
gesture_sized = {};
for i=1:file_size-1
  % Fourier Transform:
  gesture_sized{i} = abs(fftshift(fft(transpose(gesture{i}(1:min(array_size),:)))))/N;
end
rest_sized = abs(fftshift(fft(transpose(rest(1:min(array_size),:)))))/N;
%length(rest_sized)
%plot(f,rest_sized);

% Calculate gesture size
gesture_size = size(gesture_sized,2)+1;

% Calculate rest gesture average array for normalization
rest_avg = ((rest_sized*ones(size(rest_sized,2),1))/size(rest_sized,2))*ones(1,size(rest_sized,2));

% Start counting computation time
train_time = time();

% Initialize all variables to boost computation time
X = {};
Cx = {};
V = {};
D = {};
% Get weight for PCA
for m = 1:gesture_size
    % Normalize gestures
    if m == 1
      X{m} = ((rest_sized-rest_avg)./rest_avg)';
    else
      X{m} = ((gesture_sized{m-1}-rest_avg)./rest_avg)';
    endif
    % Calculate eigenvalues' covariance
    Cx{m} = cov(X{m});
    [V{m},D{m}] = eig(Cx{m});
    Cy{m} = diag((1/(min(array_size)-1))*D{m});
%    figure
%    bar(Cy{m});
end
%(Cy{1}(6)/Cy{1}(8))*100
%(Cy{2}(6)/Cy{2}(8))*100
%(Cy{3}(6)/Cy{3}(8))*100
%(Cy{4}(4)/Cy{4}(8))*100
%(Cy{5}(6)/Cy{5}(8))*100
%(Cy{6}(6)/Cy{6}(8))*100
%(Cy{7}(6)/Cy{7}(8))*100

% Initialize empty eigenvector to boost computation time
threshold;
E = [];
% Take eigenvectors based on threshold
for i = 1:gesture_size
  ind = min(find((Cy{i}/Cy{i}(8)) >= threshold));
  E = [E V{i}(:,ind:8)];
  range(i) = 9-ind;         % Get range from the chosen eigenvectors. Usually around 2~4 for each gesture.
end
range
%E = [V{1}(:,7:8) V{2}(:,7:8) V{3}(:,7:8) V{4}(:,7:8) V{5}(:,7:8) V{6}(:,7:8) V{7}(:,7:8)];

% Take inverse of the chosen eigenvectors
E = pinv(E);

% Show computation time
train_duration = time() - train_time

% Save E and range into .csv files
%save('PCA.mat','E','Cy');
csvwrite([file_dir 'PCA.mat'],E);
csvwrite([file_dir 'range.csv'],range);
