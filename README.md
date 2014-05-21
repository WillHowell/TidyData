# Creating Tidy Data

- - -

There is one R script in this repo, run_analysis.R.  This script can be run used with the Samsung smart phone sensor data set from the Center for Machine Learning and Intelligent Systems at the University of California, Irvine.

That data has been subset.  It has been hyphothesized that formulas can be created that only use these values to determine a user activity from smart phone sensor readings within a 95% confidence interval.

- - -

## Setup

1. Download run_analysis.R from this repo.

2. Use the source() command to source the file, you will either need to enter the path to where run_analysis.R was saved or use the setwd() to change the working directory to that folder

2. Download this zip file:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

3. Extract to a folder of your choosing

4. Use the setwd() command to set the working directory to that of the extracted folder (hint, this is the same folder that contains the activity_labels.txt)

5. StartProcess() in the R console.  The script will generate TidyData.txt, a tab-delimited file to be used for further study of the sensor data.  See CodeBook.md in this repo for information on the data structure of this table.

- - -

## Additional Info

A full description of the original dataset is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
