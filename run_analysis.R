library(reshape2)

#####
## - You should create one R script called run_analysis.R that does the
##   following. 
## - Merges the training and the test sets to create one data set.
## - Extracts only the measurements on the mean and standard deviation for each
##   measurement. 
## - Uses descriptive activity names to name the activities in the data set
## - Appropriately labels the data set with descriptive variable names. 
## - From the data set in step 4, creates a second, independent tidy data set 
##   with the average of each variable for each activity and each subject.
#####

#####
#1. Merges the training and the test sets to create one data set.
######
features <- read.table("features.txt", stringsAsFactors=FALSE)
train <- read.table("train/X_train.txt", stringsAsFactors=FALSE)
test <- read.table("test/X_test.txt", stringsAsFactors=FALSE)
names(train) <- features$V2
names(test) <- features$V2
obs <- rbind(train, test)
subject_train <- read.table("train/subject_train.txt", stringsAsFactors=FALSE)
y.train <- read.table("train/y_train.txt", stringsAsFactors=FALSE)
y.test <- read.table("test/y_test.txt", stringsAsFactors=FALSE)

## Put together the subjects, name them, eventually add to data. ##
subject_test <- read.table("test/subject_test.txt", stringsAsFactors=FALSE)
subject <- rbind(subject_train, subject_test)
names(subject) <- "subject"

## Long-winded way of changing the numbers in the label column to their
## activity.
label <- rbind(y.train, y.test)
label[label == 1] <- "WALKING"
label[label == 2] <- "WALKING_UPSTAIRS"
label[label == 3] <- "WALKING_DOWNSTAIRS"
label[label == 4] <- "SITTING"
label[label == 5] <- "STANDING"
label[label == 6] <- "LYING"
names(label) <- "activity"

## Create data frame with everything included ##
data <- cbind(label, obs)
data <- cbind(data, subject)

#####
## 2. Extract only the measurements on the mean and standard deviation for each
## measurement.
#####
# Grabbing indices that are associated with a mean/std column.
idx.mean <- which(grepl("mean", names(data)) == TRUE)
idx.std <- which(grepl("std", names(data)) == TRUE)
idx.Mean <- which(grepl("Mean", names(data)) == TRUE)
idx <- union(idx.mean, idx.std)
idx <- union(idx, idx.Mean)

#####
## 3. Uses descriptive activity names to name the activities in the data set
#####
## activity_labels.txt: The y_train and y_test give the activity label PER ROW.
#####
#1 WALKING
#2 WALKING_UPSTAIRS
#3 WALKING_DOWNSTAIRS
#4 SITTING
#5 STANDING
#6 LAYING
## ACTIVITY LABELS APPLIED ABOVE FOR SIMPLICITY.
#####
# DONE ABOVE #

#####
## 4. Appropriately labels the data set with descriptive variable names. 
#####
# DONE ABOVE #

#####
## 5. From the data set in step 4, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject.
#####
# Melt the data over subjects and activities. 
data.melt <- melt(data, id=c("subject", "activity"), measure.vars=idx)
# For each subject/activity pair, calculate the mean of each variable.
bothData <- dcast(data.melt, subject + activity ~ variable, mean)

write.table(bothData, file = "tidyData.txt" , row.name = FALSE)
## DONE ##
