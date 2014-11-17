#datacleaningproject
===================

####The course project for Getting and Cleaning Data


run_analysis.R combines several data files to make a tidy data set.
These files include:

- X_train.txt
- y_train.txt
- subject_train.txt
- X_test.txt
- y_test.txt
- subject_test.txt
- features.txt
- activity_labels.txt

The R script performs the following steps:

1. Load the training data, testing data, features, and activity labels
2. Merge training data and testing data
3. Give descriptive names to activities
4. Rename columns
5. Remove unnecessary columns
6. Merge all data
7. Rename Activity column
8. Order data by subject and activity
9. Create new table of averages
10. Split rownames into two columns

The output of run_analysis.R is a tidy data set that contains the average of all mean and standard deviation measurements by subject and activity.
