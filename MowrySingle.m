%Mowry single variate statistics

%create a dialog box to ask if you want to do it on orrigional or PCA data
%prompt = {'Is this Regular or PCA data? (yes/no)'};
%dlgtitle = 'Data Type';
%dims = [1 40];
%definput = {'no'};
%answer = inputdlg(prompt,dlgtitle,dims,definput,);
%sIndex = isequal(answer, 'no');

sIndex = input('Is this PCA data? (yes/no)', 's');

%pre-allocating memory
mMean = zeros([9 56]);
mMedian = zeros([9 56]);
mMode = zeros([9 56]);
mSD = zeros([9 56]);
mVar = zeros([9 56]);
mSkew = zeros([9 56]);
mKurt = zeros([9 56]);

switch sIndex
    case 'no' 

    %run basic stats on all variables in all locations
    for i = 1:9
    
        mMean(i,:) = mean(cSampLoc{i}, 'omitnan');
        mMedian(i,:) = median(cSampLoc{i}, 'omitnan');
        mMode(i,:) = mode(cSampLoc{i});
        mSD(i,:) = std(cSampLoc{i}, 'omitnan');
        mVar(i,:) = var(cSampLoc{i}, 'omitnan');
        mSkew(i,:) = skewness(cSampLoc{i});
        mKurt(i,:) = kurtosis(cSampLoc{i});
    
    end
    
    
    %preallocates memory
    mKSStat = zeros(size(9, 9, 56));
    mKSPVal = zeros(size(9, 9, 56));
    
    %preforms a two sample KS test on all the data
    for i = 1:9
        for j = 1:9
            for k = 1:56
            [mKSStat(i,j,k),mKSPVal(i,j,k)] = kstest2(cSampLoc{i}(:, k), ...
                cSampLoc{j}(:, k));
            end
        end
    end
    

    case 'yes'
        mMean(i,:) = mean(cSampLoc{i}, 'omitnan');
        mMedian(i,:) = median(cSampLoc{i}, 'omitnan');
        mMode(i,:) = mode(cSampLoc{i});
        mSD(i,:) = std(cSampLoc{i}, 'omitnan');
        mVar(i,:) = var(cSampLoc{i}, 'omitnan');
        mSkew(i,:) = skewness(cSampLoc{i});
        mKurt(i,:) = kurtosis(cSampLoc{i});


    otherwise
        error('please answer yes or no to the dialog box')

end


    %plots KS results for each element    
    heatmap(mKSPVal(:,:,1), "Title", 'KS test', ...
        'XDisplayLabels', cAreaNames,...
        'YDisplayLabels', flipud(cAreaNames));

    heatmap(mKSPVal(:,:,2), "Title", 'KS test', ...
        'XDisplayLabels', cAreaNames,...
        'YDisplayLabels', flipud(cAreaNames));

    heatmap(mKSPVal(:,:,3), "Title", 'KS test', ...
        'XDisplayLabels', cAreaNames,...
        'YDisplayLabels', flipud(cAreaNames));

    heatmap(mKSPVal(:,:,4), "Title", 'KS test', ...
        'XDisplayLabels', cAreaNames,...
        'YDisplayLabels', flipud(cAreaNames));

    heatmap(mKSPVal(:,:,5), "Title", 'KS test', ...
        'XDisplayLabels', cAreaNames,...
        'YDisplayLabels', flipud(cAreaNames));

    heatmap(mKSPVal(:,:,6), "Title", 'KS test', ...
        'XDisplayLabels', cAreaNames,...
        'YDisplayLabels', flipud(cAreaNames));

    heatmap(mKSPVal(:,:,7), "Title", 'KS test', ...
        'XDisplayLabels', cAreaNames,...
        'YDisplayLabels', flipud(cAreaNames));

    heatmap(mKSPVal(:,:,8), "Title", 'KS test', ...
        'XDisplayLabels', cAreaNames,...
        'YDisplayLabels', flipud(cAreaNames));

    heatmap(mKSPVal(:,:,9), "Title", 'KS test', ...
        'XDisplayLabels', cAreaNames,...
        'YDisplayLabels', flipud(cAreaNames));