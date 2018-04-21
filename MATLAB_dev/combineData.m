function combineData

load_dir = 'gesture data/30s7g_MICHELLE/evaluation_data/';

load([load_dir 'rawDataSized3.mat']);

data_size = size(rest_sized,2);

gesture_combined = [];
for i = 1:size(gesture_sized,2)
    gesture_combined = [gesture_combined;(gesture_sized{i})'];
end 

output_combined = [ones(data_size,1) zeros(data_size,6); ...
zeros(data_size,1) ones(data_size,1) zeros(data_size,5); ...
zeros(data_size,2) ones(data_size,1) zeros(data_size,4); ...
zeros(data_size,3) ones(data_size,1) zeros(data_size,3); ...
zeros(data_size,4) ones(data_size,1) zeros(data_size,2); ...
zeros(data_size,5) ones(data_size,1) zeros(data_size,1); ...
zeros(data_size,6) ones(data_size,1)];

gesture_combined;
output_combined;

save([load_dir 'rawDataCombined4.mat'], 'gesture_combined', 'rest_sized', 'output_combined','-v7');