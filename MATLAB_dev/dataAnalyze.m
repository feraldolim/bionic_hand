function dataAnalyze
load_dir = 'gesture data/30s7g_EVAN/training_data/';

load([load_dir 'rawDataSized1.mat']);

gesture_size = size(gesture_sized,2);
data_size = size(rest_sized,2);

rest_avg = ((rest_sized*ones(size(rest_sized,2),1))/size(rest_sized,2))*ones(1,size(rest_sized,2));

train_time = time();
%% Get weight for PCA
X = {};
Cx = {};
V = {};
D = {};
for m = 1:gesture_size
    X{m} = ((gesture_sized{m}-rest_avg)./rest_avg)';
    Cx{m} = cov(X{m});
    [V{m},D{m}] = eig(Cx{m});
    Cy{m} = diag((1/(data_size-1))*D{m});
%    figure
%    bar(Cy{m});
end
%Feraldo
%E = [V{1}(:,5:8) V{2}(:,5:8) V{3}(:,7:8) V{4}(:,5:8) V{5}(:,7:8) V{6}(:,6:8) V{7}(:,5:8)];
%Evan
%E = [V{1}(:,6:8) V{2}(:,5:8) V{3}(:,7:8) V{4}(:,7:8) V{5}(:,7:8) V{6}(:,7:8) V{7}(:,5:8)];
%William
%E = [V{1}(:,6:8) V{2}(:,6:8) V{3}(:,8:8) V{4}(:,7:8) V{5}(:,7:8) V{6}(:,5:8) V{7}(:,7:8)];
%Michelle
E = [V{1}(:,6:8) V{2}(:,6:8) V{3}(:,5:8) V{4}(:,5:8) V{5}(:,7:8) V{6}(:,6:8) V{7}(:,5:8)];

%E = [V{1}(:,7:8) V{2}(:,7:8) V{3}(:,7:8) V{4}(:,7:8) V{5}(:,7:8) V{6}(:,7:8) V{7}(:,7:8)];
E = pinv(E);
train_duration = time() - train_time
save('PCA.mat','E','Cy');

