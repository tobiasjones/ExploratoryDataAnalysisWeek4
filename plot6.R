NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# 6. Compare emissions from motor vehicle sources in Baltimore City with emissions
# from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

library(ggplot2)
NEImerge <- merge(NEI, SCC, by = "SCC")
#Need to search by motor vehicle and Baltimore
NEIsubMA <- subset(NEI, fips == '24510' & type == 'ON-ROAD')
NEIsubCA <- subset(NEI, fips == '06037' & type == 'ON-ROAD')

colSumMA <- aggregate(NEIsubMA$Emissions, by=list(year=NEIsubMA$year), FUN=sum)
colnames(colSumMA) <- c('year', 'Emissions')
colSumMA$City <- paste(rep('Baltimore',4))

colSumCA <- aggregate(NEIsubCA$Emissions, by=list(year=NEIsubCA$year), FUN=sum)
colnames(colSumCA) <- c('year', 'Emissions')
colSumCA$City <- paste(rep('Los Angeles',4))

DF <- as.data.frame(rbind(colSumMA, colSumCA))

png(filename='./plot6.png', width=900, height=500, units='px')

ggplot(DF, aes(x=year, y=Emissions, color=City, group=City)) +
    geom_line() +
    scale_x_continuous(breaks = c(1999, 2002, 2005, 2008)) + 
    labs(title = "Total Venichle Emmissions by Year\nLos Angeles, CA vs. Baltimore City, MD", y = "Tons", x = "Year")

dev.off()

png(filename='./plot6-2.png', width=900, height=500, units='px')

qplot(year, Emissions, data=DF, color=City, xlab="Year", main = "Comparison of Emissions Reduction in Baltimore and L.A.")+geom_smooth(method="lm")

dev.off()

rm(NEI, SCC, NEImerge, NEIsubMA, NEIsubCA, colSumMA, colSumCA, DF)
