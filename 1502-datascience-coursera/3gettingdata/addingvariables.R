if(!file.exists("./data")){dir.create("./data")}
url <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(url, destfile="./data/rest.csv", method="curl")
restData <- read.csv("./data/rest.csv")

# Sometimes you need an index for your data. The seq() function generates regular sequences.
s1 <- seq(1, 10, by=2); s1
# [1] 1 3 5 7 9
s2 <- seq(1, 10, length=3); s2
#[1]  1.0  5.5 10.0
x <- c(1,2,4,15,100); s3 <- seq(along=x); s3
# [1] 1 2 3 4 5
# along creates an index of consecutive integers the same length as x. Useful for looping over a vector.

restData$nearMe = restData$neighborhood %in% c("Roland Park", "Homeland")
table(restData$nearMe)
# FALSE  TRUE 
# 1314   13 

# Create Binary variable with ifelse() function.
restData$zipWrong = ifelse(restData$zipCode < 0, TRUE, FALSE)

# Might want to create categorical data out of quantitative data. use the cut() function.
restData$zipGroups = cut(restData$zipCode, breaks = quantile(restData$zipCode))
table(restData$zipGroups)

# cut() creates factor variables.

# Also can create factor variable.
restData$zipCode = factor(restData$zipCode)
class(restData$zipCode)
# [1] "factor"

