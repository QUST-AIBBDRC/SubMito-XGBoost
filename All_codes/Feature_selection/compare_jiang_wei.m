clear all
clc
% %%data and code 
label=xlsread('M317labels');
bipssm=xlsread('317bipssm');
 pseaac=xlsread('145M317data');
 gapdc=xlsread('4_317g_gapdc');
 phychen=xlsread('10_317phychen');
% %% fused bppg
 data=[gapdc,bipssmbuguiyi,phychen,pseaac];
 %% Feature selection methods
 %KPCA
 [yuanshu, mapping] = kernel_pca(X,375)
 %xlswrite('KPCA983_375.xlsx',yuanshu,'Sheet1','A1');
%% MDS
[yuanshu, mapping] = compute_mapping(X,'MDS',375);
% xlswrite('MDS983_375.xlsx',yuanshu,'Sheet1','A1');