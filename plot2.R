NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# 2.Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (fips == "24510") from 1999 to 2008? Use the base 
# plotting system to make a plot answering this question.

NEIsub <- subset(NEI, fips == "24510")
colSum <- aggregate(NEIsub$Emissions, by=list(year=NEIsub$year), FUN=sum)

png(filename='./plot2.png', width=900, height=500, units='px')

barplot(colSum$x, 
        colSum$year, main="Baltimore Total Emmissions by Year", 
        ylab = "tons",
        names.arg = colSum$year)

dev.off()

rm(NEI, SCC, NEIsub, colSum)
