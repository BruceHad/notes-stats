## Read data.

scc <- readRDS("data/Source_Classification_Code.rds")
nei <- readRDS("data/summarySCC_PM25.rds")

# Find "coal combustion-related sources"
coal <- grepl('coal', scc$Short.Name, ignore.case = TRUE)
combustion <- grepl('comb', scc$Short.Name, ignore.case = TRUE)
scc <- scc[coal & combustion,]

# Subset nei where SCC is coal and combustion

nei <- nei[nei$SCC %in% scc$SCC,]

# Aggregate to get total Emissions per type, per year
totals <- aggregate(nei$Emissions, list(year=nei$year), sum)
names(totals)[2] <- "emissions"

# Create Plot File
png (file = "plot4.png")
plot(totals, type="l", ylab="PM2.5 Coal Combustion Emmissions(tons)")
dev.off()
