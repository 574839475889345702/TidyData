cleanActivityData <- function()
{
 
  ActivityType <- read.table("UCI HAR Dataset/activity_labels.txt")
  ActivityType <- ActivityType$V2
  
  features <- read.table("UCI HAR Dataset/features.txt")
  
  index <- sort( c( grep("mean()", features$V2, value = FALSE,fixed = TRUE),
                    grep("std()" , features$V2, value = FALSE,fixed = TRUE) ) )
   
  Subject  <- read.table("UCI HAR Dataset/test/subject_test.txt")
  Activity <- read.table("UCI HAR Dataset/test/Y_test.txt")
  Data     <- read.table("UCI HAR Dataset/test/X_test.txt")
  
  Subject  <- Subject$V1
  Activity <- Activity$V1
  Activity <- factor(Activity,labels=as.character(ActivityType) )
  Data <- Data[index]
  
  df.test <- cbind(Subject,Activity,Data) 
    
  Subject  <- read.table("UCI HAR Dataset/train/subject_train.txt")
  Activity <- read.table("UCI HAR Dataset/train/Y_train.txt")
  Data     <- read.table("UCI HAR Dataset/train/X_train.txt")
  
  Subject  <- Subject$V1
  Activity <- Activity$V1
  Activity <- factor(Activity,labels=ActivityType )
  Data <- Data[index]
  
  df.train <- cbind(Subject,Activity,Data)  
  
  data <- rbind(df.test,df.train)
  data <- data[ order(data[,1],data[,2]) , ]
  names(data) <- c("subjectID", "activity", as.character( features$V2[index]))
  row.names(data) <- NULL
  
  #return(data)
  
  tinydata <- read.table(text = "", col.names=names(data)) # create empty data.frame
  
  for(i in unique(data$subjectID))
  {
    subdata <- data[with(data,subjectID==i),]
    
    for(j in as.integer(unique(subdata$activity)))
    {
      subsubdata <- subdata[with(subdata,activity==ActivityType[j]),]
      subsubdata[1,3:68] <- colMeans(subsubdata[,3:68])
      
      tinydata <- rbind(tinydata,subsubdata[1,])
      
    }
  }
  
  row.names(tinydata) <- NULL
  write.table(tinydata, file = "TinyTidyData.txt", row.name=FALSE)
  return(tinydata)
  
}