function combineData(filter_flag)

% Determine EMG files repository and where to save the combined data using filter flag
if filter_flag == 1
  emg_files = dir('/home/feraldo/ROS_ws/bionic_hand_ws/data/filtered/emg_array_*.csv');
  save_dir = '/home/feraldo/ROS_ws/bionic_hand_ws/data/filtered/';
elseif filter_flag == 0
  emg_files = dir('/home/feraldo/ROS_ws/bionic_hand_ws/data/unfiltered/emg_array_*.csv');
  save_dir = '/home/feraldo/ROS_ws/bionic_hand_ws/data/unfiltered/';
endif

% Calculate file size
file_size = size(emg_files,1);

% Assign each of the separate files into gesture array
for i=1:file_size
  file_name = [save_dir emg_files(i).name];
  gesture{i} = load(file_name);
  gesture{i}(1,:) = [];
  array_size(i) = size(gesture{i},1);
end

% Append all the gestures into one single array
gesture_sized = {};
gesture_combined_tr = [];
for i=1:file_size
  gesture_sized{i} = transpose(gesture{i}(1:min(array_size),:));
  gesture_combined_tr = [gesture_combined_tr gesture_sized{i}];
end

% Transpose the result so it became ~x8 dimension
gesture_combined = transpose(gesture_combined_tr);
% Calculate total data samples
data_size = size(gesture_sized{1},2);

% Label the output data based on the amount of unique gestures
output_combined = [];
for i=1:file_size
  if i == 1
    output_combined = [output_combined; ones(data_size,1) zeros(data_size,file_size-i)];
  elseif i < file_size && i > 1
    output_combined = [output_combined; zeros(data_size,i-1) ones(data_size,1) zeros(data_size,file_size-i)];
  elseif i == file_size
    output_combined = [output_combined; zeros(data_size,i-1) ones(data_size,1)];
  endif
end
gesture_combined;
output_combined;

% Save the output raw data combined into a mat file.
save([save_dir 'rawDataCombined.mat'], 'gesture_combined', 'output_combined','-v7');
