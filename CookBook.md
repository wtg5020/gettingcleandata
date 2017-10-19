##Cook Book Getting and Cleaning Data Course Project
William Griffith

##Background
The dataset for this course was collected from a study leveraging the accelerometers from the Samsung Galaxy S smartphone, this was documented for each user who did 5 different actions listed below
Actions:
Walking
Walking Upstairs
Walking Downstairs
Sitting
Standing
Laying

The tidy dataset shows the means and standard deviations for the features that were studied, those features are listed below
Please note that all the XYZ are broken into individual features for each direction
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

##Data

The background of this study and a data export can be found at the below url:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Transformations

The transformations on the data were to eliminate any unnecessary data points (energy, entropy, etc) and to merge the data files into once concise dataset. Also transformations were done to tidy up the naming conventions for the columns
