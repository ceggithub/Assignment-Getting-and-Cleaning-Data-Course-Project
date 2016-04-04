# Code Book

#############
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description and complete original data is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#############

## Here follows the description of the steps and content for generating file "tiny.txt":

All data were originally obtained from files:

features.txt, test/x_test.txt, train/x_test.txt - Contains the names and values of the features. These names have been converted to column names using the "make.name," and then selected the names containing "mean" or "std" as requested.

activity_labels.txt, test/y_test.txt, train/y_train.txt - Contains the number and values of the activity. It was used to convert the numbers of activities and to create "activity" column in "Tidy"

All original data were joined in a table, and grouped (group_by) "activity" and "subject". So it was calculated the average of each variable (79 variables in total).

Below is an example of the original variable name and its new name converted to "make.name":

Original number  	Original name	  Var name in Tidy

1	tBodyAcc-mean()-X	tBodyAcc.mean...X

2	tBodyAcc-mean()-Y	tBodyAcc.mean...Y

3	tBodyAcc-mean()-Z	tBodyAcc.mean...Z

4	tBodyAcc-std()-X	tBodyAcc.std...X

5	tBodyAcc-std()-Y	tBodyAcc.std...Y

6	tBodyAcc-std()-Z	tBodyAcc.std...Z
..
..
..


