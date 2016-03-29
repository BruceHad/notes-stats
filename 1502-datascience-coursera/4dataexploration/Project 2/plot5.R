## Read data.

scc <- readRDS("data/Source_Classification_Code.rds")
nei <- readRDS("data/summarySCC_PM25.rds")

# Find vehicle related sources
vehicles <- grepl('Highway Veh', scc$Short.Name)
scc <- scc[vehicles,]

# Subset nei where SCC is vehicle related.
nei <- nei[nei$SCC %in% scc$SCC,]
# Subset again for Baltimore city (fips = 24510)
nei <- nei[nei$fips == "24510",]

# Aggregate to get total Emissions per type, per year
totals <- aggregate(nei$Emissions, list(year=nei$year), sum)
names(totals)[2] <- "emissions"

# Create Plot File
png (file = "plot5.png")
plot(totals, type="l", ylab="PM2.5 Vehicle Emmissions(tons)")
dev.off()
