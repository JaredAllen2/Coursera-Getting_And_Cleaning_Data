# Coursera-Getting_And_Cleaning_Data
R Script run_analysis.R written to address the following Assignment

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.

Extracts only the measurements on the mean and standard deviation for each measurement.

Uses descriptive activity names to name the activities in the data set

Appropriately labels the data set with descriptive variable names.

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This script requires the user to have the unzipped folder "UCI HAR Dataset" in their working directory.

##Summary of script by lines:

4:6 - extract variable and activities labels from relevant files (features.txt & activity_labels.txt respectively)

9:11 - Import test data .txt files into working memory using variable names from features.txt

12 - Decode activity codes in y_test using labels extracted from activity_labels

15:17 - Import train data .txt files into working memory using variable names from features.txt

18 - Decode activity codes in y_train using labels extracted from activity_labels

21:22 - use grep function to extract only those variables with mean and std data in both X_test and X_train

25:27 - cbind to collate test_data and train_data from separate files, then rbind to join datasets

30 - clear previous dataframes from working memory

33:34 - ensure dplyr package is installed and libraries available

35:38 - use dplyr to create summary table with data averaged by activity and subject, with unnecessary 'activitycode' variable removed to qualify as tidy data.
