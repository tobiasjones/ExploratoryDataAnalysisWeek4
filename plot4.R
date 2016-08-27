NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# 4.Across the United States, how have emissions from coal 
# combustion-related sources changed from 1999-2008?

library(ggplot2)
NEImerge <- merge(NEI, SCC, by = "SCC")
NEIsub <- subset(NEImerge, grepl("Coal", SCC.Level.Three))
colSum <- aggregate(NEIsub$Emissions, by=list(year=NEIsub$year), FUN=sum)

png(filename='./plot4.png', width=900, height=500, units='px')

ggplot(colSum, aes(year, y=x)) +
    geom_line() +
    geom_point(size=4, shape=21, fill="white") +
    labs(title = "United States Coal Emmissions by Year", y = "tons")

dev.off()

rm(NEI, SCC, NEImerge, NEIsub, colSum)
