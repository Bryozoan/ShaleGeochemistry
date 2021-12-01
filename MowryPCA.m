% This is to do a PCA on all the data, then separate it out by location
% again and prepare it to be run through the MowrySingle again

%Note, you must run MowryVar script before running this one.

%z-score data to make it usable for PCA
%however, the 'zscore' function does not allow 'NaN' values, so I am
%writing my own zcore function based on the equation given in the MATLAB
%documentation
mSampDataz = (mSampData - mean(mSampData, 1, 'omitnan'))./std(mSampData, ...
    1, 'omitnan');

cLabels = table2cell(vMowryVariables);

%Calculates and displays in a plot a correlation matrix among the variables.
mCorrCo = corrcoef(mSampDataz, 'Rows', 'complete');
mCorrCo = flipud(mCorrCo);
%hold off
heatmap(mCorrCo, ...
    'Title', 'Correlation Mattrix',...
    'XDisplayLabels', cLabels,...
    'YDisplayLabels', flipud(cLabels));
mColor = [1 0 0
    1 1 0
    1 1 1
    0 0 0
    1 1 1
    0 1 0
    0 0 1];
colormap(mColor)


%preform Principal Component analysis on data
[mPCeq,mScore,vVariance,~,vExplained] = pca(mSampDataz);

% Separate out the data by location
mWRB1 = mScore(1:21, : );
mWRB2 = mScore(22:152, : );
mWRB3 = mScore(153:214, : );
mWRB4 = mScore(215:220, : );
mWRB5 = mScore(221:248, : );
mWRB6 = mScore(249:295, : );
mWRB7 = mScore(296:321, : );
mHB1 = mScore(322:359, : );
mHB2 = mScore(360:376, : );

%calculate mean and sd on first 2 PC's
mWRB2SD_1 = std(mWRB1(:,1:2), 'omitnan')*2;
mWRBmean1 = mean(mWRB1(:,1:2), 'omitnan');

mWRB2SD_2 = std(mWRB2(:,1:2), 'omitnan')*2;
mWRBmean2 = mean(mWRB2(:,1:2), 'omitnan');

mWRB2SD_3 = std(mWRB3(:,1:2), 'omitnan')*2;
mWRBmean3 = mean(mWRB3(:,1:2), 'omitnan');

mWRB2SD_4 = std(mWRB4(:,1:2), 'omitnan')*2;
mWRBmean4 = mean(mWRB4(:,1:2), 'omitnan');

mWRB2SD_5 = std(mWRB5(:,1:2), 'omitnan')*2;
mWRBmean5 = mean(mWRB5(:,1:2), 'omitnan');

mWRB2SD_6 = std(mWRB6(:,1:2), 'omitnan')*2;
mWRBmean6 = mean(mWRB6(:,1:2), 'omitnan');

mWRB2SD_7 = std(mWRB7(:,1:2), 'omitnan')*2;
mWRBmean7 = mean(mWRB7(:,1:2), 'omitnan');

mHB2SD_1 = std(mHB1(:,1:2), 'omitnan')*2;
mHBmean1 = mean(mHB1(:,1:2), 'omitnan');

mHB2SD_2 = std(mHB2(:,1:2), 'omitnan')*2;
mHBmean2 = mean(mHB2(:,1:2), 'omitnan');


