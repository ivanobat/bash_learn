stocks <- commandArgs(trailingOnly=TRUE)

# load library
library(ggplot2)

# load in the file
data <- read.csv("resultsFinal.csv", header = FALSE)

data$Stock <- factor(rep(stocks, each = 30))
colnames(data) <- c("Date","Open", "Stock")
data$Date <- as.Date(data$Date, "%Y-%m-%d")

# create a small figure
pdf("plot.pdf")
ggplot(data = data, aes(x = Date, y = Open)) + geom_line(aes(colour = Stock))
dev.off()
