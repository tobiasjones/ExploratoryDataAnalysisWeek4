if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileUrl, destfile = "./data/particulat_data.zip")
unzip('./data/particulat_data.zip', exdir = "./data")

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

summary(NEI)
table(NEI$Pollutant)
table(NEI$type)
table(NEI$year)
