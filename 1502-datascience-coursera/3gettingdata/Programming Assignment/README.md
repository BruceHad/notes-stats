# Getting And Cleaning Data

20/03/2015
https://class.coursera.org/getdata-012/

This project uses an R script called run_analysis.R to collate and summarise data from the _Human Activity Recognition Using Smartphones Dataset_.

1. Take the data file from the Test folder (X_test.txt) and merge with subject and activity data.
2. Take the data file from the Train folder (X_train.txt) and merge with the subject and activity data.
3. Combine the Test and Train data into one data frame.
4. Provide descriptive column headings. Column headings are sourced from the features.txt file.
5. Provide descriptive actions columns by merging with the activities_label.txt file.
6. Create a subset with only the measurements on the mean and standard deviation. These are defined as activities containing either 'mean' or 'std' in the column headings.
7. Aggregate the data to provide an average for each measurement, per subject, per activity.
8. Result is exported to the output.csv file.
