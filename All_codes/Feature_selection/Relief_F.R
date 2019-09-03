
###############################################################
#############ReliefF method##############
#################################################################
setwd("D:/Asecondpaper")
require(xgboost)
require(methods)
library(lattice)
library(ggplot2)
library(readxl)
####ReliefF install.packages("CORElearn")
library(CORElearn)
data1<-read.csv("SMOTE317300280.csv",header=FALSE)
data<-as.data.frame(data1[,-1])
LB <- as.matrix(data1[,1])
data2<-data.frame(LB,data)
data2$LB<-as.factor(data2$LB)
R <- attrEval(LB~.,data2,estimator="ReliefFexpRank",ReliefIterations = 100);
R1 <- sort(-R);NR <- names(R1[1:375])


