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
    'YDisplayLabels', cLabels);
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
mWRB1 = mScore(vLocations==1, : );
mWRB2 = mScore(vLocations==2, : );
mWRB3 = mScore(vLocations==3, : );
mWRB4 = mScore(vLocations==4, : );
mWRB5 = mScore(vLocations==5, : );
mWRB6 = mScore(vLocations==6, : );
mWRB7 = mScore(vLocations==7, : );
mHB1 = mScore(vLocations==8, : );
mHB2 = mScore(vLocations==9, : );
% Create datafor for KS test. this is so it can go through the loop easily.
cSampLocPCA = cell(9:1);
cSampLocPCA{1} = mWRB1;
cSampLocPCA{2} = mWRB2;
cSampLocPCA{3} = mWRB3;
cSampLocPCA{4} = mWRB4;
cSampLocPCA{5} = mWRB5;
cSampLocPCA{6} = mWRB6;
cSampLocPCA{7} = mWRB7;
cSampLocPCA{8} = mHB1;
cSampLocPCA{9} = mHB2;

%calculate mean and sd on first 2 PC's
mWRB2SD_1 = std(mWRB1(:,1:3), 'omitnan')*2;
mWRBmean1 = mean(mWRB1(:,1:3), 'omitnan');

mWRB2SD_2 = std(mWRB2(:,1:3), 'omitnan')*2;
mWRBmean2 = mean(mWRB2(:,1:3), 'omitnan');

mWRB2SD_3 = std(mWRB3(:,1:3), 'omitnan')*2;
mWRBmean3 = mean(mWRB3(:,1:3), 'omitnan');

mWRB2SD_4 = std(mWRB4(:,1:3), 'omitnan')*2;
mWRBmean4 = mean(mWRB4(:,1:3), 'omitnan');

mWRB2SD_5 = std(mWRB5(:,1:3), 'omitnan')*2;
mWRBmean5 = mean(mWRB5(:,1:3), 'omitnan');

mWRB2SD_6 = std(mWRB6(:,1:3), 'omitnan')*2;
mWRBmean6 = mean(mWRB6(:,1:3), 'omitnan');

mWRB2SD_7 = std(mWRB7(:,1:3), 'omitnan')*2;
mWRBmean7 = mean(mWRB7(:,1:3), 'omitnan');

mHB2SD_1 = std(mHB1(:,1:3), 'omitnan')*2;
mHBmean1 = mean(mHB1(:,1:3), 'omitnan');

mHB2SD_2 = std(mHB2(:,1:3), 'omitnan')*2;
mHBmean2 = mean(mHB2(:,1:3), 'omitnan');


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
    h = plotEllipses(mWRBmean1(:,1:2), mWRB2SD_1(:,1:2));
    h.FaceColor = [1 0 0 .05]; %4th value is undocumented: transparency
    h.EdgeColor = 'r'; 
    h.LineWidth = 0.5; 
    textscatter(mWRBmean1(:,1:2), cAreaNames{1});

    h = plotEllipses(mWRBmean2(:,1:2), mWRB2SD_2(:,1:2));
    h.FaceColor = [0 1 0 .05]; %4th value is undocumented: transparency
    h.EdgeColor = 'g'; 
    h.LineWidth = 0.5;
    textscatter(mWRBmean2(:,1:2), cAreaNames{2}); %adds name to area

    h = plotEllipses(mWRBmean3(:,1:2), mWRB2SD_3(:,1:2));
    h.FaceColor = [0 0 1 .05]; %4th value is undocumented: transparency
    h.EdgeColor = 'b'; 
    h.LineWidth = 0.5;
    textscatter(mWRBmean3(:,1:2), cAreaNames{3}); %names area

    h = plotEllipses(mWRBmean4(:,1:2), mWRB2SD_4(:,1:2));
    h.FaceColor = [1 1 0 .05]; %4th value is undocumented: transparency
    h.EdgeColor = 'y'; 
    h.LineWidth = 0.5;
    textscatter(mWRBmean4(:,1:2), cAreaNames{4}); %adds name to area

    h = plotEllipses(mWRBmean5(:,1:2), mWRB2SD_5(:,1:2));
    h.FaceColor = [1 0 1 .05]; %4th value is undocumented: transparency
    h.EdgeColor = 'm'; 
    h.LineWidth = 0.5;
    textscatter(mWRBmean5(:,1:2), cAreaNames{5}); %adds name to area

    h = plotEllipses(mWRBmean6(:,1:2), mWRB2SD_6(:,1:2));
    h.FaceColor = [0 1 1 .05]; %4th value is undocumented: transparency
    h.EdgeColor = 'c'; 
    h.LineWidth = 0.5;
    textscatter(mWRBmean6(:,1:2), cAreaNames{6}); %adds name to area

    h = plotEllipses(mWRBmean7(:,1:2), mWRB2SD_7(:,1:2));
    h.FaceColor = [0 0 0 .05]; %4th value is undocumented: transparency
    h.EdgeColor = 'k'; 
    h.LineWidth = 0.5;
    textscatter(mWRBmean7(:,1:2), cAreaNames{7}); %adds name to area

    h = plotEllipses(mHBmean1(:,1:2), mHB2SD_1(:,1:2));
    h.FaceColor = [0 1 0 .05]; %4th value is undocumented: transparency
    h.EdgeColor = 'g'; 
    h.LineWidth = 0.5;
    textscatter(mHBmean1(:,1:2), cAreaNames{8}); %adds name to area

    h = plotEllipses(mHBmean2(:,1:2), mHB2SD_2(:,1:2));
    h.FaceColor = [1 0 0 .05]; %4th value is undocumented: transparency
    h.EdgeColor = 'r'; 
    h.LineWidth = 0.5;
    textscatter(mHBmean2(:,1:2), cAreaNames{9}); %adds name to area
