## Getting the data

The data set to be used by this script can be found at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Extracting the data

Unzip the file into the same directory as 'run_analysis.R'. Its default name will be "UCI HAR Dataset" but can be changed.  The required files needed for execution are:

  activity_labels.txt  
  features.txt  
  |- test  
     |- subject_test.txt  
     |- X_test.txt  
     |- Y_test.txt  
  |- train  
     |- subject_train.txt  
     |- X_train.txt  
     |- Y_train.txt  

## Running the Script

`source("run_analysis.R")`  
`data.frame <- aggregateActivityData(path = "UCI HAR Dataset") #path can be change to where zip was extracted`

## What the Script Does

The aggregateActivityData() function will load the test and training datasets and combine them. It will then select the columns that calculate the mean and standard deviation of the measured features. Then the data will be further aggregated to find the mean of all features per subject per activity.