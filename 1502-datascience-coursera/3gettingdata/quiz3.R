data <- read.csv("getdata_data_ss06hid.csv")
head(data)
str(data)
lv <- (data$ACR == 3 & data$AGS == 6)
head(lv)
head(data$SERIALNO[lv])
which(lv)
data[125,]

library(jpeg)
data <- readJPEG("getdata_jeff.jpg", native=TRUE)
quantile(data, c(.30,.80))

gdp <- read.csv("getdata_data_GDP.csv", header=FALSE, skip = 5, 
                colClasses = c(NA, NA, "NULL", NA, NA, "NULL","NULL","NULL","NULL","NULL"),
                stringsAsFactors = FALSE,
                nrow = 190);
colnames(gdp) <- c("sc", "rank", "country", "GDP")
gdp$GDP <- as.numeric(gsub(",","", gdp$GDP)) # Convert GDP to numeric

con <- read.csv("getdata_data_EDSTATS_Country.csv", stringsAsFactors = FALSE)
data <- merge(gdp, con, by.x="sc", by.y = "CountryCode")
data[, c("sc", "country", "GDP", "rank")]
data <- data[order(data$rank, decreasing = TRUE),]
data[13, c("sc", "country", "GDP", "rank")]

data <- data[, c("sc", "country", "GDP", "rank", "Income.Group")]
data$Income.Group = factor(data$Income.Group)
sapply(data$rank,mean)
str(data)
tapply(data$rank, data$Income.Group, mean)

data$quantile = cut(data$rank, 5, labels=FALSE)
table(data$quantile, data$Income.Group)
