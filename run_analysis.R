##Assuming data has been unzipped to home directory drive, retrieve data labels
features <- read.table("./UCI HAR Dataset/features.txt",header=FALSE,sep="")
activities <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE,sep="",col.names=c("activitycode","activity"))

##Import test data
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE,sep="",col.names=c("subject"))
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE,sep="",col.names=features[,2]) ##Appropriately labels the data set with descriptive variable names.
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE,sep="",col.names=c("activitycode"))
y_test <- activities[y_test[,1],] ##Uses descriptive activity names to name the activities in the data set

##Import training data
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE,sep="",col.names=c("subject"))
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE,sep="",col.names=features[,2]) ##Appropriately labels the data set with descriptive variable names.
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE,sep="",col.names=c("activitycode"))
y_train <- activities[y_train[,1],] ##Uses descriptive activity names to name the activities in the data set

##remove unnecessary variables from X_ data - (Extracts only the measurements on the mean and standard deviation for each measurement.)
X_test <- X_test[,grep("\\.mean\\.|\\.std\\.", names(X_test))] 
X_train <- X_train[,grep("\\.mean\\.|\\.std\\.", names(X_train))]

##Merge the training and the test sets to create one data set.
test_data <- cbind(subject_test,y_test,X_test)
train_data <- cbind(subject_train,y_train,X_train)
all_data <- rbind(test_data,train_data)

##remove previous dataframes to conserve memory
rm(features, activities, subject_test, X_test, y_test, subject_train, X_train, y_train, test_data, train_data)

##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
require("dplyr")
library(dplyr)
summary_data <- all_data %>%
  select(-activitycode) %>%
  group_by(activity, subject) %>%
  summarise_all(mean)
