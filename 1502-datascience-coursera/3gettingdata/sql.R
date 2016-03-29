library(sqldf)
setwd("~/Projects/datasciencecoursera/gettingdata")
file <- "getdata-data-ss06pid.csv"
acs <- read.csv(file)
a <- sqldf("select * from acs where AGEP < 50")
b <- sqldf("select * from acs where AGEP < 50 and pwgtp1")
c <- sqldf("select * from acs")
d <- sqldf("select pwgtp1, agep from acs where AGEP < 50")

unique1 <- unique(acs$AGEP)
uniquea <- sqldf("select distinct AGEP from acs")
head(unique1)
head(uniquea)
