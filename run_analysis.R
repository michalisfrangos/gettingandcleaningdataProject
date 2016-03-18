# Project Week 4

# Set working directory
 workDir = "D:/FRANGOS_FOLDER/CoursesCertificates/Coursera_Spec_DataAnalysis_2016/GettingAndCleaningData/project"
 setwd(workDir)

# clear workspace
rm(list = ls()) 

library(httr)
library(plyr)
library(dplyr)


if (!file.exists("downloads")) {
        dir.create("downloads")
}

# download zip file; this is executed only if download_flag = TRUE to save time
# note: you need to unzip  manually 
download_flag <- !TRUE
if (download_flag){
        
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl,destfile = "./downloads/project_data.zip",method = "auto") 
        
        dateDownloaded <- date()
}


#  read all data; this is executed only if read_flag = TRUE to save time
read_flag <- TRUE
if (read_flag){
        # common
        activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
        features <- read.table("UCI HAR Dataset/features.txt")
        
        # test
        subject_test <- read.table("UCI HAR DAtaset/test/subject_test.txt")
        x_test  <- read.table("UCI HAR DAtaset/test/X_test.txt")
        y_test  <- read.table("UCI HAR DAtaset/test/y_test.txt")
        
        #body_acc_x_test  <- read.table("UCI HAR DAtaset/test/Inertial Signals/body_acc_x_test.txt")
        #body_acc_y_test  <- read.table("UCI HAR DAtaset/test/Inertial Signals/body_acc_y_test.txt")
        #body_acc_z_test  <- read.table("UCI HAR DAtaset/test/Inertial Signals/body_acc_z_test.txt")
        
        #body_gyro_x_test  <- read.table("UCI HAR DAtaset/test/Inertial Signals/body_gyro_x_test.txt")
        #body_gyro_y_test  <- read.table("UCI HAR DAtaset/test/Inertial Signals/body_gyro_y_test.txt")
        #body_gyro_z_test  <- read.table("UCI HAR DAtaset/test/Inertial Signals/body_gyro_z_test.txt")
        
        #total_acc_x_test  <- read.table("UCI HAR DAtaset/test/Inertial Signals/total_acc_x_test.txt")
        #total_acc_y_test  <- read.table("UCI HAR DAtaset/test/Inertial Signals/total_acc_y_test.txt")
        #total_acc_z_test  <- read.table("UCI HAR DAtaset/test/Inertial Signals/total_acc_z_test.txt")
        
        # train
        subject_train <- read.table("UCI HAR DAtaset/train/subject_train.txt")
        x_train <- read.table("UCI HAR DAtaset/train/X_train.txt")
        y_train <- read.table("UCI HAR DAtaset/train/y_train.txt")
        
        #body_acc_x_train  <- read.table("UCI HAR DAtaset/train/Inertial Signals/body_acc_x_train.txt")
        #body_acc_y_train  <- read.table("UCI HAR DAtaset/train/Inertial Signals/body_acc_y_train.txt")
        #body_acc_z_train  <- read.table("UCI HAR DAtaset/train/Inertial Signals/body_acc_z_train.txt")
        
        #body_gyro_x_train  <- read.table("UCI HAR DAtaset/train/Inertial Signals/body_gyro_x_train.txt")
        #body_gyro_y_train  <- read.table("UCI HAR DAtaset/train/Inertial Signals/body_gyro_y_train.txt")
        #body_gyro_z_train  <- read.table("UCI HAR DAtaset/train/Inertial Signals/body_gyro_z_train.txt")
        
        #total_acc_x_train  <- read.table("UCI HAR DAtaset/train/Inertial Signals/total_acc_x_train.txt")
        #total_acc_y_train  <- read.table("UCI HAR DAtaset/train/Inertial Signals/total_acc_y_train.txt")
        #total_acc_z_train  <- read.table("UCI HAR DAtaset/train/Inertial Signals/total_acc_z_train.txt")
        
        # save at workspace
        # save.image(file="workspace_project.RData")
} else {
        load(file="workspace_project.RData")
}


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
#df_mean<-summarise_each(df,funs(mean))

df_group <- group_by(df,activity,subject)
df_mean <- as.data.frame(summarise_each(df_group,funs(mean)))

# replace activity with descriptive names
activity.indx   <- as.integer(activity_labels$V1)
activity.labels <- as.character(activity_labels$V2)

df_mean$activity <- mapvalues(df_mean$activity, from = activity.indx , to = activity.labels )

#df_mean <- df_mean[1:5,1:6]
#write.table(df_mean, "./data_cleaned", sep="\t") 
write.csv(df_mean, 'data_cleaned.csv')
write.table(df_mean, 'data_cleaned.txt', row.name=FALSE) 
