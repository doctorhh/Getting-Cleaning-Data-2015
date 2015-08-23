Code Book
========

### Data Set Information:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Check the README.txt file for further details about this dataset. For the purposes of this project, the files in the Inertial Signals folders are not used. The files that will be used to load data are listed as follows:

- test/subject_test.txt
- test/X_test.txt
- test/y_test.txt
- train/subject_train.txt
- train/X_train.txt
- train/y_train.txt

### Value extracted from the file:

- Values of Activity consist of data from "Y_train.txt" and "Y_test.txt"
- Values of Subject consist of data from "subject_train.txt" and subject_test.txt"
- Values of Features consist of data from "X_train.txt" and X_test.txt"
- Names/Label of variables Features come from "features.txt"
- Level/Type of variable Activity come from "activity_labels.txt"

### Explanation of The Script
Data transformation
-------------------
The raw data sets are processed with run_analisys.R script to create a tidy data set

Merge training and test sets

Training and test data (X_train.txt, X_test.txt), subject  (subject_train.txt, subject_test.txt) and activity (y_train.txt, y_test.txt) are combined to obtain a single data set. Variables are labelled with the names assigned by original collectors (features.txt).

Extract mean and standard deviation variables

From the combined data set is selected and created an intermediate data set with only the values of estimated mean (variables with labels that contain ???mean()") and standard deviation (variables with labels that contain "std").

Use descriptive activity names
From the descriptions in activity_labels.txt file, the label are being matched and applied to the intermediate data set.

Create a tidy data set

From the intermediate data set is created a final tidy data set where numeric variables are averaged (aggregated) for each activity and each subject.

The tidy data set contains 180 observations with 68 variables divided in:

- An identifier of the subject who carried out the experiment (SubjectId): 1 to 30
- An activity label (ActivityType): WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
- a 66-feature vector with time and frequency domain signal variables (numeric)
