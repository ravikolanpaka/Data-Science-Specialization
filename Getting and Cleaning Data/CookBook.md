Course Project Code Book
========================

Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The attached R script (run_analysis.R) performs the following to clean up the data:

* Merge the training and test sets to create one data set (10299x561 data frame)
* Merge the traininsg and test sets for subject data (10299x1 data frame)
* Merge the activity training and test sets (10299x1 data frame)
* Read features.txt and extract measurements on the mean and standard deviation for each measurement ( features ending with mean() or std()). The result is 18 features of 561 observations. All measurements appear to be floating point numbers in the range (-1, 1).
* Read activity_labels.txt and apply descriptive activity names:
        walking
        walkingupstairs
        walkingdownstairs
        sitting
        standing
        laying
* Appropriately label the features with more descriptive names:
  t -> time
  f -> frequency
  Acc -> Accelerometer
  Gyro -> Gyroscopic
  Mag -> Magnitude
  BodyBody -> Body
* Create a 2nd, independent tidy data set with the average of each measurement for each activity and each subject. 
* The result is saved as tidy.txt, a 180x20 data frame.