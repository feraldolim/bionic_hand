% DESCRIPTION
% File names indexing
% rp1001        -> rp/ep : regular/extra pose
%               -> 1001  : 10 seconds, gesture index 01
% GESTURE TYPE LISTING
% ep__01 = phone grip
% rp__01 = fist
% rp__02 = hand spread
% rp__03 = index finger up
% rp__04 = index and middle finger up
% rp__05 = index, middle and ring finger up
% rp__06 = index, middle, ring and pinky finger up

function plotMyoGraph(filename)

format long;

% Save plots to this directory
plot_dir = 'D:\SGU\Semester 7\Bionic Hand\MATLAB_dev\plots\';
% Load data from this directory
csv_dir = 'D:\SGU\Semester 7\Bionic Hand\MATLAB_dev\csv files\';

%% Get file names and count the total files
[~,file_count] = size(filename);

%% Initialize empty matrices and cell for faster performance
data_size = [];
data = {};

%% Plotting EMG Graphs for each files
for i=1:file_count
    % Choose one file first and read the raw data
    file_choose = [csv_dir filename{i} '.csv'];
    rawData = csvread(file_choose,1,0);
    
    % Get current data size for future NN application
    [data_size(i),~] = size(rawData);
    
    % Assign each raw data for easier assignment on plotting and saving
    data{1,i} = filename{i};    % File name
    data{2,i} = rawData(:,1);   % UNIX timestamp
    data{3,i} = rawData(:,2);   % EMG 1 data
    data{4,i} = rawData(:,3);   % EMG 2 data
    data{5,i} = rawData(:,4);   % EMG 3 data
    data{6,i} = rawData(:,5);   % EMG 4 data
    data{7,i} = rawData(:,6);   % EMG 5 data
    data{8,i} = rawData(:,7);   % EMG 6 data
    data{9,i} = rawData(:,8);   % EMG 7 data
    data{10,i} = rawData(:,9);  % EMG 8 data
    
    % Plot each EMG data from Pod 1-8 for current file
    grid on;  
    figure('visible','off');
    plot_emg(i,1) = plot(data{2,i},data{3,i});
    title(['EMG 1 Graph for ' filename{i}]); xlabel('UNIX Timestamp'); ylabel('Amplitude');
    grid on; 
    figure('visible','off'); 
    plot_emg(i,2) = plot(data{2,i},data{4,i});
    title(['EMG 2 Graph for ' filename{i}]); xlabel('UNIX Timestamp'); ylabel('Amplitude'); 
    grid on; 
    figure('visible','off');
    plot_emg(i,3) = plot(data{2,i},data{5,i});
    title(['EMG 3 Graph for ' filename{i}]); xlabel('UNIX Timestamp'); ylabel('Amplitude'); 
    grid on;  
    figure('visible','off');
    plot_emg(i,4) = plot(data{2,i},data{6,i});
    title(['EMG 4 Graph for ' filename{i}]); xlabel('UNIX Timestamp'); ylabel('Amplitude');
    grid on; 
    figure('visible','off');
    plot_emg(i,5) = plot(data{2,i},data{7,i});
    title(['EMG 5 Graph for ' filename{i}]); xlabel('UNIX Timestamp'); ylabel('Amplitude'); 
    grid on; 
    figure('visible','off'); 
    plot_emg(i,6) = plot(data{2,i},data{8,i});
    title(['EMG 6 Graph for ' filename{i}]); xlabel('UNIX Timestamp'); ylabel('Amplitude'); 
    grid on;  
    figure('visible','off');
    plot_emg(i,7) = plot(data{2,i},data{9,i});
    title(['EMG 7 Graph for ' filename{i}]); xlabel('UNIX Timestamp'); ylabel('Amplitude');
    grid on; 
    figure('visible','off');
    plot_emg(i,8) = plot(data{2,i},data{10,i});
    title(['EMG 8 Graph for ' filename{i}]); xlabel('UNIX Timestamp'); ylabel('Amplitude'); 
    
    % Save plotted EMG graph into the assigned folder
    for k=1:8
        saveas(plot_emg(i,k),fullfile(plot_dir,sprintf('emg_%d_%s.jpg',k,filename{i})));
    end
end

% Save raw data and data size for future NN application
save rawData data data_size;

% Finish
disp('Done plotting figures');