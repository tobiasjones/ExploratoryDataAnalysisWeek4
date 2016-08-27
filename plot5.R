NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# 5.How have emissions from motor vehicle sources 
# changed from 1999-2008 in Baltimore City?

library(ggplot2)
NEImerge <- merge(NEI, SCC, by = "SCC")
colSum <- aggregate(NEImerge$Emissions, by=list(year=NEImerge$year), FUN=sum)
colSum$x1 <- colSum$x / 1000

png(filename='./plot5.png', width=900, height=500, units='px')

ggplot(colSum, aes(year, y=x1)) +
    geom_line() +
    geom_point(size=4, shape=21, fill="white") +
    labs(title = "Motor Vehicle Emmissions by Year", y = "tons (in thousands)")

dev.off()

rm(NEI, SCC, NEImerge, colSum)
