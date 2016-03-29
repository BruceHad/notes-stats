if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
dest <- "./data/communities.csv"
download.file(fileUrl, destfile=dest, method="curl")
myData <- read.csv(dest)
newNames <- strsplit(names(myData), "wgtp")
newNames[[123]]

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
dest <- "./data/gdp.csv"
download.file(fileUrl, destfile=dest, method="curl")
myData <- read.csv(dest,
                   stringsAsFactors = FALSE,
                   skip=5, 
                   header=FALSE, 
                   nrows=190,
                   fileEncoding = "iso-8859-1",
                   colClass=c(NA, NA, 'NULL', NA, NA, NA, 'NULL', 'NULL', 'NULL', 'NULL')
                   );
names(myData) <- c("CountryCode","ranking","countryNames","gdp", "unknown")
myData$gdp <- gsub(",","",myData$gdp)
head(myData)
tail(myData)
class(myData$gdp)
mean(as.numeric(myData$gdp))
countryNames <- myData$countryNames
grep("^United",countryNames)
gdp <- myData

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
dest <- "./data/gdp.csv"
download.file(fileUrl, destfile=dest, method="curl")
edu <- read.csv(dest,stringsAsFactors = FALSE)
head(gdp)
head(edu)
merged <- merge(gdp, edu)
head(merged$Special.Notes)
june <- grep("Fiscal year end: June", merged$Special.Notes)
merged$Special.Notes[june]


library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 
head(sampleTimes)
twentytwelve <- sampleTimes[year(sampleTimes)==2012]
mondaystwentytwelve = twentytwelve[wday(twentytwelve)==2]
length(twentytwelve)
length(mondaystwentytwelve)
