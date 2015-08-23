# Getting-Cleaning-Data-2015
What you find in this repository

- CodeBook.md: Information about raw and tidy data set and detail about the data transformation
- README.md: This file
- run_analysis.R: R script to transform raw data set in a tidy data set (as per the assignment)

How to create the tidy data set

- Clone this repository: git clone https://github.com/doctorhh/Getting-Cleaning-Data-2015.git
- Download the compressed raw data : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- Unzip raw data and copy the directory UCI HAR Dataset to the cloned repository root directory
- Open a R console and set the working directory to the repository root (use setwd()) where the files are downloaded and unzipped : the line #7 in the script may need to be marked as comment (as this is the author working directory)
- Execute the run_analisys.R script (it requires the dplyr package): source('run_analysis.R')
- Once the run_analisys.R script has been executed, the tidy data set will in the root directory under the TidyData.txt name.
