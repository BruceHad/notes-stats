library(reshape2)
head(mtcars)

With the rownames() function we can grab the names of the rows and put them in a column of data (might make it easier to use?). The melt function (part of the reshape2 library) sets id variable and measure variable and re-arrange the table accordingly.

mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, id=c("carname", "gear", "cyl"), measure.vars = c("mpg", "hp"))
head(carMelt[order(carMelt$carname),])
# carname gear cyl variable value
#23        AMC Javelin    3   8      mpg  15.2
#55        AMC Javelin    3   8       hp 150.0
#15 Cadillac Fleetwood    3   8      mpg  10.4
#47 Cadillac Fleetwood    3   8       hp 205.0
#...

The dcast() function can recast the molten table into a different shape.

cylData <- dcast(carMelt, cyl ~ variable); cylData
#    cyl mpg hp
#1   4  11 11
#2   6   7  7
#3   8  14 14

This will break down the cylinder by the variable (mpg and hp)
cylData <- dcast(carMelt, cyl ~ variable, mean); cylData
#   cyl      mpg        hp
# 1   4 26.66364  82.63636
# 2   6 19.74286 122.28571
# 3   8 15.10000 209.21429

Common to summarise data by factor.

tapply(InsectSprays$count, InsectSprays$spray, sum)
tapply(InsectSprays$count, InsectSprays$spray, mean)


    