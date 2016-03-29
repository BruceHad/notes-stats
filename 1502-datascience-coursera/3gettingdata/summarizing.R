if(!file.exists("./data")){dir.create("./data")}
url <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(url, destfile="./data/rest.csv", method="curl")
restData <- read.csv("./data/rest.csv")
head(restData)
summary(restData)    
str(restData)

# Quantiles
quantile(restData$councilDistrict, na.rm = TRUE)
# 0%  25%  50%  75% 100% 
# 1    2    9   11   14 
# Or you can give is different quantiles
quantile(restData$councilDistrict, na.rm = TRUE, probs = c(0.1, 0.5, 0.9))
# 10% 50% 90% 
# 1   9  12 

# Make tables by tabulating the data.
table(restData$zipCode, useNA="ifany")
#useNA="ifany" will add a column to count the no. of NAs.

table(restData$zipCode, restData$councilDistrict, useNA="ifany")

# this creates a two d cross table.

# Find NAs
sum(is.na(restData$councilDistrict))
#[1] 0
any(is.na(restData$councilDistrict))
# [1] FALSE
all(restData$zipCode > 0)
# [1] FALSE
# all check and see if every single value satifies the condition

# Taking Sums
colSums(is.na(restData))
# name         zipCode    neighborhood councilDistrict  policeDistrict      Location.1 
# 0               0               0               0               0               0 
all(colSums(is.na(restData)) == 0)
# [1] TRUE

# Values with Specific Charteristics

table(restData$zipCode %in% c("21212", "21213"))
# FALSE  TRUE 
# 1268    59 

# and we can use that condition to subset the data
head(restData[restData$zipCode %in% c("21212", "21213"),], n=3)
# name zipCode              neighborhood councilDistrict policeDistrict
# 29 BAY ATLANTIC CLUB   21212                  Downtown              11        CENTRAL
# 39       BERMUDA BAR   21213             Broadway East              12        EASTERN
# 92         ATWATER'S   21212 Chinquapin Park-Belvedere               4       NORTHERN
#                            Location.1
# 29    206 REDWOOD ST\nBaltimore, MD\n
# 39    1801 NORTH AVE\nBaltimore, MD\n
# 92 529 BELVEDERE AVE\nBaltimore, MD\n

# Cross Tabs
data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)
head(DF)
