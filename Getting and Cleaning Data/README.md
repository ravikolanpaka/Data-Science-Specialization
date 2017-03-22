## Getting and Cleaning Data Project

### OVerview

This project serves to demonstrate the collection and cleaning of a tidy data set that can be used for subsequent analysis.

Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


### Project Files

* CodeBook.md: describes the variables, the data, and any transformations or work that was performed to clean up the data
* run_analysis.R: contains all the code to perform the analyses
* tidy_data.txt: the tidy dataset

### Creating the tidy dataset
* Download the dataset and extract the files
* Move run_analysis.R to the extracted folder and set the working directory to this folder
* run "run_analysis.R

### Reading the data
* Use "data <- read.table("tidy.txt")" 