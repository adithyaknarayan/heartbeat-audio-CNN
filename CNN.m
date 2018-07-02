layers = [
    imageInputLayer([513 3099 1])  
    convolution2dLayer(3,16,'Padding',1)
    batchNormalizationLayer
    reluLayer    
    maxPooling2dLayer(2,'Stride',2) 
    convolution2dLayer(3,32,'Padding',1)
   batchNormalizationLayer
    reluLayer 
    fullyConnectedLayer(4)
    softmaxLayer
    classificationLayer];
%opts = trainingOptions('sgdm');
opts = trainingOptions('sgdm',...
       'InitialLearnRate',0.001,...
       'LearnRateSchedule', 'piecewise',...
       'LearnRateDropFactor',0.1,...
       'LearnRateDropPeriod',8,...
       'L2Regularization',0.004,...
       'MaxEpochs',10,...
       'MiniBatchSize',10,...
       'Verbose',true);

[trainedNet,traininfo]= trainNetwork(trainData,layers,opts);
