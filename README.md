## Getting the data

The data set to be used by this script can be found at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Extracting the data

Unzip the file into the same directory as 'run_analysis.R'. Its default name will be "UCI HAR Dataset" but can be changed.  The required files needed for execution are:

&nbsp;&nbsp;activity_labels.txt  
&nbsp;&nbsp;features.txt  
&nbsp;&nbsp;|- test  
&nbsp;&nbsp;&nbsp;&nbsp;|- subject_test.txt  
&nbsp;&nbsp;&nbsp;&nbsp;|- X_test.txt  
&nbsp;&nbsp;&nbsp;&nbsp;|- Y_test.txt  
&nbsp;&nbsp;|- train  
&nbsp;&nbsp;&nbsp;&nbsp;|- subject_train.txt  
&nbsp;&nbsp;&nbsp;&nbsp;|- X_train.txt  
&nbsp;&nbsp;&nbsp;&nbsp;|- Y_train.txt  

## Running the Script

`source("run_analysis.R")`  
`data.frame <- aggregateActivityData(path = "UCI HAR Dataset") #path can be change to where zip was extracted`

## What the Script Does

The aggregateActivityData() function will load the test and training datasets and combine them. It will then select the columns that calculate the mean and standard deviation of the measured features. Then the data will be further aggregated to find the mean of all features per subject per activity.