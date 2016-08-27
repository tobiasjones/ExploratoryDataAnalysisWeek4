NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# 3.Of the four types of sources indicated by the type (point, 
# nonpoint, onroad, nonroad) variable, which of these four 
# sources have seen decreases in emissions from 1999-2008 for 
# Baltimore City? Which have seen increases in emissions from 
# 1999-2008? Use the ggplot2 plotting system to make a plot 
# answer this question.

library(ggplot2)
NEIsub <- subset(NEI, fips == "24510")
colSum <- aggregate(NEIsub$Emissions, by=list(year=NEIsub$year, type=NEIsub$type), FUN=sum)

png(filename='./plot3.png', width=900, height=500, units='px')

ggplot(colSum, aes(year, y=x, group = type, color = type)) +
    geom_line() +
    geom_point(size=4, shape=21, fill="white") +
    labs(title = "Baltimore Total Emmissions by Year by Type", y = "tons")

dev.off()

png(filename='./plot3-2.png', width=900, height=500, units='px')

qplot(year, x, data=colSum, facets=.~type, xlab="Year")+geom_smooth(method="lm")

dev.off()

rm(NEI, SCC, NEImerge, NEIsub, colSum)
