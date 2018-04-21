%% Application to fetch raw EMG data from Myo
% Libraries used: MyoMex C++ Lib source: https://github.com/mark-toma/MyoMex
%
% Install Add-on MinGW C/C++ compiler for MATLAB to run this
% Refer to the github readme instructions
%
% [Input description]
% gesture_count     -> input total number of planned gestures streaming
% duration          -> input duration of each gesture streams (in seconds)
% data              -> input for either training data or evaluation data
%                      data example: 'training'
% directory         -> input directory path to save gesture data
%                      path example: 'gesture data/30s7g_FERALDO/'
%
% Input usage example:    
%       getEMGrawData(7,30,'training','gesture data/30s7g_FERALDO/')
%
function getEMGrawData(gesture_count,duration,data,directory)
tic;
%% Save data directory
if isequal(data,'training')
    save_dir = [directory 'training_data/'];
    fetch_count = 1;
elseif isequal(data,'evaluation')
    save_dir = [directory 'evaluation_data/'];
    fetch_count = 3;
end

%% Use one Myo device
countMyos = 1;

%% Instantiate MyoMex
% After constructing a new |MyoMex| instance, we'll inspect its properties.
mm = MyoMex(countMyos);

%%
% Notice that the only property of |mm| is a |1xcountMyos| MyoData object.
% There is no device data stored by |mm|. The data from each physical Myo
% device is passed through |mm| to each element of |mm.myoData|.

%% Inspect |MyoData|
% Since |MyoData| objects inherit from |handle|, we can get handles to the
% |MyoData| objects representing each physical device and use them
% directly.

m1 = mm.myoData(1);

%% Collect Data Here
for n = 1:fetch_count
    %% Collect about T seconds of data
    T = duration; % seconds
    
    disp('Prepare to take rest gesture in 5 seconds from now.');
    for i = 1:5
        disp(i); disp('...');
        pause(1);
    end
    disp(['Recording for ' num2str(T) ' seconds.']);
    m1.clearLogs()
    m1.startStreaming();
    pause(T);
    m1.stopStreaming();
    fprintf('Logged rest gesture data for %d seconds,\n\t',T);
    fprintf('EMG samples: %10d\tApprox. EMG sample rate: %5.2f\n\t',...
        length(m1.timeEMG_log),length(m1.timeEMG_log)/T);
    
    rest = m1.emg_log;
    disp('Finish taking rest gesture. Proceeding to the next gesture logging.');
    
    for loop_count = 1:gesture_count
        disp('Prepare in 5 seconds from now.');
        for i = 1:5
            disp(i); disp('...');
            pause(1);
        end
        
        disp(['Recording for ' num2str(T) ' seconds.']);
        m1.clearLogs()
        m1.startStreaming();
        pause(T);
        m1.stopStreaming();
        fprintf('Logged gesture %d data for %d seconds,\n\t',loop_count,T);
        fprintf('EMG samples: %10d\tApprox. EMG sample rate: %5.2f\n\t',...
            length(m1.timeEMG_log),length(m1.timeEMG_log)/T);
        
        gesture{loop_count} = m1.emg_log;
        if loop_count < gesture_count
            disp('Finish taking new gesture data. Proceeding to the next gesture logging.');
        elseif n == fetch_count
            disp('Finished logging data.');
        end
    end
    
    %% Resize and save gesture data
    % take gesture sample size
    [~,gesture_size] = size(gesture);
    
    % Get minimum data size while taking note of the sizes
    for i=1:gesture_size+1
        if i < gesture_size+1
            data_size(i,1) = size(gesture{i},1);
        else
            data_size(i,1) = size(rest,1);
        end
    end
    array_size = min(data_size);
    
    % Reduce gesture and rest array
    for i=1:gesture_size
        gesture_sized{i} = transpose(gesture{i}(1:array_size,:));
    end
    rest_sized = transpose(rest(1:array_size,:));
    
    % Save resized data
    save([save_dir 'rawDataSized' num2str(n)],'rest_sized','gesture_sized');
end

%% Finish using MyoMex, stop the MyoMex instance
mm.delete();

%% Elapsed time
toc;
