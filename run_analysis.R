setwd("C:/Users/eli e matti/Google Drive/pvalue training/Getting and Cleaning Data/course_project")


library("reshape2")

y_test <- read.table("./UCI_HAR_Dataset/test/y_test.txt")
x_test <- read.table("./UCI_HAR_Dataset/test/x_test.txt")
subject_test <- read.table("./UCI_HAR_Dataset/test/subject_test.txt")
y_train <- read.table("./UCI_HAR_Dataset/train/y_train.txt")
x_train <- read.table("./UCI_HAR_Dataset/train/x_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
features <- read.table("./UCI_HAR_Dataset/features.txt")
activity_labels <- read.table("./UCI_HAR_Dataset/activity_labels.txt")


VAR_names <- c("subject_id", "activity_id", as.character(features$V2))

test_df <- cbind(subject_test, y_test, x_test)
train_df <- cbind(subject_train, y_train, x_train)
step1_df <- rbind(test_df, train_df)
colnames(step1_df) <- VAR_names

mean1 <- grep("mean\\(\\)", names(step1_df), ignore.case = T)
std1 <- grep("std\\(\\)", names(step1_df), ignore.case = T)
step2_df <- subset(step1_df, select=c(1,2,mean1,std1))
step2_df[,2] <- factor(step2_df[,2],labels=activity_labels$V2)

table(step2_df$activity_id)

old_name <- c("tBody","Acc","tGravity","Gyro","Mag","f") 
new_name <- c("time.Body.","Acceleration.", "time.Gravity.", "Angular.velocity.",
              "Magnitude","frequency.")
for(i in 1:6) {
    colnames(step2_df) <- sub(old_name[i], new_name[i], colnames(step2_df))
}


step3_df <- melt(step2_df,id=c("subject_id","activity_id"),measure.vars=colnames(step2_df[3:68]))
tidy1 <- dcast(step3_df, subject_id + activity_id ~ variable, mean)

write.table(x=tidy1,"UCI_HAR_tidy_data.txt", row.names=F)
