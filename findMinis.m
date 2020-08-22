% Automated detection of minis in culture
% BA Toth
% 200822

data = cultureoverlays; %rename data for ease of use

med = median(data,1); %find the median value for each trace in the dataset
frames = 1:300;
frames = frames';
for i = 1:size(data,2)
    norm(:,i) = (data(:,i)-med(i))/med(i); %normalize data by subtracting and dividing by the median
    for j = 1:size(norm,2)
        fit = fitlm(frames,norm(:,i),'quadratic'); %linearize data for spike detection by fitting to a linear model
        lin(:,i) = norm(:,i) - fit.Fitted;
        for k = 1:size(lin,2)
            findMin = min(lin(:,k)); %reindex all the traces such that the lowest value is zero
            lin(:,k) = lin(:,k)-findMin; 
            threshold = 1.6*median(lin(:,k)); %define a threshold fluorescence for peak detectance
            minis(k) = numel(findpeaks(lin(:,k),'MinPeakHeight',threshold)); %find all instance of spikes above threshold
            tot_minis = sum(minis); %add them all together to approximate the number of minis in the data set
        end
    end
end