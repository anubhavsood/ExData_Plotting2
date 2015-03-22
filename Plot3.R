library(ggplot2)
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
data_baltimore<-NEI[NEI$fips == "24510", ]
data_baltimore$year<-factor(data_baltimore$year,levels=c('1999', '2002', '2005', '2008'))
png('plot3.png')
ggplot(data = data_baltimore,aes(x=year, y=log(Emissions))) + facet_grid(.~ type) + guides(fill=F) + geom_boxplot(aes(fill=type))+ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + xlab('Year') +ggtitle('Emissions per Type in Baltimore')
dev.off()