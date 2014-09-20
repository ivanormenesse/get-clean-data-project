## File download and unziping 
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "

##Only download.file line if zip file isn't on your workin directory!!!
download.file(fileurl,destfile= ".\\UCi HAR Dataset.zip")

dir.create(".\\dataset")
unzip(".\\UCi HAR Dataset.zip", exdir=".\\dataset")
unlink(fileurl)
rm(fileurl)

## Creating test and Trainign Datasets

#Getting variable names and variables to be kept
features<-read.table(".\\dataset\\UCI HAR Dataset\\features.txt")
feature_names <- as.character(features[,2])
features_keep <- feature_names[grepl("mean[(][)]|std[(][)]", feature_names)]

##Features renames are done through gsub, this function looks for a pattern (first argument) and
##if the pattern is TRUE replaces it with a replacement (second argument), we do this repeatedly 
##to rename the variable names we want to Keep.
features_renames <- gsub("()", "", 
                         gsub("Freq", "Frequency", 
                              gsub("-X", "XAxis",
                                   gsub("-Y", "YAxis",
                                        gsub("-Z", "ZAxis",
                                             gsub("-std()", "StandardDeviation",
                                                  gsub("-mean()", "Mean",
                                                       gsub("Jerk", "JerkSignal",
                                                            gsub("Gyro", "Gyroscope",
                                                                 gsub("Mag", "Magnitude",
                                                                      gsub("Acc", "Acceleration",
                                                                           gsub("^f", "FourierTransform",
                                                                                gsub("^t","TimeDomain", features_keep)))))))))))), fixed=TRUE)

#Setting the activity label
activity_labels<-read.table(".\\dataset\\UCI HAR Dataset\\activity_labels.txt")
names(activity_labels)<-c("activity","activity_labels")

#### Reading the test set

#Read the test set
xtest<-read.table(".\\dataset\\UCI HAR Dataset\\test\\X_test.txt")
names(xtest)<-feature_names

#Subsettng only variables with means and std
xtest<-xtest[features_keep]

#Renaming xtest accordingly to features rename
names(xtest)<-features_renames

#Read the trainning labels for the test set
ytest<-read.table(".\\dataset\\UCI HAR Dataset\\test\\y_test.txt")
names(ytest)<-"activity"

#Reading subjects 
subjecttest<-read.table(".\\dataset\\UCI HAR Dataset\\test\\subject_test.txt")
names(subjecttest)<-"subject"

#Merging trainning labels and subjects
merge1test<-(cbind(subjecttest, ytest))

#Getting activity labels
merge2test<-merge(merge1test,activity_labels,by.x="activity",by.y="activity",all=TRUE)

#Adding actual data
test<-cbind(merge2test,xtest)
rm(features,merge1test,merge2test,subjecttest,xtest,ytest)

### Reading the trainning set

#Read the train set
xtrain<-read.table(".\\dataset\\UCI HAR Dataset\\train\\X_train.txt")
names(xtrain)<-feature_names

#Subsettng only variables with means and std
xtrain<-xtrain[features_keep]

#Renaming xtrain accordingly to features rename
names(xtrain)<-features_renames

#Read the trainning labels for the train set
ytrain<-read.table(".\\dataset\\UCI HAR Dataset\\train\\y_train.txt")
names(ytrain)<-"activity"

#Reading subjects 
subjecttrain<-read.table(".\\dataset\\UCI HAR Dataset\\train\\subject_train.txt")
names(subjecttrain)<-"subject"

#Merging trainning labels and subjects
merge1train<-(cbind(subjecttrain, ytrain))

#Getting activity labels
merge2train<-merge(merge1train,activity_labels,by.x="activity",by.y="activity",all=TRUE)

#Adding actual data
train<-cbind(merge2train,xtrain)
rm(merge1train,merge2train,subjecttrain,xtrain,ytrain)

##Merging Trainning and Testing Data

hacdata<-rbind(test,train)

##Calculating mean of each variable per subject per activity
library(plyr)
##Creating counts on activities and subjects id's to use on the for loops
tmpact<-count(unique(hacdata$activity))
activity_count<-sum(tmpact$freq)
tmpsbj<-count(unique(hacdata$subject))
subject_count<-sum(tmpsbj$freq)

#Creating an empty matrix to receive the for loops outputs
data<-matrix(NA,activity_count*subject_count,length(hacdata))
data<-as.data.frame(data)
colnames(data)<-names(hacdata)
#This index is used to assure the loops are 'writing' the row information line after line
index<-1

##Here the requested dataset is created. First we subset the Train + Test full data set, then subset per subject
# and latter on calculate the average for each variable

for (i in 1:activity_count){
        subsetact<-hacdata[hacdata$activity==i,] ##subsets per activity
        for (j in 1:subject_count){
           subsetactsubj<- subsetact[subsetact$subject==j,] ##subsets per subject
           data[index,1]<-i
           data[index,2]<-j
           data[index,3]<-as.character(subsetact[i,3])
           for (k in 1:(length(hacdata)-3)){
                   data[index,k+3]<-mean(subsetactsubj[,k+3]) ##Calculates the mean for each variable
                }
                index<-index+1                  ##this commands assures we're skiping to the next line of the dataset
        }
}

#Creating tidy data to coursera upload
write.table(data,file=".\\data.txt", row.names=FALSE)

##Cleanning Environment
rm(activity_count, activity_labels, feature_names, features_keep, features_renames,
   i,index, j,k,subject_count, subsetact, subsetactsubj,test, impact,tmpact,  tmpsbj,train)





