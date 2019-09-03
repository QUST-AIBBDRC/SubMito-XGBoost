require(methods)
require(xgboost)
library(lattice)
library(ggplot2)
library(caret)
setwd("D:/respondpaper")
b1<-read.table("4_495feizhiwug_gapdc.csv",header=F,sep=",")
b<-b1[,-1]
p1<-read.table("10_495feizhiwuphychen.csv",header=F,sep=",")
p<-p1[,-1]
m1<-read.table("feizhuwupseaac495.csv",header=F,sep=",")
m<-m1[,-1]
g1<-read.table("495feizhiwubipssm.csv",header=F,sep=",")
g<-g1[,-1]
data=cbind(b,m,p,g)#横向合并
LB=g1[,1]
data1<-data.frame(LB,data)
jwdata<-as.data.frame(data1[,-1])
LB <- as.matrix(data1[,1])
newdata<-data.frame(LB,jwdata)
newdata$LB<-as.factor(newdata$LB)
##标签+数据
n=nrow(newdata)
#LOOCV
#LOOCV
set.seed(666)
agreement=0
changdu=0 
folds <- createFolds(newdata$LB,k=n)
##折
lop <- str(folds)
i <- 1
repeat
{if(i>n) break
  else
  {fold_test<- newdata[folds[[i]],]     
  fold_train <-newdata[-folds[[i]],]
  # selection of xgboost parameters:alpha=1,min_child_weight=1,
  parameters <- list(maxDepth=6,gamma = 0.2,subsample=0.9)
  # fit xgboost##迭代nrounds=10,
  bst <- xgboost(data=data.matrix(fold_train[,-1]),label = fold_train[,1],booster = "gbtree",params = parameters,nrounds=20,verbose=0,eval_metric = "merror",objective = "multi:softmax",num_class =4)
  pred<-predict(bst,data.matrix(fold_test[,-1]))
  a=print(pred)
  #     ###性能
  #   #输出预测的标签
  write.table(a,"predfeizhiwu.csv",append=TRUE,quote = F,row.names=FALSE,col.names=FALSE)
  #   #输出测试的标签
  b=print(as.numeric(fold_test$LB))
  write.table(b,"testfeizhiwu.csv",append=TRUE,quote = F,row.names=FALSE,col.names=FALSE)
  agreement <-pred==fold_test[1,1]
  changdu=length(which(agreement==T))+changdu
  i <- i+1;}}
ave= changdu/n
ave


