library(lattice)
library(Rcpp)
library(readxl)
library(dplyr)
data1<-read_xlsx("D:/respondpaper/10_983phychen.xlsx",col_names = T)
names1<-read.table('D:/diffzhiwu.csv',header=T,sep=",")
#different datasets
data2<-anti_join(data1,names1,by='names')
#write data
write.table(data2,"D:/difffeizhiwu.csv",sep=",",row.names=FALSE,col.names=FALSE)


####
library(lattice)
library(Rcpp)
library(readxl)
library(dplyr)
data1<-as.matrix(read_xlsx("D:/respondpaper/983.xlsx",col_names = F))
data2<-matrix(data = data1, nrow = 983, ncol = 2, byrow = T,dimnames = NULL)
write.table(data2,"D:/M983split.csv",sep=",",row.names=FALSE,col.names=FALSE)
