####Description:
According to "Getting and Cleaning Data" course project requirements, this function consumes several text files within a zip compressed file that represents data collected from the accelerometers from the Samsung Galaxy S smartphone and creates a text file containing a tidy data set, calculating average of std and mean measures grouped by activity and subject.
Below, You'll be able to find a more detailed explanation about input and output data respectively.

####Input data:
Input data represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Field names    | Description |   Source  | Applied Transformation
---------------|-------------|-----------|-----------------------
tBodyAcc-XYZ | Body acceleration signals | tAcc-XYZ | Filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
tGravityAcc-XYZ | Gravity acceleration signals | tAcc-XYZ |Filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
tBodyAccJerk-XYZ | Body linear acceleration Jerk signals | tBodyAcc-XYZ | Body linear acceleration
tBodyGyro-XYZ |  Gyroscope 3-axial raw signals | tGyro-XYZ |
tBodyGyroJerk-XYZ | Jerk signals for angular velocity |tBodyGyro-XYZ |
tBodyAccMag | Body acceleration in Euclidean magnitudes | tBodyAcc-XYZ | Euclidian Norm 
tGravityAccMag | Gravity in Euclidian magnitudes | tGravityAcc-XYZ | Euclidian Norm
tBodyAccJerkMag | Body linear acceleration Jerk signals in Euclidian magnitudes | tBodyAccJerk-XYZ
tBodyGyroMag | Gyroscope 3-axial raw signals in Euclidian magnitudes | tBodyGyro-XYZ
tBodyGyroJerkMag | Jerk signals for angular velocity in Euclidian magnitudes | tBodyGyroJerk-XYZ
fBodyAcc-XYZ | 
fBodyAccJerk-XYZ |
fBodyGyro-XYZ |
fBodyAccMag |
fBodyAccJerkMag |
fBodyGyroMag |
fBodyGyroJerkMag |

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

####Output data:


