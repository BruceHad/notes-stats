data_file <- "activity.csv"
activity <- read.csv(data_file, , colClasses = c("date" = "Date"))
head(activity)
activity_no_na <- activity[which(!is.na(activity$steps)),]
steps_per_day <- tapply(activity_no_na$steps, activity_no_na$date, sum)
head(steps_per_day)
plot(steps_per_day)

summary(steps_per_day)


avg_per_interval <- tapply(activity$steps, activity$interval, mean, na.rm=TRUE)
plot(avg_per_interval, type="l", xlab="Interval", ylab="Average No. of Steps")
max <- as.character(which.max(avg_per_interval))
hour = as.character(round(as.integer(max)/12,2))


na_rows = as.character(nrow(activity[which(is.na(activity$steps)),]))

filled_activity = activity
for(i in 1:nrow(filled_activity)){
    if(is.na(filled_activity[i,1])){
        filled_activity[i,1] <- avg_per_interval[as.character(filled_activity[i,3])]
    } 
}

head(filled_activity)

steps_per_day <- tapply(filled_activity$steps, filled_activity$date, sum)
head(steps_per_day)
hist(steps_per_day, main ="Histogram of Steps per Day", xlab = "Steps per Day")
mn2 <- as.character(round(mean(steps_per_day),2))
md2 <- as.character(round(median(steps_per_day),2))

weekend <- c()
weekend[1] <- "hello"

for(i in 1:nrow(filled_activity)){
    if(weekdays(filled_activity[i,2]) %in% c("Saturday", "Sunday")){
        weekend[i] <- "weekend"
    } else{
        weekend[i] <- "weekday"
    }
}
filled_activity$week <- as.factor(weekend)
head(filled_activity)
aggdata = aggregate(filled_activity, by=list(filled_activity$date, filled_activity$week), FUN = mean, na.rm = TRUE)
aggdata = setNames(aggdata[,1:3], c("date","week","average_steps"))
head(aggdata)
library(lattice)
xyplot()