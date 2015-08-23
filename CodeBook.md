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

From the combined data set is selected and created an intermediate data set with only the values of estimated mean (variables with labels that contain "mean()") and standard deviation (variables with labels that contain "std").

Use descriptive activity names
From the descriptions in activity_labels.txt file, the label are being matched and applied to the intermediate data set.

Create a tidy data set

From the intermediate data set is created a final tidy data set where numeric variables are averaged (aggregated) for each activity and each subject.

The tidy data set contains 180 observations with 68 variables divided in:

- An identifier of the subject who carried out the experiment (SubjectId): 1 to 30
- An activity label (ActivityType): WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
- a 68-feature vector with time and frequency domain signal variables (numeric)

### Description of abbreviations of measurements in the original data set
- leading t or f is based on time or frequency measurements -> has been replaced by time and frequency in the Tidy Data set
- BodyBody = related to body movement.-> has been replaced by Body
- Gravity = acceleration of gravity
- Acc = accelerometer measurement -> has been replaced by Accelerometer
- Gyro = gyroscopic measurements -> has been replaced by Gyroscope
- Jerk = sudden movement acceleration
- Mag = magnitude of movement -> has been replaced by Magnitude

- mean and SD are calculated for each subject for each activity for each mean and SD measurements.

1.	1 timeBodyAccelerometer-mean()-X
2.	2 timeBodyAccelerometer-mean()-Y
3.	3 timeBodyAccelerometer-mean()-Z
4.	4 timeBodyAccelerometer-std()-X
5.	5 timeBodyAccelerometer-std()-Y
6.	6 timeBodyAccelerometer-std()-Z
7.	9 timeBodyAccelerometer-mad()-Z
8.	41 timeGravityAccelerometer-mean()-X
9.	42 timeGravityAccelerometer-mean()-Y
10.	43 timeGravityAccelerometer-mean()-Z
11.	44 timeGravityAccelerometer-std()-X
12.	45 timeGravityAccelerometer-std()-Y
13.	46 timeGravityAccelerometer-std()-Z
14.	81 timeBodyAccelerometerJerk-mean()-X
15.	82 timeBodyAccelerometerJerk-mean()-Y
16.	83 timeBodyAccelerometerJerk-mean()-Z
17.	84 timeBodyAccelerometerJerk-std()-X
18.	85 timeBodyAccelerometerJerk-std()-Y
19.	86 timeBodyAccelerometerJerk-std()-Z
20.	121 timeBodyGyroscope-mean()-X
21.	122 timeBodyGyroscope-mean()-Y
22.	123 timeBodyGyroscope-mean()-Z
23.	124 timeBodyGyroscope-std()-X
24.	125 timeBodyGyroscope-std()-Y
25.	126 timeBodyGyroscope-std()-Z
26.	161 timeBodyGyroscopeJerk-mean()-X
27.	162 timeBodyGyroscopeJerk-mean()-Y
28.	163 timeBodyGyroscopeJerk-mean()-Z
29.	164 timeBodyGyroscopeJerk-std()-X
30.	165 timeBodyGyroscopeJerk-std()-Y
31.	166 timeBodyGyroscopeJerk-std()-Z
32.	201 timeBodyAccelerometerMagnitude-mean()
33.	202 timeBodyAccelerometerMagnitude-std()
34.	227 timeBodyAccelerometerJerkMagnitude-mean()
35.	228 timeBodyAccelerometerJerkMagnitude-std()
36.	240 timeBodyGyroscopeMagnitude-mean()
37.	241 timeBodyGyroscopeMagnitude-std()
38.	253 timeBodyGyroscopeJerkMagnitude-mean()
39.	254 timeBodyGyroscopeJerkMagnitude-std()
40.	266 frequencyBodyAccelerometer-mean()-X
41.	267 frequencyBodyAccelerometer-mean()-Y
42.	268 frequencyBodyAccelerometer-mean()-Z
43.	269 frequencyBodyAccelerometer-std()-X
44.	270 frequencyBodyAccelerometer-std()-Y
45.	271 frequencyBodyAccelerometer-std()-Z
46.	345 frequencyBodyAccelerometerJerk-mean()-X
47.	346 frequencyBodyAccelerometerJerk-mean()-Y
48.	347 frequencyBodyAccelerometerJerk-mean()-Z
49.	348 frequencyBodyAccelerometerJerk-std()-X
50.	349 frequencyBodyAccelerometerJerk-std()-Y
51.	350 frequencyBodyAccelerometerJerk-std()-Z
52.	373 frequencyBodyAccelerometerJerk-meanFreq()-X
53.	374 frequencyBodyAccelerometerJerk-meanFreq()-Y
54.	375 frequencyBodyAccelerometerJerk-meanFreq()-Z
55.	424 frequencyBodyGyroscope-mean()-X
56.	425 frequencyBodyGyroscope-mean()-Y
57.	426 frequencyBodyGyroscope-mean()-Z
58.	427 frequencyBodyGyroscope-std()-X
59.	428 frequencyBodyGyroscope-std()-Y
60.	429 frequencyBodyGyroscope-std()-Z
61.	503 frequencyBodyAccelerometerMagnitude-mean()
62.	516 frequencyBodyAccelerometerJerkMagnitude-mean()
63.	517 frequencyBodyAccelerometerJerkMagnitude-std()
64.	529 frequencyBodyGyroscopeMagnitude-mean()
65.	530 frequencyBodyGyroscopeMagnitude-std()
66.	542 frequencyBodyGyroscopeJerkMagnitude-mean()
67.	543 frequencyBodyGyroscopeJerkMagnitude-std()
68.	552 frequencyBodyGyroscopeJerkMagnitude-meanFreq()



The set of variables that were estimated from these signals are:
- mean(): Mean value
- std(): Standard deviation
