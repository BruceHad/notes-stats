file <- "getdata-wksst8110.for"
df <- read.fwf(file, c(-1, 9, -5, 4, 4,-5,4,4,-5,4,4,-5,4,4), skip=4, header=FALSE )
head(df)
col <- df[,4]
sum(col)
