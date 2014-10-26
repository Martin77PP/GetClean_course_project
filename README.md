GetClean_course_project
=======================
course project repository for coursera getting and cleaning data

in the repository you will find the run_analysis.R file containing the code to execute to get the UCI_HAR_tidy_data.txt file.

First step: importing the data
The run_analysis.R file after setting the wd imports into R the raw data from the UCI HAR Dataset.
The raw data are in txt files and run_analysis.R imports the data in R as data.frame with the read.table function.
The raw data are grouped in test set and train set, for each group we have X_, Y_ and subject_ files containing respectively the raw data from measurements, the activity_id for each measurement and the subject_id for each measurement.
In addition the code imports in R the features files, containing the name for each kind of measurement, and the activity_labels file, containing the activity names corresponding to the activity_id numbers.

Second step: creating a merged data_set and renaming variables
with the cbind function I create 2 data.frame, one for the test and one for the train group, binding by columns the x_, y_ and subject_ data.frame, the two new data.frames are test_df and train_df.
binding the test_df and the train_df by rows with rbind I create a dataframe with all the observations, I named it step1_df.
VAR_names is a vector containing the variables names taken from the features data.frame and I assigned this names to the step1_df columns.
with the grep function I create two vectors with the index of names(step1_df) containing the words "mean" or "std" to subset step1_df
finally I transormed the activity_id variable in a factor with the levels corresponding to activity_labels and renamed the variables names with a for loop

third step: tidy data set
with the melt function (library("reshape2")) I create the step3_df data.frame with the subject_id and activity_id as id and all the other variables as measure.vars
with cast function (library("reshape2")) I create the tidy1 data.frame with the mean for each measure.vars by activity and subject


