function gesture = evaluatePCA(dir,emg_data,gest_size,range_E)

% Read eigenvectors array from the file directory.
E = dlmread(dir);

% Start counting calculation time
eval_time = time();

% Classify the gestures using principal components
val = abs(E*emg_data');
idx = 0;
last_idx = 1;
for i=1:gest_size
  idx = range_E(i) + idx;
  result(i) = min(val(last_idx:idx,1));
  last_idx = idx+1;
end
gesture = find(result == min(result));
%vec_norm = norm(emg_data' - E'*result)
%gesture = find(vec_norm(:,1) == min(vec_norm(:,1)));

% Take computation time
eval_duration = time() - eval_time;
