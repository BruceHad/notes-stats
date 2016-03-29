# Reproducible Research Assignment 1

13/09/2015

## Loading and Preprocessing the Data

Show any code that is needed to load the data (i.e. read.csv()) and process/transform the data (if necessary) into a format suitable for your analysis.


```r
data_file <- "activity.csv"
activity <- read.csv(data_file, colClasses = c("date" = "Date"))
```

## Mean total number of steps taken per day:

For this part of the assignment, you can ignore the missing values in the dataset.

1. Calculate the total number of steps taken per day
2. If you do not understand the difference between a histogram and a barplot, research the difference between them. Make a histogram of the total number of steps taken each day
3. Calculate and report the mean and median of the total number of steps taken per day




```r
activity_no_na <- activity[which(!is.na(activity$steps)),]
steps_per_day <- tapply(activity_no_na$steps, activity_no_na$date, sum)
hist(steps_per_day, main ="Histogram of Steps per Day", xlab = "Steps per Day")
```

![plot of chunk mean_steps](figure/mean_steps-1.png) 

```r
mn <- as.character(round(mean(steps_per_day),2))
md <- as.character(round(median(steps_per_day),2))
```
The mean number of steps per day is 10766.19 and the median is 10765.

## Average Daily Activity Pattern:

1. Make a time series plot (i.e. type = "l") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all days (y-axis)
2. Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?


```r
avg_per_interval <- tapply(activity$steps, activity$interval, mean, na.rm=TRUE)
plot(avg_per_interval, type="l", xlab="Interval", ylab="Average No. of Steps")
```

![plot of chunk daily_averages](figure/daily_averages-1.png) 

```r
max <- as.character(which.max(avg_per_interval))
hour = as.character(round(as.integer(max)/12,2))
```

The interval that contains the highest number of steps on average is 104 which is around 8.67 hours into the day.
