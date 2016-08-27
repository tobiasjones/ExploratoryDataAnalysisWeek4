NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# 1.Have total emissions from PM2.5 decreased in the United States 
# from 1999 to 2008? Using the base plotting system, make a plot 
# showing the total PM2.5 emission from all sources for each of 
# the years 1999, 2002, 2005, and 2008.

colSum <- aggregate(NEI$Emissions, by=list(year=NEI$year), FUN=sum)
colSum$x1 <- colSum$x / 1000

png(filename='./plot1.png', width=900, height=500, units='px')

barplot(colSum$x1, 
        colSum$year, main="Total Emmissions by Year", 
        ylab = "tons (in thousands)",
        names.arg = colSum$year)

dev.off()

rm(NEI, SCC, colSum)
