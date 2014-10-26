GetClean_course_project
=======================
course project repository for coursera getting and cleaning data

in the repository you will find the run\_analysis.R file containing the code to execute to get the UCI\_HAR\_tidy\_data.txt file.

* First step: importing the data <br />
The run_analysis.R file after setting the wd imports into R the raw data from the UCI HAR Dataset.<br />
The raw data are in txt files and run_analysis.R imports the data in R as data.frame with the read.table function.<br />
The raw data are grouped in test set and train set, for each group we have X\_, Y_ and subject_ files containing respectively the raw data from measurements, the activity\_id for each measurement and the subject_id for each measurement.<br />
In addition the code imports in R the features files, containing the name for each kind of measurement, and the activity\_labels file, containing the activity names corresponding to the activity_id numbers.

* Second step: creating a merged data_set and renaming variables<br />
with the cbind function I create 2 data.frame, one for the test and one for the train group, binding by columns the x\_, y_ and subject_ data.frame, the two new data.frames are test\_df and train_df.<br />
binding the test\_df and the train\_df by rows with rbind I create a dataframe with all the observations, I named it step1_df.<br />
VAR\_names is a vector containing the variables names taken from the features data.frame and I assigned this names to the step1_df columns.<br />
with the grep function I create two vectors with the index of names(step1\_df) containing the words "mean" or "std" to subset step1_df<br />
finally I transormed the activity\_id variable in a factor with the levels corresponding to activity_labels and renamed the variables names with a for loop<br />

* third step: tidy data set<br />
with the melt function (library("reshape2")) I create the step3\_df data.frame with the subject\_id and activity_id as id and all the other variables as measure.vars<br />
with cast function (library("reshape2")) I create the tidy1 data.frame with the mean for each measure.vars by activity and subject<br />


