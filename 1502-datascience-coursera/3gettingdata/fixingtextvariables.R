Manipulating nasty textual variables, with commas and dashes and difficult punctuation.

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile="./data/cameras.csv", method="curl")
cData <- read.csv("./data/cameras.csv")
names(cData)

Change case:
    
tolower(names(cData))
toupper(names(cData))

Split on the dot (period):
Period is a reserved character so you need to escape it.

splitNames <- strsplit(names(cData), "\\.")
splitNames[[6]]
splitNames[6]
splitNames[[6]][1]

So we can write a quick function that will read through the names and return the first element:

firstElement <- function(x){x[1]}
sapply(splitNames, firstElement)

fileUrl1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 <- "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1, destfile="./data/reviews.csv", method="curl")
download.file(fileUrl2, destfile="./data/solutions.csv", method="curl")
reviews <- read.csv("./data/reviews.csv"); solutions <- read.csv("./data/solutions.csv")
head(reviews)
head(solutions)

Fixing character vectors with sub()

names(reviews)
[1] "id"          "solution_id" "reviewer_id" "start"       "stop"        "time_left"   "accept" 

We can remove the underscore

sub("_","",names(reviews))
[1] "id"         "solutionid" "reviewerid" "start"      "stop"       "timeleft"   "accept"

Can also use gsub() to remove multiple instances. (sub() only replaces the first it finds)

Searching with grep()

grep("Alameda", cData$intersection)
[1]  4  5 36

head(grepl("Alameda", cData$intersection))
[1] FALSE FALSE FALSE  TRUE  TRUE FALSE

Can use this to subset your data.

cameraData2 <- cData[!grepl("Alameda", cData$intersection),]
head(cameraData2)

The value = TRUE parameter will return the value rather than the index.

The stringr package has useful functions:
library(stringr)
nchar("Me and you")
[1] 10

substr("me and you", 1,3)
[1] "me "

paste("me","you")
[1] "me you"

paste0("me","you")
[1] "meyou"

str_trim("Me   ")
[1] "Me"

Name of variables should usually be: lower case, descriptive and without underscores or white space(?). No duplicates.

Variables with character values should usually be turned into factors, and descriptive (True, False vs 1/0)