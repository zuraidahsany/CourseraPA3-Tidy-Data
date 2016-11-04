---
title: "CodeBook"
author: "Zuraidah M Sany"
date: "4 November 2016"
output: html_document
---

**Code Book Description**

This code book provides information to indicate all the variables and summaries calculated, along with units, and any other relevant information.

**Source Data**

The data used in this project was collected from the accelerometers from the Samsung Galaxy S smartphone. A full description of the data can be found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The raw data is obtainable at
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


**Objective**

The purpose of this script is to collect, work with, and clean the given data set. The goal is to prepare tidy data that can be used for later analysis. This can be achieved by executing 5 parts of the script:
      * Part 1: Merges the training and the test sets to create one data set.
      * Part 2: Extracts only the measurements on the mean and standard deviation for each measurement.
      * Part 3: Uses descriptive activity names to name the activities in the data set
      * Part 4: Appropriately labels the data set with descriptive variable names.
      * Part 5: Using the data part 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

**Script Flow**

_Part 0:_ 
      1. Download the raw data and setting the source directory for the files
      
_part 1:_ 
      1. Read into tables the data located in
            * X_test.txt
            * Y_test.txt
            * subject_test.txt
            * X_train.txt
            * Y_train.txt
            * subject_train.txt
      
      2. Merge the tables
            * X_test table with X-train table into X
            * Y_test table with Y-train table into Y
            * subject_test table with subject-train table into Subject

_part 2:_
      1. Extract only the measurements on the mean and standard deviation for each measurement.
      2. Each columns are then labelled according to the variables names as per the features.txt file.

_part 3:_
      1. Rename the column in Y appropriately to "Activity"
      
_part 4:_
      1. Rename the column in Subject to "SubjectID"


_part 5:_
      1. Combine data from Subject, Y, and xDataSet_mean_std to CleanedData
      2. Average each variable for each activity and each subject in CleanedData and assigned to AvgData
      3. Sort the data in AvgData by SubjectID then Activity abd assigned to AvgDataSorted
      4. Create a new table called TidyData. In normal cases, row.names = TRUE. But this exercise requires row.names = FALSE.
      

**Identifiers**

SubjectID - The ID of the test subject
Activity - The type of activity performed when the corresponding measurements were taken

**Measurements label** _(Mean and standard deviation of X)_
      * tBodyAcc-mean()-X
      * tBodyAcc-mean()-Y
      * tBodyAcc-mean()-Z
      * tBodyAcc-std()-X           
      * tBodyAcc-std()-Y
      * tBodyAcc-std()-Z           
      * tGravityAcc-mean()-X
      * tGravityAcc-mean()-Y       
      * tGravityAcc-mean()-Z
      * tGravityAcc-std()-X
      * tGravityAcc-std()-Y
      * tGravityAcc-std()-Z       
      * tBodyAccJerk-mean()-X
      * tBodyAccJerk-mean()-Y      
      * tBodyAccJerk-mean()-Z
      * tBodyAccJerk-std()-X       
      * tBodyAccJerk-std()-Y
      * tBodyAccJerk-std()-Z       
      * tBodyGyro-mean()-X
      * tBodyGyro-mean()-Y         
      * tBodyGyro-mean()-Z
      * tBodyGyro-std()-X          
      * tBodyGyro-std()-Y
      * tBodyGyro-std()-Z        
      * tBodyGyroJerk-mean()-X
      * tBodyGyroJerk-mean()-Y     
      * tBodyGyroJerk-mean()-Z
      * tBodyGyroJerk-std()-X      
      * tBodyGyroJerk-std()-Y
      * tBodyGyroJerk-std()-Z      
      * tBodyAccMag-mean()
      * tBodyAccMag-std()        
      * tGravityAccMag-mean()       
      * tGravityAccMag-std()       
      * tBodyAccJerkMag-mean()      
      * tBodyAccJerkMag-std()      
      * tBodyGyroMag-mean()         
      * tBodyGyroMag-std()         
      * tBodyGyroJerkMag-mean()     
      * tBodyGyroJerkMag-std()     
      * fBodyAcc-mean()-X     
      * fBodyAcc-mean()-Y          
      * fBodyAcc-mean()-Z           
      * fBodyAcc-std()-X           
      * fBodyAcc-std()-Y            
      * fBodyAcc-std()-Z           
      * fBodyAccJerk-mean()-X       
      * fBodyAccJerk-mean()-Y      
      * fBodyAccJerk-mean()-Z       
      * fBodyAccJerk-std()-X       
      * fBodyAccJerk-std()-Y
      * fBodyAccJerk-std()-Z       
      * fBodyGyro-mean()-X
      * fBodyGyro-mean()-Y
      * fBodyGyro-mean()-Z
      * fBodyGyro-std()-X  
      * fBodyGyro-std()-Y
      * fBodyGyro-std()-Z          
      * fBodyAccMag-mean()
      * fBodyAccMag-std()         
      * fBodyBodyAccJerkMag-mean()
      * fBodyBodyAccJerkMag-std() 
      * fBodyBodyGyroMag-mean()
      * fBodyBodyGyroMag-std()  
      * fBodyBodyGyroJerkMag-mean()
      * fBodyBodyGyroJerkMag-std()

**Activity labels**
      * WALKING
      * WALKING_UPSTAIRS
      * WALKING_DOWNSTAIRS
      * SITTING
      * STANDING
      * LAYING