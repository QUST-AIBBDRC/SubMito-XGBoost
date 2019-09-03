#RF
library(randomForest)
#KNN
library(class)
#NB
library(e1071)
#DT
library(C50)
require(methods)
library(caret)
library(lattice)
library(ggplot2)
library(readxl)
library(lars)
require(xgboost)
require(methods)
setwd("F:/secondpaper")
newdata<-xlsread("ReliefF983350.xlsx",col_names = F)
#Loocv
set.seed(666)
agreement=0
changdu=0 
n=nrow(newdata)
newdata$V1<-factor(newdata$V1)
folds <- createFolds(newdata$V1,k=n)
lop <- str(folds)
i <- 1
repeat
{if(i>n) break
  else
  {fold_test<- newdata[folds[[i]],]     
  fold_train <- newdata[-folds[[i]],]
 ##RF
  # rf<-randomForest(X__2~.,data=fold_train,ntree=100,mtry=1,prob=TRUE)
  #pred <- predict(rf, data.matrix(fold_test[,-1]))
  ###KNN
  #pred <-knn(fold_train,fold_test,fold_train$V1,10)
  ###NB
  #nb_pred<-naiveBayes(fold_train,fold_train$X__2,laplace=0)
  #pred<-predict(nb_pred,fold_test,type="class")
  ###DT  
  #fold_train$X1<-factor(fold_train$X1)
  #m=C5.0(V1~.,fold_train)
  #pred=predict(m,fold_test)
  ###SVM
  #m<-svm(fold_train$X__2~., data = fold_train,            
  #             method = "C-classification", kernel = "radial",              
   #            cost = 1, gamma = 0.01)
  #pred=predict(m,fold_test,type='class') 
  ####Xgboost
  #parameters <- list(alpha=0,eta = 0.3,maxDepth=10,lambda = 1,gamma = 0.2,subsample=0.9)
  #  bst <- xgboost(data = data.matrix(fold_train[,-1]),label = fold_train[,1],booster = "gbtree",params = parameters,nrounds=20,eval_metric = "merror",objective = "multi:softmax",num_class = 4)
  #pred <- predict(bst, data.matrix(fold_test[,-1]))
  a=print(pred)
  write.table(a,"pred317C50111.csv",append=TRUE,quote = F,row.names=FALSE,col.names=FALSE)
  b=print(as.numeric(fold_test$V1))
  write.table(b,"test317C50111.csv",append=TRUE,quote = F,row.names=FALSE,col.names=FALSE)
  agreement <-pred==fold_test[1,1]
  changdu=length(which(agreement==T))+changdu
  i <- i+1;}}
ave= changdu/n
ave