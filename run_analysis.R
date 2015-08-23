# You should create one R script called run_analysis.R that does the following.
#- Merges the training and the test sets to create one data set.
#- Extracts only the measurements on the mean and standard deviation for each measurement.
#- Uses descriptive activity names to name the activities in the data set
#- Appropriately labels the data set with descriptive variable names.
#- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#
#
# Loading the required library
library ("dplyr")
#
# Cleaning up the workspace and setting the working directory to the appropriate location (where the dataset are
# located)
rm(list=ls())
setwd("./upload/data/UCI HAR Dataset")

# LOADING FILES
# Read the All test related  Files
TestActivityData <- read.table('./test/y_test.txt',header=FALSE)
TestSubjectData <- read.table('./test/subject_test.txt',header=FALSE)
TestFeatureData <- read.table('./test/x_test.txt',header=FALSE)

# Read the all train related Subject Files
TrainActivityData <- read.table('./train/y_train.txt',header=FALSE)
TrainSubjectData <- read.table('./train/subject_train.txt',header=FALSE)
TrainFeatureData <- read.table('./train/x_train.txt',header=FALSE)

# Loading the Feature label/variable
FeatureName <- read.table('./features.txt',header=FALSE)
# Loading the activity label
ActivityLabel <- read.table('./activity_labels.txt',header = FALSE)

# MERGING Training and Test Data set
SubjectData <- rbind(TrainSubjectData, TestSubjectData) 
ActivityData <- rbind(TrainActivityData, TestActivityData)
FeatureData <- rbind(TrainFeatureData, TestFeatureData)

# Renaming the variables
names(SubjectData) <- c("SubjectId")
names(ActivityData) <- c("ActivityType")
colnames(FeatureData) <- FeatureName$V2

# Combining column of all set to render a complete set
MasterData <- cbind(FeatureData, SubjectData, ActivityData)

# Clean the DataSet of duplicate column name for better support of the dplyr library
# since the data set contains duplicate column
MasterData_clean <- MasterData[ , !duplicated(colnames(MasterData))]

# Extracting only the measurement of mean() and std() for "each" measurement
DataAnalysis <- select(MasterData_clean, contains("mean"), contains("std"), SubjectId, ActivityType, -contains("angle"), -contains("meanFreq"))

# Providing descriptive  activity name to the activityType
DataAnalysis$ActivityType <- as.character(ActivityLabel[DataAnalysis$ActivityType, 2])

# Labeling the data set with descriptive names
names(DataAnalysis)<-gsub("^t", "time", names(DataAnalysis))
names(DataAnalysis)<-gsub("^f", "frequency", names(DataAnalysis))
names(DataAnalysis)<-gsub("Acc", "Accelerometer", names(DataAnalysis))
names(DataAnalysis)<-gsub("Gyro", "Gyroscope", names(DataAnalysis))
names(DataAnalysis)<-gsub("Mag", "Magnitude", names(DataAnalysis))
names(DataAnalysis)<-gsub("BodyBody", "Body", names(DataAnalysis))

# Creating a second independent data set with the mean sorted by subject and activity
TidyDataAnalysis <- aggregate(. ~ SubjectId - ActivityType, data = DataAnalysis, mean)
TidyData<- arrange(TidyDataAnalysis,SubjectId,ActivityType)

# Write TidyData to a file in the root directy directy set by setwd()
write.table(TidyData, "TidyData.txt", row.name=FALSE)

