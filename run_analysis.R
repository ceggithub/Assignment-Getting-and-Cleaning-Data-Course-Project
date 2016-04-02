library(dplyr)

## Set work dir. Change to main directory that can be run as long as the Samsung data
setwd("/home/carlos/coursera/R/data-cleaning/UCI-HAR-Dataset")

## Load initial variables and tables
features <- read.table("features.txt", col.names = c("index", "name"))
activitylabels <- read.table("activity_labels.txt", col.names = c("index", "name"))
testsubject <- read.table("test/subject_test.txt")
testactivity <- read.table("test/y_test.txt")
trainsubject <- read.table("train/subject_train.txt")
trainactivity <- read.table("train/y_train.txt")

###!! and Appropriately labels the data set with descriptive variable names using "col.names"
train <- read.table("train/X_train.txt", col.names = features$name)
test <- read.table("test/X_test.txt", col.names = features$name)

## Add variables "subject" and "activity" to temp data.frame "test" and "train"
## "subject" contains the number of volunteer
## "activity" contains the movement carried out by volunteer
test$subject <- testsubject$V1
test$activity <- testactivity$V1
train$subject <- trainsubject$V1
train$activity <- trainactivity$V1

###!! Merges the "train" and the "test" sets to create one data set.
dados <- rbind(train, test)

###!! Extracts only the measurements on the mean and standard deviation for each measurement.
###!! This step my understanding was that the variables containing medium or standard deviation will be maintained. 
###!! Then the columns will be kept containing "mean" or "avg" in its name. Besides the variables "subject" and "activity".
dadosmean <- select(dados, grep("(mean)|(std)",names(dados)), subject, activity)

###!! Uses descriptive activity names to name the activities in the data set
dadosmean$activity <- activitylabels$name[dados$activity]

###!! From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## group data by "activity" and "subject"
dadosgroup <- group_by(dadosmean, activity, subject)
## and then do the "mean" them
tidy <- summarise_each(dadosgroup, funs(mean))
write.table(tidy, file = "./tidy.txt", row.name=FALSE)

### Clean temp tables
rm(dados, activitylabels, features, test, testsubject, testactivity, train, trainsubject, trainactivity, dadosgroup, dadosmean)

### Now you have a file "tidy.txt" and datafile called "tidy"
### Tks