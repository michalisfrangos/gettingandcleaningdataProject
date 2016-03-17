## Codebook for Getting and Cleaning Data
Topic: Project for cleaning and getting data by John Hopkins on Coursera

## Data summary:
The dataset has 180 observations (rows) and  68 variables (columns). Each row corresponds to the average of the data variables (described below) for each activity and each subject. There are 30 subjects and six activities. 

NOTE; information on original data are given below as notes in this codebook

## Transformations from original data
1 - Merged the training and the test sets to create one data set.
2 - Extracted only the measurements on the mean and standard deviation for each measurement.
3 - Simplfied activity names to name the activities in the data setdescriptively.
4 - Appropriately labeled the data set with descriptive variable names.
5 - From the data set in step 4, a second dataset was created, with the average of each variable for each activity and each subject.


## Data columns description:

-'activity': activity label (ranging from 1 to 6) and correspond to WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
-'subject' : an identifier of the subject who carried out the experiment (ranging from 1 to 30)
- All other columns are the computed averages for features for each subject and activity. The features are described below in detail: 

## Data variables for each subject and activity:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ

tGravityAcc-XYZ         # standard gravity units 'g'

tBodyAccJerk-XYZ        # standard gravity units 'g'

tBodyGyro-XYZ           # radians/second

tBodyGyroJerk-XYZ       # radians/second               

tBodyAccMag             # standard gravity units 'g'

tGravityAccMag          # standard gravity units 'g'

tBodyAccJerkMag         # standard gravity units 'g'

tBodyGyroMag            # radians/second

tBodyGyroJerkMag        # radians/second

fBodyAcc-XYZ            # standard gravity units 'g'

fBodyAccJerk-XYZ        # standard gravity units 'g'

fBodyGyro-XYZ           # radians/second 

fBodyAccMag             # standard gravity units 'g'

fBodyAccJerkMag         # standard gravity units 'g'

fBodyGyroMag            # radians/second

fBodyGyroJerkMag        # radians/second

The set of variables estimated from these signals and used for theproject are: 
mean(): Mean value
std(): Standard deviation

## Notes on Original data:

The features from original data were normalized and bounded within [-1,1]

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Original data were downloaded from: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

For more information about the original dataset contact: activityrecognition@smartlab.ws

## License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


