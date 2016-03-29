## Read data.

scc <- readRDS("data/Source_Classification_Code.rds")
nei <- readRDS("data/summarySCC_PM25.rds")


# Aggregate to get total Emissions per type, per year
totals <- aggregate(nei$Emissions, list(type=nei$type, year=nei$year), sum)
names(totals)[3] <- "emissions"

# Create Plot File
library(ggplot2)
png (file = "plot3.png")
qplot(year, emissions, data=totals, facets = . ~ type, geom = c("point","smooth"))
dev.off()
