# plot 4
# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
library("dplyr")
#read data
setwd("D://Data Science Coursera//Exploratory Data Analysis with R//Project2//exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#retrieve the rows relared to Coal Combustion in SCC dataset
combustion <- SCC[grep("Combustion", SCC$SCC.Level.One), ]
combustioncoal <- combustion[grep("Coal", combustion$EI.Sector), ]
#subset the data in NEI dataset
ccdata <- filter(NEI, SCC %in% combustioncoal$SCC)
#group the data by year 
ccyear <- group_by(ccdata, year)
q4 <- summarize(ccyear, total_pm25 = sum(Emissions, na.rm = TRUE))
#draw the plot using the base plotting system
with(data = q4, plot(year, total_pm25, main = "Trend of PM25 from coal combustion-related sources", xlab = "year", ylab = "Total Emission of PM25", type = "b"))
#save the plot
dev.copy(png, file="plot4.png")
dev.off()