%2D plot of PC2 vs PC1 distiguishing catagories 
figure('Color', 'white');
plot(mWRB1(:,1), mWRB1(:,2), 'ro', ...
    mWRB2(:,1), mWRB2(:,2), 'go', ...
    mWRB3(:, 1), mWRB3(:, 2), 'bo', ...
    mWRB4(:, 1), mWRB4(:,2), 'yo', ...
    mWRB5(:, 1), mWRB5(:, 2), 'mo', ...
    mWRB6(:, 1), mWRB6(:,2), 'co', ...
    mWRB7(:, 1), mWRB7(:,2), 'ko', ...
    mHB1(:, 1), mHB1(:,2), 'g+', ...
    mHB2(:, 1), mHB2(:,2), 'r+');
    hold on
    xlabel('Principal Component 1')
    ylabel('Principal component 2')
    title('2 Main Principal Components')
    %legend2D = legend('Midden', 'Beach at CC', 'Beach at CNG',...
     %   'Dune at CC', 'Dune at CNG');
    %set(legend2D,...
    %'Position',[0.148214285714286 0.707936507936508 0.230357142857143 0.196825396825397]);
    
    % this section plots elipses of 2 SD
    h = plotEllipses(mWRBmean1, mWRB2SD_1);
    h.FaceColor = [1 0 0 .05]; %4th value is undocumented: transparency
    h.EdgeColor = 'r'; 
    h.LineWidth = 0.5; 
    textscatter(mWRBmean1, cAreaNames{1});

    h = plotEllipses(mWRBmean2, mWRB2SD_2);
    h.FaceColor = [0 1 0 .05]; %4th value is undocumented: transparency
    h.EdgeColor = 'g'; 
    h.LineWidth = 0.5;
    textscatter(mWRBmean2, cAreaNames{2}); %adds name to area

    h = plotEllipses(mWRBmean3, mWRB2SD_3);
    h.FaceColor = [0 0 1 .05]; %4th value is undocumented: transparency
    h.EdgeColor = 'b'; 
    h.LineWidth = 0.5;
    textscatter(mWRBmean3, cAreaNames{3}); %names area

    h = plotEllipses(mWRBmean4, mWRB2SD_4);
    h.FaceColor = [1 1 0 .05]; %4th value is undocumented: transparency
    h.EdgeColor = 'y'; 
    h.LineWidth = 0.5;
    textscatter(mWRBmean4, cAreaNames{4}); %adds name to area

    h = plotEllipses(mWRBmean5, mWRB2SD_5);
    h.FaceColor = [1 0 1 .05]; %4th value is undocumented: transparency
    h.EdgeColor = 'm'; 
    h.LineWidth = 0.5;
    textscatter(mWRBmean5, cAreaNames{5}); %adds name to area

    h = plotEllipses(mWRBmean6, mWRB2SD_6);
    h.FaceColor = [0 1 1 .05]; %4th value is undocumented: transparency
    h.EdgeColor = 'c'; 
    h.LineWidth = 0.5;
    textscatter(mWRBmean6, cAreaNames{6}); %adds name to area

    h = plotEllipses(mWRBmean7, mWRB2SD_7);
    h.FaceColor = [0 0 0 .05]; %4th value is undocumented: transparency
    h.EdgeColor = 'k'; 
    h.LineWidth = 0.5;
    textscatter(mWRBmean7, cAreaNames{7}); %adds name to area

    h = plotEllipses(mHBmean1, mHB2SD_1);
    h.FaceColor = [0 1 0 .05]; %4th value is undocumented: transparency
    h.EdgeColor = 'g'; 
    h.LineWidth = 0.5;
    textscatter(mHBmean1, cAreaNames{8}); %adds name to area

    h = plotEllipses(mHBmean2, mHB2SD_2);
    h.FaceColor = [1 0 0 .05]; %4th value is undocumented: transparency
    h.EdgeColor = 'r'; 
    h.LineWidth = 0.5;
    textscatter(mHBmean2, cAreaNames{9}); %adds name to area
hold off

%plot 3d graph of the PC's (first 3)
%3D plot of 
figure('Color', 'white');
plot3(mWRB1(:,1), mWRB1(:,2), mWRB1(:,3), 'ro', ...
    mWRB2(:,1), mWRB2(:,2), mWRB2(:,3), 'go', ...
    mWRB3(:, 1), mWRB3(:, 2), mWRB3(:, 3),'bo', ...
    mWRB4(:, 1), mWRB4(:,2), mWRB4(:,3), 'yo', ...
    mWRB5(:, 1), mWRB5(:, 2), mWRB5(:, 3), 'mo', ...
    mWRB6(:, 1), mWRB6(:,2), mWRB6(:,3), 'co', ...
    mWRB7(:, 1), mWRB7(:,2), mWRB7(:,3), 'ko', ...
    mHB1(:, 1), mHB1(:,2), mHB1(:,3), 'g+', ...
    mHB2(:, 1), mHB2(:,2), mHB2(:,3), 'r+');
    hold on
    xlabel('Principal Component 1')
    ylabel('Principal component 2')
    zlabel('Principal Component 3')
    title('2 Main Principal Components')
    hold off