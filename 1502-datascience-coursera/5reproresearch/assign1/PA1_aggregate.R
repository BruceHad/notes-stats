# aggregate data frame mtcars by cyl and vs, returning means
setwd("~/Dropbox/Learning/DataSci-coursera/5reproresearch/assign1")
data_file <- "activity2.csv"
activity <- read.csv(data_file, , colClasses = c("date" = "Date"))
activity

aggdata = aggregate(activity, by=list(activity$date, activity$week), FUN = mean, na.rm = TRUE)
aggdata = aggregate(steps ~ date + week, data = activity, FUN = mean, na.rm = TRUE)
aggdata

