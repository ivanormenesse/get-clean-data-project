get-clean-data-project
======================

Course Project for Getting and Cleaning Data (007)

#Project Specifications and applied script

**Below are the scripts applied to each step of the course project, for the reproducible script please see run_analysis.R (which has explanations and descritions) since I've changed the order of the steps during the script**

1.Merges the training and the test sets to create one data set.  
```{r}

activity_labels<-read.table(".\\dataset\\UCI HAR Dataset\\activity_labels.txt")
names(activity_labels)<-c("activity","activity_labels")


xtest<-read.table(".\\dataset\\UCI HAR Dataset\\test\\X_test.txt")
names(xtest)<-feature_names


xtest<-xtest[features_keep]


names(xtest)<-features_renames


ytest<-read.table(".\\dataset\\UCI HAR Dataset\\test\\y_test.txt")
names(ytest)<-"activity"


subjecttest<-read.table(".\\dataset\\UCI HAR Dataset\\test\\subject_test.txt")
names(subjecttest)<-"subject"

merge1test<-(cbind(subjecttest, ytest))


merge2test<-merge(merge1test,activity_labels,by.x="activity",by.y="activity",all=TRUE)


test<-cbind(merge2test,xtest)
rm(features,merge1test,merge2test,subjecttest,xtest,ytest)




xtrain<-read.table(".\\dataset\\UCI HAR Dataset\\train\\X_train.txt")
names(xtrain)<-feature_names


xtrain<-xtrain[features_keep]


names(xtrain)<-features_renames


ytrain<-read.table(".\\dataset\\UCI HAR Dataset\\train\\y_train.txt")
names(ytrain)<-"activity"

 
subjecttrain<-read.table(".\\dataset\\UCI HAR Dataset\\train\\subject_train.txt")
names(subjecttrain)<-"subject"


merge1train<-(cbind(subjecttrain, ytrain))


merge2train<-merge(merge1train,activity_labels,by.x="activity",by.y="activity",all=TRUE)


train<-cbind(merge2train,xtrain)
rm(merge1train,merge2train,subjecttrain,xtrain,ytrain)



hacdata<-rbind(test,train)

```

2.Extracts only the measurements on the mean and standard deviation for each measurement.
  
```{r}
features<-read.table(".\\dataset\\UCI HAR Dataset\\features.txt")
feature_names <- as.character(features[,2])
features_keep <- feature_names[grepl("mean[(][)]|std[(][)]", feature_names)]

```

3.Uses descriptive activity names to name the activities in the data set

```{r}
activity_labels<-read.table(".\\dataset\\UCI HAR Dataset\\activity_labels.txt")
names(activity_labels)<-c("activity","activity_labels")

```

4.Appropriately labels the data set with descriptive variable names.

```{r}
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


#Renaming xtest accordingly to features rename
names(xtest)<-features_renames

#Renaming xtrain accordingly to features rename
names(xtrain)<-features_renames

```

5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

```{r}

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


```


##Credits
I would like to give the appopriate credits to MickyDowns and scottschreckengaus, former class studentsfor their contributions to my script.
