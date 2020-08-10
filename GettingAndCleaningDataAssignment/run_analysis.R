##packages
library(dplyr, tidyr, data.table)

##loading data
X_train <- fread("UCI HAR Dataset/train/X_train.txt")
y_train <- fread("UCI HAR Dataset/train/y_train.txt")
subject_train <- fread("UCI HAR Dataset/train/subject_train.txt")

X_test <- fread("UCI HAR Dataset/test/X_test.txt")
y_test <- fread("UCI HAR Dataset/test/y_test.txt")
subject_test <- fread("UCI HAR Dataset/test/subject_test.txt")

feature_names <- fread("UCI HAR Dataset/features.txt")

## joining X,y and subject number for train and test
train <- cbind(X_train, y_train, subject_train)
test <- cbind(X_test, y_test, subject_test)

## Join train and test sets
data <- rbind(train, test)

## Renaming variables by renaming the columnnames of the dataset
colnames(data) <- c(feature_names$V2, "activity", "subject_number")

## Getting column names of the columns with mean and standart deviation measurements
mean_names <- grep(".*mean[^F].*", colnames(data), value = TRUE)
std_names <- grep(".*std.*", colnames(data), value = TRUE)

## Getting only te mean and standart deviation measurements from the dataset
mean_std_data <- select(data, mean_names, std_names, "activity", "subject_number")

## Getting rid of activity numbers and replacing them with descriptive names
mean_std_data$activity <- factor(mean_std_data$activity, labels = c("walking",
                                                                    "walking_upstairs",
                                                                    "walking_downstairs",
                                                                    "sitting", "standing",
                                                                    "laying"))
## Group the data before averaging so you get a nice tidy table
by_act_sub <- group_by(mean_std_data, subject_number, activity)

## Create table with the mean of each variable for each activity and each subject
mean_variables <- summarise_all(by_act_sub, mean)

## Writing the table to a file
write.table(mean_variables, file = "tidy_data.txt")