hold off

%prepare the elipsoids of the 2sd area for each location
[x1,y1,z1] = ellipsoid(mWRBmean1(:,1),mWRBmean1(:,2),mWRBmean1(:,3),...
    mWRB2SD_1(:,1),mWRB2SD_1(:,2),mWRB2SD_1(:,3));
[x2,y2,z2] = ellipsoid(mWRBmean2(:,2),mWRBmean2(:,2),mWRBmean2(:,3),...
    mWRB2SD_2(:,1),mWRB2SD_2(:,2),mWRB2SD_2(:,3));
[x3,y3,z3] = ellipsoid(mWRBmean3(:,1),mWRBmean3(:,2),mWRBmean3(:,3),...
    mWRB2SD_3(:,1),mWRB2SD_3(:,2),mWRB2SD_3(:,3));
[x4,y4,z4] = ellipsoid(mWRBmean4(:,1),mWRBmean4(:,2),mWRBmean4(:,3),...
    mWRB2SD_4(:,1),mWRB2SD_4(:,2),mWRB2SD_4(:,3));
[x5,y5,z5] = ellipsoid(mWRBmean5(:,1),mWRBmean5(:,2),mWRBmean5(:,3),...
    mWRB2SD_5(:,1),mWRB2SD_5(:,2),mWRB2SD_5(:,3));
[x6,y6,z6] = ellipsoid(mWRBmean6(:,1),mWRBmean6(:,2),mWRBmean6(:,3),...
    mWRB2SD_6(:,1),mWRB2SD_6(:,2),mWRB2SD_6(:,3));
[x7,y7,z7] = ellipsoid(mWRBmean7(:,1),mWRBmean7(:,2),mWRBmean7(:,3),...
    mWRB2SD_7(:,1),mWRB2SD_7(:,2),mWRB2SD_7(:,3));
[x8,y8,z8] = ellipsoid(mHBmean1(:,1),mHBmean1(:,2),mHBmean1(:,3),...
    mHB2SD_1(:,1),mHB2SD_1(:,2),mHB2SD_1(:,3));
[x9,y9,z9] = ellipsoid(mHBmean2(:,1),mHBmean2(:,2),mHBmean2(:,3),...
    mHB2SD_2(:,1),mHB2SD_2(:,2),mHB2SD_2(:,3));

%plot 3d graph of the PC's (first 3)
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
    title('3 Main Principal Components')
    %plot the elipsoids on the graph
        hs1 = surf(x1,y1,z1);
    hold on
    q1 = get(hs1);
    set(hs1, 'FaceColor', [1 0 0], ...
        'FaceAlpha',0.05,'FaceLighting','gouraud','EdgeColor','r', ...
        'EdgeAlpha', .1)
    axis equal

        hs2 = surf(x2,y2,z2);
    hold on
    q1 = get(hs2);
    set(hs2, 'FaceColor', 'g', ...
        'FaceAlpha',0.05,'FaceLighting','gouraud','EdgeColor','g', ...
        'EdgeAlpha', .1)
    axis equal

        hs3 = surf(x3,y3,z3);
    hold on
    q1 = get(hs3);
    set(hs3, 'FaceColor', 'b', ...
        'FaceAlpha',0.05,'FaceLighting','gouraud','EdgeColor','b', ...
        'EdgeAlpha', .1)
    axis equal

        hs4 = surf(x4,y4,z4);
    hold on
    q1 = get(hs4);
    set(hs4, 'FaceColor', 'y', ...
        'FaceAlpha',0.05,'FaceLighting','gouraud','EdgeColor','y', ...
        'EdgeAlpha', .1)
    axis equal

        hs5 = surf(x5,y5,z5);
    hold on
    q1 = get(hs5);
    set(hs5, 'FaceColor', 'm', ...
        'FaceAlpha',0.05,'FaceLighting','gouraud','EdgeColor','m', ...
        'EdgeAlpha', .1)
    axis equal

        hs6 = surf(x6,y6,z6);
    hold on
    q1 = get(hs6);
    set(hs6, 'FaceColor', 'c', ...
        'FaceAlpha',0.05,'FaceLighting','gouraud','EdgeColor','c', ...
        'EdgeAlpha', .1)
    axis equal

        hs7 = surf(x7,y7,z7);
    hold on
    q1 = get(hs7);
    set(hs7, 'FaceColor', 'k', ...
        'FaceAlpha',0.05,'FaceLighting','gouraud','EdgeColor','k', ...
        'EdgeAlpha', .1)
    axis equal

        hs8 = surf(x8,y8,z8);
    hold on
    q1 = get(hs8);
    set(hs8, 'FaceColor', 'g', ...
        'FaceAlpha',0.05,'FaceLighting','gouraud','EdgeColor','g', ...
        'EdgeAlpha', .1)
    axis equal

        hs9 = surf(x9,y9,z9);
    hold on
    q1 = get(hs9);
    set(hs9, 'FaceColor', 'r', ...
        'FaceAlpha',0.05,'FaceLighting','gouraud','EdgeColor','r', ...
        'EdgeAlpha', .1)
    axis equal

    hold off
