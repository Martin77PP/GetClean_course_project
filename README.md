GetClean_course_project
=======================
course project repository for coursera getting and cleaning data

in yhe repository you will find the run_analysis.R file containing the code to execute to get the UCI_HAR_tidy_data.txt file.
The run_analysis.R file after setting the wd import into R the raw data from the UCI HAR Dataset
The raw data are in txt files and run_analysis.R imports the data in R as data.frame with the read.table function.
The raw data are grouped in test set and train set, for each group we have X_, Y_ and subject_ files containing respectively the raw data from misuration, the activity_id for each measure and the subject_id for each measure

