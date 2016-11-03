####################################

# Peer-graded Assignment: Getting and Cleaning Data Course Project by Zuraidah MSany (4 Nov 2016)
      # Using the UCI HAR Dataset (downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), this runAnalysis.R script will perform the following steps: 
      # 1. Merges the training and the test sets to create one data set.
      # 2. Extracts only the measurements on the mean and standard deviation for each measurement.
      # 3. Uses descriptive activity names to name the activities in the data set
      # 4. Appropriately labels the data set with descriptive variable names.
      # 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

####################################

#getting the data from the web

      # Clean up workspace
      rm(list=ls())

      # set working directory 
      setwd('C:/Users/User/Desktop/Coursera')
      
      # Download zip file to the working directory as wk4assignmentdata.zip. Then Unzip. 
      fileURL <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      download.file(fileURL, destfile="./wk4assignmentdata.zip")
      unzip(zipfile="./wk4assignmentdata.zip")

      # At this point, the unzip step will create a new folder called UCI HAR Dataset. 
      # Change the working directory to this new folder. To check, type getwd()
      setwd('C:/Users/User/Desktop/Coursera/UCI HAR Dataset')

###################################

# Part 1: Merges the training and the test sets to create one data set.

      # test data:
      XTest<- read.table("test/X_test.txt")
      YTest<- read.table("test/Y_test.txt")
      SubjectTest <-read.table("test/subject_test.txt")

      # train data:
      XTrain<- read.table("train/X_train.txt")
      YTrain<- read.table("train/Y_train.txt")
      SubjectTrain <-read.table("train/subject_train.txt")

      # merge the train and test data in one dataset
      X<-rbind(XTest, XTrain)
      Y<-rbind(YTest, YTrain)
      Subject<-rbind(SubjectTest, SubjectTrain)

###################################

# Part 2:Extracts only the measurements on the mean and standard deviation for each measurement.

      xDataSet_mean_std <- X[, grep("-(mean|std)\\(\\)", read.table("features.txt")[, 2])]
      names(xDataSet_mean_std) <- read.table("features.txt")[grep("-(mean|std)\\(\\)", read.table("features.txt")[, 2]), 2] 

###################################

# Part 3: Use descriptive activity names to name the activities in the data set

      activity<-read.table("activity_labels.txt")

      # update values with correct activity names
      Y[, 1] <- activity[Y[, 1], 2]
      
      # correct column name
      names(Y) <- "Activity"


###################################

# Part 4:Appropriately labels the data set with descriptive variable names.

      names(Subject)<-"SubjectID"


###################################

# Part 5:From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

      # Combine all data from Part 4.
      CleanedData<-cbind(Subject, Y, xDataSet_mean_std)

      # Average each variable for each activity and each subject
      AvgData<-aggregate(. ~SubjectID + Activity, CleanedData, mean)
      
      # Sort the data by SubjectID then Activity
      AvgDataSorted<-AvgData[order(AvgData$SubjectID,AvgData$Activity),]

      # Create a new table called TidyData. In normal cases, row.names = TRUE. But this exercise requires row.names = FALSE.
      write.table(AvgDataSorted, file = "TidyData.txt", row.names = FALSE) 
      TidyData<- read.table("TidyData.txt")

