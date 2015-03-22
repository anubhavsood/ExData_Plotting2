NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

data_baltimore<-NEI[NEI$fips == "24510", ]
sum_em_baltimore<-aggregate(NEI$Emissions~NEI$year,data=data_baltimore,FUN=sum)
colnames(sum_em_baltimore)<-c('Year', 'Emissions')
sum_em_baltimore$kilo<- round(sum_em_baltimore$Emissions/1000,2)

png('plot2.png')

barplot(sum_em_baltimore$kilo,names.arg = sum_em_baltimore$Year,main='Emission in Baltimore City',xlab = 'Year',ylab=expression(paste('PM', ''[2.5],' Total Emission')))

dev.off()