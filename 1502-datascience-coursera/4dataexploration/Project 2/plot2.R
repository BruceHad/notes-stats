## Read data.

scc <- readRDS("data/Source_Classification_Code.rds")
nei <- readRDS("data/summarySCC_PM25.rds")

# Subset data for Baltimore city (fips = 24510)

nei <- nei[nei$fips == "24510",]


# Aggregate to get total Emissions per year
totals <- aggregate(nei$Emissions, list(Year=nei$year), sum)
names(totals)[2] <- "Emissions"

# Create Plot File
png (file = "plot2.png")
plot(totals, type="l", ylab="PM2.5 Emmissions Baltimore City (tons)")
dev.off()
