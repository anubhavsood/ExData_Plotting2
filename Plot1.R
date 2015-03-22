NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")


sum_emission_per_year<-aggregate(NEI$Emissions~NEI$year,data=NEI,FUN=sum)
colnames(sum_emission_per_year)<-c('Year', 'Emissions')
sum_emission_per_year$kilo<- round(sum_emission_per_year$Emissions/1000,2)
png('plot1.png')
barplot(sum_emission_per_year$kilo,names.arg = sum_emission_per_year$Year,main=expression('Total Emission of PM'[2.5]),xlab = 'Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')))
dev.off()
