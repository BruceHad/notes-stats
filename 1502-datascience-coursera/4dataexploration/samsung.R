load("samsungData.rda")
par(mfrow = c(1,2), mar = c(5,4,1,1))
samsungData <- transform(samsungData, activity = factor(activity))
