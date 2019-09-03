require(xgboost)
require(methods)
library(caret)
library(lattice)
library(ggplot2)
library(readxl)
library(HDCI)
setwd("F:/secondpaper")
M317label1 <- read_xlsx("M317labels.xlsx",col_names = FALSE)
LB<-as.matrix(M317label1[,2]-1)
M317bipssmbuguiyi <-read_xlsx("317bipssmbuguiyi.xlsx",col_names = FALSE)
M317pseaac<-read_xlsx("125M317data.xlsx",col_names = FALSE)
#data=cbind(M317bipssmbuguiyi,M317pseaac)
M317phychen<-read_xlsx("5_317phychen.xlsx",col_names = FALSE)
M317n_gapdc<-read_xlsx("4_317g_gapdc.xlsx",col_names = FALSE)
data=cbind(M317bipssmbuguiyi,M317pseaac,M317phychen,M317n_gapdc)#ºáÏòºÏ²¢
data<-data.frame(LB,data)

#folds <- createFolds(data$X__2,k=n)
folds <- createFolds(newData$X__2,k=n)
lop <- str(folds)
i <- 1
repeat
{if(i>n) break
  else
  {fold_test <- newData[folds[[i]],]     
  fold_train <- newData[-folds[[i]],]
  # selection of xgboost parameters
  parameters <- list(eta = 1, maxDepth = 25, lambda = 1, gamma = 0)
  # fit xgboost
  bst <- xgboost(data = data.matrix(fold_train[,-1]),label = fold_train[,1],booster = "gbtree",params = parameters,nrounds=2,eval_metric = "merror",nthread = 8,objective = "multi:softmax",num_class = 164)
  pred <- predict(bst, data.matrix(fold_test[,-1]))
  duibi<-data.frame(prob=pred,obs=fold_test[,1])
  duibi$prob<-factor(duibi$prob)
  duibi$obs<-factor(duibi$obs)
  jieguo<-confusionMatrix(duibi$prob,duibi$obs, positive = "1")
  print(jieguo)
  agreement <- pred==fold_test[,1]
  f1 <- table(agreement)
  ave <- length(which(agreement==TRUE))/length(agreement)
  i <- i+1;}}
mean(ave)

