####Description:
According to "Getting and Cleaning Data" course project requirements, this function consumes several text files within a zip compressed file that represents data collected from the accelerometers from the Samsung Galaxy S smartphone and creates a text file containing a tidy data set, calculating average of std and mean measures grouped by activity and subject.
You'll be able to find below a more detailed explanation about [Input](https://github.com/ltubia/run_analysis/blob/master/CODEBOOK.md#input-data) and [Output](https://github.com/ltubia/run_analysis/blob/master/CODEBOOK.md#output-data) data respectively.

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

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Field names    | Description |   Source  | Applied Transformation
---------------|-------------|-----------|-----------------------
tBodyAcc-XYZ | Body acceleration signals | tAcc-XYZ | Filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
tGravityAcc-XYZ | Gravity acceleration signals | tAcc-XYZ |Filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
tBodyAccJerk-XYZ | Body linear acceleration Jerk signals | tBodyAcc-XYZ | Body linear acceleration
tBodyGyro-XYZ |  Gyroscope 3-axial raw signals | tGyro-XYZ |  Filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
tBodyGyroJerk-XYZ | Jerk signals for angular velocity |tBodyGyro-XYZ |
tBodyAccMag | Body acceleration in Euclidean magnitudes | tBodyAcc-XYZ | Euclidian Norm 
tGravityAccMag | Gravity in Euclidian magnitudes | tGravityAcc-XYZ | Euclidian Norm
tBodyAccJerkMag | Body linear acceleration Jerk signals in Euclidian magnitudes | tBodyAccJerk-XYZ | Euclidian Norm 
tBodyGyroMag | Gyroscope 3-axial raw signals in Euclidian magnitudes | tBodyGyro-XYZ | Euclidian Norm 
tBodyGyroJerkMag | Jerk signals for angular velocity in Euclidian magnitudes | tBodyGyroJerk-XYZ | Euclidian Norm 
fBodyAcc-XYZ | Body acceleration signals in Fourier frequency | tBodyAcc-XYZ | Fast Fourier Transform (FFT)
fBodyAccJerk-XYZ |Body linear acceleration Jerk signals in Fourier frequency | tBodyAccJerk-XYZ | Fast Fourier Transform (FFT)
fBodyGyro-XYZ | Gyroscope 3-axial raw signals with Fourier frequency applied | tBodyGyro-XYZ | Fast Fourier Transform (FFT)
fBodyAccMag | Euclidean magnitudes body acceleration with Fourier frequency applied | tBodyAccMag | Fast Fourier Transform (FFT)
fBodyAccJerkMag | Euclidian magnitudes body linear acceleration Jerk signals with Fourier frequency applied | tBodyAccJerkMag | Fast Fourier Transform (FFT)
fBodyGyroMag | Euclidian magnitude gyroscope 3-axial raw signals with Fourier frequency applied | tBodyGyroMag | Fast Fourier Transform (FFT)
fBodyGyroJerkMag | Euclidian magnitude Jerk signals for angular velocity with Fourier frequency applied | tBodyGyroJerkMag | Fast Fourier Transform (FFT)

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

The set of variables that were estimated from these signals are: 

Variable | Description
---------|------------
mean()| Mean value
std()| Standard deviation
mad()| Median absolute deviation 
max()| Largest value in array
min()| Smallest value in array
sma()| Signal magnitude area
energy()| Energy measure. Sum of the squares divided by the number of values. 
iqr()| Interquartile range 
entropy()| Signal entropy
arCoeff()| Autorregresion coefficients with Burg order equal to 4
correlation()| correlation coefficient between two signals
maxInds()| index of the frequency component with largest magnitude
meanFreq()| Weighted average of the frequency components to obtain a mean frequency
skewness()| skewness of the frequency domain signal 
kurtosis()| kurtosis of the frequency domain signal 
bandsEnergy()| Energy of a frequency interval within the 64 bins of the FFT of each window.
angle()| Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

####Output data:
Output text file contains a tidy data set, calculating average of std and mean measures grouped by activity and subject. It complies with the following requirements:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

It contains the following data:

######Grouping criteria: 
The fields average is calculated and grouped by:
- activity_desc
- subject_id

######Measures: 
Mean() and std() measures type average:
- tBodyAcc_mean_X
- tBodyAcc_mean_Y
- tBodyAcc_mean_Z
- tBodyAcc_std_X
- tBodyAcc_std_Y
- tBodyAcc_std_Z
- tGravityAcc_mean_X
- tGravityAcc_mean_Y
- tGravityAcc_mean_Z
- tGravityAcc_std_X
- tGravityAcc_std_Y
- tGravityAcc_std_Z
- tBodyAccJerk_mean_X
- tBodyAccJerk_mean_Y
- tBodyAccJerk_mean_Z
- tBodyAccJerk_std_X
- tBodyAccJerk_std_Y
- tBodyAccJerk_std_Z
- tBodyGyro_mean_X
- tBodyGyro_mean_Y
- tBodyGyro_mean_Z
- tBodyGyro_std_X
- tBodyGyro_std_Y
- tBodyGyro_std_Z
- tBodyGyroJerk_mean_X
- tBodyGyroJerk_mean_Y
- tBodyGyroJerk_mean_Z
- tBodyGyroJerk_std_X
- tBodyGyroJerk_std_Y
- tBodyGyroJerk_std_Z
- tBodyAccMag_mean
- tBodyAccMag_std
- tGravityAccMag_mean
- tGravityAccMag_std
- tBodyAccJerkMag_mean
- tBodyAccJerkMag_std
- tBodyGyroMag_mean
- tBodyGyroMag_std
- tBodyGyroJerkMag_mean
- tBodyGyroJerkMag_std
- fBodyAcc_mean_X
- fBodyAcc_mean_Y
- fBodyAcc_mean_Z
- fBodyAcc_std_X
- fBodyAcc_std_Y
- fBodyAcc_std_Z
- fBodyAccJerk_mean_X
- fBodyAccJerk_mean_Y
- fBodyAccJerk_mean_Z
- fBodyAccJerk_std_X
- fBodyAccJerk_std_Y
- fBodyAccJerk_std_Z
- fBodyGyro_mean_X
- fBodyGyro_mean_Y
- fBodyGyro_mean_Z
- fBodyGyro_std_X
- fBodyGyro_std_Y
- fBodyGyro_std_Z
- fBodyAccMag_mean
- fBodyAccMag_std
- fBodyBodyAccJerkMag_mean
- fBodyBodyAccJerkMag_std
- fBodyBodyGyroMag_mean
- fBodyBodyGyroMag_std
- fBodyBodyGyroJerkMag_mean
- fBodyBodyGyroJerkMag_std

######File format:
It's a space delimited text type format, with headers, and with double quotes as text qualifiers.

if the file is opened in text editor (notepad, etc.) columns will not viewed aligned because of text wrapping. To see it in an ordered way, open it with Excel indicating it's a space delimited file, and with double quotes as text identifier.
Alternatively, it can be opened from R with the following command:

d<-read.table("<textfilenameHere>.txt", header = TRUE)




