## Read data.

scc <- readRDS("data/Source_Classification_Code.rds")
nei <- readRDS("data/summarySCC_PM25.rds")

# Find vehicle related sources
vehicles <- grepl('Highway Veh', scc$Short.Name)
scc <- scc[vehicles,]

# Subset nei where SCC is vehicle related.
nei <- nei[nei$SCC %in% scc$SCC,]

# Subset again for Baltimore city (fips = 24510)
nei_baltimore <- nei[nei$fips == "24510",]
#Subset again for Los Angeles (fips = "06037")
nei_la <-nei[nei$fips == "06037",]

# Aggregate to get total Emissions per type, per year
totals_baltimore <- aggregate(nei_baltimore$Emissions, list(year=nei_baltimore$year), sum)
totals_la <- aggregate(nei_la$Emissions, list(year=nei_la$year), sum)
names(totals_baltimore)[2] <- "emissions"
names(totals_la)[2] <- "emissions"

# Create Plot File
png (file = "plot6.png")
par(mfrow = c(1,2))
plot(totals_baltimore, type="l", ylab="PM2.5 Vehicle Emmissions(tons)", main="Baltimore City", ylim = c(0,2000))
plot(totals_la, type="l", ylab="", main="LA County", ylim = c(3000,5000))
dev.off()
