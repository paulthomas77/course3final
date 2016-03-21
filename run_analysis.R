#Load Training data set
setwd("~/R CODE/Course 3/UCI HAR Dataset")
xtrain<-read.table("train/X_train.txt")
ytrain<-read.table("train/Y_train.txt")
subtrain<-read.table("train/subject_train.txt")
train<-cbind(subtrain,ytrain,xtrain)
#Load testing data set
xtest<-read.table("test/X_test.txt")
ytest<-read.table("test/Y_test.txt")
subtest<-read.table("test/subject_test.txt")
test<-cbind(subtest,ytest,xtest)

#combine train and test sets
combo<-rbind(train,test)

#find mean and std values
features<-read.table("features.txt")
features[,2]<-as.character(features[,2])
stdmeanlist<-c(grep("mean",features[,2]),grep("std",features[,2]))
stdmeanlist<-sort(stdmeanlist)
stdmeanlistnames<-features[,2][stdmeanlist]
stdmeanlistnames<-c("subject","activity",stdmeanlistnames)

#extract mean and std values
stdmeanlist<-stdmeanlist+2
mscombo<-combo[,c(1,2,stdmeanlist)]

#replace activity values with names 
mscombo[,2]<-gsub(1,"walking",mscombo[,2])
mscombo[,2]<-gsub(2,"walking_upstairs",mscombo[,2])
mscombo[,2]<-gsub(3,"walking_downstairs",mscombo[,2])
mscombo[,2]<-gsub(4,"sitting",mscombo[,2])
mscombo[,2]<-gsub(5,"standing",mscombo[,2])
mscombo[,2]<-gsub(6,"laying",mscombo[,2])

#assign the variable names
colnames(mscombo)<-stdmeanlistnames
write.csv(mscombo,"dataset1.csv")

#create new dataset with average of each variablefor each subject and each activity
library(dplyr)
groupedcombo<-group_by(mscombo,subject,activity)
groupsum<-summarize_each(groupedcombo,funs(mean))

write.csv(groupsum, "dataset2.csv")
