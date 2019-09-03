library(randomForest)
#KNN
library(class)
#NB
library(e1071)
#C5.0
library(C50)
require(methods)
library(caret)
library(lattice)
library(ggplot2)
library(readxl)
library(lars)
library(HDCI)
#SMOTE包
library(DMwR)
library(grid)
library(glmnet)
library(Matrix)
library(foreach)
setwd("D:/Asecondpaper")
#M495label <- read_xlsx("ReliefF983350.xlsx",col_names = F)
#M317label <- read_xlsx("M317labels.xlsx",col_names = FALSE)
label <- read_xlsx("M317labels.xlsx",col_names = F)
LB <- as.matrix(label[,2])
b <-read_xlsx("317bipssmbuguiyi.xlsx",col_names = FALSE)
p<-read_xlsx("145M317data.xlsx",col_names = FALSE)
a<-read_xlsx("10_317phychen.xlsx",col_names = FALSE)
g<-read_xlsx("0_317g_gapdc.xlsx",col_names = FALSE)
data=cbind(b,a,p,g)#横向合并
mydata<-data.frame(LB,data)
##lasso降维
set.seed(666)
LB<-as.matrix(LB)
data1<-as.matrix(data)
##lasso调参
##选参数lamdba0.02196125
#modellasso=cv.glmnet(data1,LB,family = "multinomial",type.measure = "deviance",nfolds = 10)
Lasso<-Lasso(data1,LB,lambda=0.0005,fix.lambda=TRUE,cv.OLS=FALSE)#lambda可修改
c<-colnames(data1[,which(Lasso$beta!=0)])
#xx_lasso is a matrix of feature selection
datalasso<-data1[,which(Lasso$beta!=0)]
weishu=ncol(datalasso)
##标签+数据
lassodata <- data.frame(LB,datalasso)
lassodata$X__2 <- as.factor(lassodata$X__2)
write.table(lassodata,"M317lasso00005.csv",append=TRUE,quote = F,row.names=FALSE,col.names=FALSE)

##smote处理样本不平衡perc.over指定从少数样本中采样的比例perc.under对多数样本下采样，有多少比例的样本被选入新的数据集中 
##300+280;400+350
#newdata <- SMOTE(X__2~., lassodata, perc.over =300,perc.under=280)
#write.table(newdata,"M317diff1.csv",append=TRUE,quote = F,row.names=FALSE,col.names=FALSE)

####
require(xgboost)
require(methods)
#AdaBoost
library(adabag)
library(ipred)
library(randomForest)
#KNN
library(class)
#NB
library(e1071)
#C5.0
library(C50)
library(caret)
library(lattice)
library(ggplot2)
library(readxl)
library(lars)
library(HDCI)
#SMOTE包
library(DMwR)
library(grid)
library(glmnet)
library(Matrix)
library(foreach)
setwd("F:/secondpaper")
newdata<-xlsread("ReliefF983350.xlsx",col_names = F)
#留一
set.seed(666)
agreement=0
changdu=0 
n=nrow(newdata)
##标准化折
newdata$V1<-factor(newdata$V1)
folds <- createFolds(newdata$V1,k=n)
lop <- str(folds)
i <- 1
repeat
{if(i>n) break
  else
  {fold_test<- newdata[folds[[i]],]     
  fold_train <- newdata[-folds[[i]],]
  ####boosting
 #强调boosting要求标签因子型
 # m <- boosting(V1~.,data=fold_train,boos = TRUE,mfinal = 4)
  #pred=predict(m,fold_test[,-1])
  #a=print(pred$class)
 ##随机森林
  # rf<-randomForest(X__2~.,data=fold_train,ntree=100,mtry=1,prob=TRUE)
  #pred <- predict(rf, data.matrix(fold_test[,-1]))
  ###KNN
  #pred <-knn(fold_train,fold_test,fold_train$V1,10)
  ###NB
  #nb_pred<-naiveBayes(fold_train,fold_train$X__2,laplace=0)
  #pred<-predict(nb_pred,fold_test,type="class")
  ###C50  
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
  ###性能
  #输出预测的标签
  write.table(a,"pred317C50111.csv",append=TRUE,quote = F,row.names=FALSE,col.names=FALSE)
  #输出测试的标签
  b=print(as.numeric(fold_test$V1))
  write.table(b,"test317C50111.csv",append=TRUE,quote = F,row.names=FALSE,col.names=FALSE)
  agreement <-pred==fold_test[1,1]
  changdu=length(which(agreement==T))+changdu
  i <- i+1;}}
ave= changdu/n
ave