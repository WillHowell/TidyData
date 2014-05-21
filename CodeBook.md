# Code Book

This data set is derived from the Samsung smart phone sensor data from the Center for Machine Learning and Intelligent Systems at the University of California, Irvine.  The data has been subset to only include mean and standard deviation values for accelerometer and gravity accelerometer readings.  

It has been hyphothesized that formulas can be created that only use these values to determine a user activity from smart phone sensor readings within a 95% confidence interval.

The dataset generated with this script includes just one table, in the file listed below.  This file is a *tab delimited* file.  

=========================================

- TidyData.txt

For each record it is provided:
======================================

- Activity labels
- Anonymous subject IDs
- Mean values from triaxial acceleration from the accelerometer

Features in this data set:

tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z
tGravityAcc-std()-X
tGravityAcc-std()-Y
tGravityAcc-std()-Z

- - -

## Additional Info

A full description of the original dataset is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones