function evaluatePCA
load_dir = 'gesture data/30s7g_EVAN/evaluation_data/';

load([load_dir 'rawDataSized2.mat']);
load('PCA.mat');

gesture_size = size(gesture_sized,2);
data_size = size(rest_sized,2);

rest_avg = ((rest_sized*ones(size(rest_sized,2),1))/size(rest_sized,2))*ones(1,size(rest_sized,2));

eval_time = time();
%% Get weight for PCA
X = {};
for m = 1:gesture_size
    X{m} = ((gesture_sized{m}-rest_avg)./rest_avg)';
    for i = 1:data_size
        val = abs(E*(X{m}(i,:))');
%        val(val<0) = 0;
        result{m,i} = val;
%        sum1 = sum(val(1:4));
%        sum2 = sum(val(5:8));
%        sum3 = sum(val(9:10));
%        sum4 = sum(val(11:14));
%        sum5 = sum(val(15:16));
%        sum6 = sum(val(17:19));
%        sum7 = sum(val(20:23));
%        
%        if sum1 > sum2 && sum1 > sum3 && sum1 > sum4 && sum1 > sum5 && sum1 > sum6 && sum1 > sum7
%            gesture{m,i} = 1;
%        
%        elseif sum2 > sum1 && sum2 > sum3 && sum2 > sum4 && sum2 > sum5 && sum2 > sum6 && sum2 > sum7
%            gesture{m,i} = 2;   
%        
%        elseif sum3 > sum1 && sum3 > sum2 && sum3 > sum4 && sum3 > sum5 && sum3 > sum6 && sum3 > sum7
%            gesture{m,i} = 3;
%        
%        elseif sum4 > sum1 && sum4 > sum2 && sum4 > sum3 && sum4 > sum5 && sum4 > sum6 && sum4 > sum7
%            gesture{m,i} = 4;
%        
%        elseif sum5 > sum1 && sum5 > sum2 && sum5 > sum3 && sum5 > sum4 && sum5 > sum6 && sum5 > sum7
%            gesture{m,i} = 5;
%        
%        elseif sum6 > sum1 && sum6 > sum2 && sum6 > sum3 && sum6 > sum4 && sum6 > sum5 && sum6 > sum7
%            gesture{m,i} = 6;
%        
%        elseif sum7 > sum1 && sum7 > sum2 && sum7 > sum3 && sum7 > sum4 && sum7 > sum5 && sum7 > sum6
%            gesture{m,i} = 7;    
%        end
        
%        if any(result{m,i}(1:3) == max(result{m,i}))
%            gesture{m,i} = 1;
%        
%        elseif any(result{m,i}(4:6) == max(result{m,i}))
%            gesture{m,i} = 2;   
%        
%        elseif any(result{m,i}(7:10) == max(result{m,i}))
%            gesture{m,i} = 3;
%        
%        elseif any(result{m,i}(11:14) == max(result{m,i}))
%            gesture{m,i} = 4;
%        
%        elseif any(result{m,i}(15:17) == max(result{m,i}))
%            gesture{m,i} = 5;
%        
%        elseif any(result{m,i}(18:19) == max(result{m,i}))
%            gesture{m,i} = 6;
%        
%        elseif any(result{m,i}(20:23) == max(result{m,i}))
%            gesture{m,i} = 7;    
%        end
        
        vec_norm(m,i) = norm(X{m}(i,:)' - E'*result{m,i});
        gesture{m,i} = find(vec_norm(:,1) == min(vec_norm(:,1)));
    end
    
%    figure
%    plot(1:1:5984,cell2mat(gesture(m,:)));
end
vec_norm;

percentage = [];
for m = 1:gesture_size
    conf_matrix(m,1) = size(find(cell2mat(gesture(m,:)) == 1),2);
    conf_matrix(m,2) = size(find(cell2mat(gesture(m,:)) == 2),2);
    conf_matrix(m,3) = size(find(cell2mat(gesture(m,:)) == 3),2);
    conf_matrix(m,4) = size(find(cell2mat(gesture(m,:)) == 4),2);
    conf_matrix(m,5) = size(find(cell2mat(gesture(m,:)) == 5),2);
    conf_matrix(m,6) = size(find(cell2mat(gesture(m,:)) == 6),2);
    conf_matrix(m,7) = size(find(cell2mat(gesture(m,:)) == 7),2);
    
    percentage(m) = (size(find(cell2mat(gesture(m,:)) == m),2)/data_size)*100;
end
percentage
conf_matrix
eval_duration = time() - eval_time
% Save eigenvalue and weight data
%save eigenvalue_data cov V D a;

