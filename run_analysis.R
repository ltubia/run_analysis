## run_analysys.R
## ==============
##      Description:    runs steps neccesary for "Getting and cleaning Data" course project 
##                      It generates a text file averiging all measures by each activity and subjects
##                      Text file is generated at local path by default
##

# Steps for testing it:
# ---------------------
#       source("<YourPathHere>run_analysis.R")                  # load code
#       run_analysis("<textfilenameHere>")                      # creates and writes the average dataset. Caution!!!: "txt" extension is added automatically
#       getpwd()                                                # check for assignment3.txt file
#       d<-read.table("<textfilenameHere>.txt", header = TRUE)  # read generated file
#       d[1:7,1:7]                                              # check for first 7th rows and first 7th columns of in memory dataset 
#       dim(d)                                                  # check dataset dimensions

# run_analysis:
# -------------
#       Description:    function that generates a text file averaging all measures by each activity and subject 
#
#       Parameters: a plain file name, desirable without extension.
# 
#       Logic:          
#                       It executes the course project requirements, not necesarily in the same order (explained in more detail in Note 2 below)
#
#                               Req 1. Merges the training and the test sets to create one data set.
#                               Req 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#                               Req 3. Uses descriptive activity names to name the activities in the data set
#                               Req 4. Appropriately labels the data set with descriptive variable names. 
#                               Req 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#
#                       Note 1: It is not needed to download zip file as this function does it by itself and store it in a temp file
#
#                       Note 2: for the sake of simplicity and optimization, not all steps are executed in the above order. They are 
#                               executed in the following one:
#
#                               1. Download file
#                               2. load common files for both train and test data: features and activiy labels
#                               3. Load all test related files: x_test, y_test, subject_test
#                               4. Merge them all in a unique test data table and assign labels and descriptive names to columns (Req 4 and Req 3)
#                               5. Load all train related files: x_train, y_train, subject_train
#                               6. Merge them all in a unique train data table and assign labels and descriptive names to columns (Req 4 and Req 3)
#                               7. Merge train and test data (Req 1)
#                               8. Extract mean and std measures (Req 2)
#                               9. Calculate average of each variable for each activity and each subject and save it to disk (Req 5)
#
#

run_analysis<-function(filename="") {

# Check parameter
if (filename=="") 
        {
        message("Error: A non empty file name without extension parameter must be indicated")
        return()
        }
else
        filename<-paste0(filename, ".txt")
                
#Load libraries
        library(plyr)
        library(dplyr)

## 1. Download file to temp file at local path
        fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        temp<-tempfile()
        download.file(fileurl,temp, method="wget")

##
## 2. Load Common files
## ====================
##
        # READ activities label
                activity_labels <- read.table(unz(temp, "UCI HAR Dataset/activity_labels.txt"))
        # changes columns for descriptive ones
                names(activity_labels)[   names(activity_labels)=="V1" 
                                        | names(activity_labels)=="V2"] <- c("activity_id","activity_desc")
        # READ features file
                features <- read.table(unz(temp, "UCI HAR Dataset/features.txt"))

##      
##  3. Load test files  
##  ==================
##      

        ## READ Test files - activity_id
                y_test <- read.table(unz(temp, "UCI HAR Dataset/test/y_test.txt"))
        ## READ Test files - data
                x_test <- read.table(unz(temp, "UCI HAR Dataset/test/X_test.txt"))
        ## READ Subject file
                subject_test <- read.table(unz(temp, "UCI HAR Dataset/test/subject_test.txt"))
##      
##  4. Merge test data sets, assign labels and apply activity descriptions
##  ======================================================================
## 

        ## Assign features labels to x_test
                names(x_test) =features$V2
        ## add activiy ID
                x_test<-cbind(y_test, x_test)
        ## rename column V1 to activiy_id
                names(x_test)[names(x_test)=="V1"] <- "activity_id"
        ## add subject test column
                x_test<-cbind(subject_test, x_test)
        ## rename column v1 to subject_id
                names(x_test)[names(x_test)=="V1"] <- "subject_id"
        ## Join with activity labels set so as to get activity descriptions
                x_test<-merge(activity_labels, x_test, by="activity_id",all=TRUE )
        ## normalize header names, replacing ()- symbols
                names(x_test)<-gsub("-", "_", sub("\\(\\)","", names(x_test),),)


##      
##  5. Load train files    
##  ===================
##      

        ## READ Train files - activity_id
                y_train <- read.table(unz(temp, "UCI HAR Dataset/train/y_train.txt"))
        ## READ Train files - data
                x_train <- read.table(unz(temp, "UCI HAR Dataset/train/X_train.txt"))
        ## READ Subject file
                subject_train <- read.table(unz(temp, "UCI HAR Dataset/train/subject_train.txt"))

##      
##  6. Merge train data sets, assign labels and apply activity descriptions
##  ======================================================================
## 

        ## Assign features labels to x_train
                names(x_train) =features$V2
        ## add activiy ID
                x_train<-cbind(y_train, x_train)
        ## rename column
                names(x_train)[names(x_train)=="V1"] <- "activity_id"
        ## add subjects to train set
                x_train<-cbind(subject_train, x_train)
        ## rename column subject_train
                names(x_train)[names(x_train)=="V1"] <- "subject_id"
        ## Join with activity labels so as to get activity factors
                x_train<-merge(activity_labels, x_train, by="activity_id",all=TRUE )
        ## normalize header names, replacing ()- symbols
                names(x_train)<-gsub("-", "_", sub("\\(\\)","", names(x_train),),)

##
## 7. Union x_train & x_test in a unique dataset
##
        all_data<-rbind(x_train, x_test)

##
## 8. Extract activity and subject related columns and only "mean" and "std" dev measurements
##
        meanstd<-all_data[,(names(all_data) %in% c("activity_id", "activity_desc", "subject_id") 
                          | names(all_data) %in% names(all_data)[grep("\\_mean",names(all_data))] 
                          | names(all_data) %in% names(all_data)[grep("\\_std",names(all_data))] 
                           ) &
                           !(names(all_data) %in% names(all_data)[grep("meanFreq",names(all_data))])
                         ]

##
## 9. Calculate average of each variable for each activity and each subject and save it to disk
##

        grp<-group_by(meanstd, activity_id, activity_desc, subject_id) # Set calculation Group
        average<-grp %>% summarise_each(funs(mean))  # Use summarise_each to calculate all measures

        ## Write to disk
        write.table(average, file = filename, row.name=FALSE)

message(paste0("the ",getwd(),"/", filename, " was file generated"))
}

