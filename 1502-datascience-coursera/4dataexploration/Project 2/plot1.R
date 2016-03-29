## Read data.

scc <- readRDS("data/Source_Classification_Code.rds")
nei <- readRDS("data/summarySCC_PM25.rds")

# Aggregate to get total Emissions per year
totals <- aggregate(nei$Emissions, list(Year=nei$year), sum)
names(totals)[2] <- "Emissions"
totals$Emissions <- totals$Emissions/1000

# Create Plot File
png (file = "plot1.png")
plot(totals, type="l", ylab="PM2.5 Emmissions(thousands of tons)")
dev.off()

NEI <- nei
SCC <- scc