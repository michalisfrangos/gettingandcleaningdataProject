# gettingandcleaningdataProject
Project for the course Getting and Cleaning data by John Hopkins on Coursera

## Description of files

- 'CodeBook.md' : includes the code book that describes the variables, the data, and any transformations or work that was performed to clean up the data. Information of original data and were to downlod them from is also in the code book.

- 'run_analysis.R': this is the R script to clean the dataset from the accelerometers of the Samsung Galaxy S smartphone. Details on original data are described in the codebook. 

## Instructions to run the script
- Download data from Original data from  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
- Unzip files manually in a folder named 'UCI HAR DAtaset' in  the same locations as the script file
- Set working directory to the location of the script 'run_analysis.R'
- Source the script in the prompt as>  source("run_analysis.R") 
- Cleaned data are saved as an output in 'data_cleaned.csv' ans a 'data_cleaned.txt'


## Transformations from original data
- Merged the training and the test sets to create one data set.
- Extracted only the measurements on the mean and standard deviation for each measurement.
- Simplfied activity names to name the activities in the data set descriptively.
- Appropriately labeled the data set with descriptive variable names.
- From the data set in step 4, a second dataset was created, with the average of each variable for each activity and each subject.

