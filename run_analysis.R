# Project Week 4
# Michalis Frangos
# frangos@frangos.eu

# Set working directory
workDir = "D:/FRANGOS_FOLDER/CoursesCertificates/Coursera_Spec_DataAnalysis_2016/GettingAndCleaningData/project"
setwd(workDir)

# clear workspace
rm(list = ls()) 

library(httr)
library(plyr)
library(dplyr)

## DOWNLOADING and UNZIPING DATA
if (!file.exists("downloads") & !file.exists("UCI HAR Dataset")) {
        message("- downloading data")
        dir.create("downloads")
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl,destfile = "./downloads/project_data.zip",method = "auto") 
        dateDownloaded <- date()
        message("- data downloaded")
        #file.remove("./data.zip")
} else {
        message("- data already downloaded")  
}

if  (!file.exists("UCI HAR Dataset")){
        message("- unzipping data")
        unzip("./downloads/project_data.zip")
        message("- data unzipped")
} else {
        message("- data folder exists")      
}

##  READING DATA IN WORKSPACE
message("- reading data in workspace")

# common
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

# test
subject_test <- read.table("UCI HAR DAtaset/test/subject_test.txt")
x_test  <- read.table("UCI HAR DAtaset/test/X_test.txt")
y_test  <- read.table("UCI HAR DAtaset/test/y_test.txt")

# train
subject_train <- read.table("UCI HAR DAtaset/train/subject_train.txt")
x_train <- read.table("UCI HAR DAtaset/train/X_train.txt")
y_train <- read.table("UCI HAR DAtaset/train/y_train.txt")
message("- data read")

## CLEANING DATA
message("- cleaning data")

# find names of features to keep
featuresNames   <- sapply( features$V2,as.character)    # factor to list of chars
varsIndexToKeep <- grep("-[Mm]ean[^F]|-[Ss]td[^F]",featuresNames,value=FALSE)
varsNamesToKeep <- featuresNames[varsIndexToKeep]

# combine train and test in X, extract mean and std , and rename
X <- rbind(x_train,x_test)                              # combine rows of X
X <-X[,varsIndexToKeep]
colnames(X)<-varsNamesToKeep
colnames(X) <- tolower(gsub("\\(\\)", "", names(X)))    # simpify X names

# combine rows of Y data, and rename
Y <- rbind(y_train,y_test) 
colnames(Y) <- c("activity")

# combine rows of subject data and rename
subject  <-  rbind(subject_train,subject_test); # combine rows 0f subject
colnames(subject) <- c("subject")               # rename

# Merges all in  one data set.
df <- cbind(X,Y) %>%cbind(subject)

# Create a table with mean values of each column for each activity and subject
df_group <- group_by(df,activity,subject)
df_mean <- as.data.frame(summarise_each(df_group,funs(mean)))

# replace activity with descriptive names
activity.indx   <- as.integer(activity_labels$V1)
activity.labels <- as.character(activity_labels$V2)
df_mean$activity <- mapvalues(df_mean$activity, from = activity.indx , to = activity.labels )

# writing output files
write.csv(df_mean, 'data_cleaned.csv')
write.table(df_mean, 'data_cleaned.txt', row.name=FALSE) 

message("- data cleaned and saved in data_cleaned.txt and  data_cleaned.csv")

# save.image(file="workspace_project.RData")
# load(file="workspace_project.RData")

