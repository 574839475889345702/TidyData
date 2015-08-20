aggregateActivityData <- function(path = "UCI HAR Dataset")
{
  ## get activity types, automatically converted to factors
  ActivityType <- read.table(paste(path,"activity_labels.txt",sep='/'))$V2
  
  ## get list of data observations types
  features <- read.table(paste(path,"features.txt",sep='/'))$V2
  
  ## find the features corresponding to mean and standard deviation
  index <- sort( c( grep("mean()", features, value = FALSE,fixed = TRUE),
                    grep("std()" , features, value = FALSE,fixed = TRUE) ) )
  
  ## load test data
  df.test  <<- cbind( read.table(paste(path,"test/subject_test.txt",sep='/'))$V1,
                      factor(read.table(paste(path,"test/Y_test.txt",sep='/'))$V1,labels=ActivityType),
                      read.table(paste(path,"test/X_test.txt",sep='/'))[index]
                    )
  names(df.test) <- c("subjectID", "activity", as.character( features[index]) )
  
  ## load training data
  df.train <<- cbind( read.table(paste(path,"train/subject_train.txt",sep='/'))$V1,
                      factor(read.table(paste(path,"train/Y_train.txt",sep='/'))$V1,labels=ActivityType),
                      read.table(paste(path,"train/X_train.txt",sep='/'))[index]
                    )
  names(df.train) <- c("subjectID", "activity", as.character( features[index]) )
  
  ## combine data sets
  data <- rbind(df.test,df.train)
  
  ## find mean for each subject and activity
  tinydata <- aggregate(x=rawdata[,3:68], by=list(subjectID = rawdata$subjectID,
                                                  activity  = rawdata$activity), FUN="mean")
  tinydata <- tinydata[ order(tinydata[,1],tinydata[,2]) , ]
  row.names(tinydata) <- NULL
  
  ## output to file
  write.table(tinydata, file = "TinyTidyData.txt", row.name=FALSE)
  
  ## return data.frame
  return(tinydata)
  
}