library(dplyr)

## Getting the Data ##

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

# Unzip dataSet to /data directory
unzip(zipfile="./data/Dataset.zip",exdir="./data")

## Reading the files into R training and test files separately ##

# Trainings tables:
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# Testing tables:
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

## Reading Features & Activity Labels ##

# Reading Features:
features <- read.table('./data/UCI HAR Dataset/features.txt')

# Reading Activity Labels:
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

## Naming the columns ##

colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')

## MERGE ##

mrg_train <- cbind(y_train, subject_train, x_train)
mrg_test <- cbind(y_test, subject_test, x_test)
merged_data <- rbind(mrg_train, mrg_test)

## Mean and StDev Calcs for each Measurement ##

colNames <- colnames(merged_data)

mean_and_std <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) |
                   grepl("std.." , colNames) )

merged_mean_stdev <- merged_data[, mean_and_std == TRUE]

## Merge Activity ID's & Write new tidy table##

merged_data_labels <- merge(merged_mean_stdev, activityLabels, by = 'activityId', all.x = TRUE)

tidy_data <- cbind(merged_data_labels, merged_mean_stdev)

write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE, col.names = TRUE)

