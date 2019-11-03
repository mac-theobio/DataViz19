## Tax data from NYT article

## data scraped from https://www.nytimes.com/interactive/2019/10/06/opinion/income-tax-rate-wealthy.html
## https://gist.github.com/dill/508532714cd58398aaf90a0723efd2fd
# load data scraped from SVG
tax <- readLines("data/taxdat.dat")


taxy <- c()
for(i in 1:length(tax)){
  tt <- tax[i]
  # split to x,y pairs
  tt <- strsplit(tt, " ")[[1]]
  # remove SVG nonsense
  tt <- sub("M", "", tt)
  tt <- sub("L", "", tt)
  # split the x and y coords
  tt <- strsplit(tt, ",")
  # make them numeric
  tt <- lapply(tt, as.numeric)
  # format to 2 column matrix
  tt <- matrix(unlist(tt), ncol=2, byrow=TRUE)
  tt <- as.data.frame(tt)
  # add column names
  names(tt) <- c("income_group", "total_tax_rate")
  # just code income group as numeric and label later
  tt$income_group <- 1:length(tt$income_group)
  # work out the year
  tt$year <- 1949+i
  # add to the data
  taxy <- rbind.data.frame(taxy, tt)
}

# now need to transform the data

# y axis
# from the article text:
# 1950 top rate was 70%
# 2018 top rate was 23%
# 271 is the height of the figure, currently total_tax_rate is
#  recorded as "distance from the top"
taxy$total_tax_rate <- 271 - taxy$total_tax_rate
top_2018 <- taxy[taxy$year==2018,]$total_tax_rate[15]
top_1950 <- taxy[taxy$year==1950,]$total_tax_rate[15]
scale <- (70-23)/(top_1950-top_2018)

# scale starts at 10, so our final number is
taxy$total_tax_rate <- taxy$total_tax_rate*scale + 10

tax <- taxy

# done save RData
save(tax, file="data/taxdata.RData")


# duplicate to get the "background" lines
tax2 <- tax
tax2$year2 <- tax2$year
tax2$year <- NULL

# make labels and breaks for plot
xlabs <- c("0-10th", "20th-30th", "40th-50th", "60th-70th", "80th-90th", "95th-99th", "99.99th", "Top 400")
xbr <- seq(0, 14, 2)

# make a goofy plot
library(ggplot2)
p <- ggplot(tax) +
  geom_line(aes(x=income_group, y=total_tax_rate, group=year2), colour="grey60", data=tax2) +
  geom_point(aes(x=income_group, y=total_tax_rate), colour="orange") +
  geom_line(aes(x=income_group, y=total_tax_rate), colour="orange") +
  labs(x="Income group", y="Total tax rate") +
  scale_x_continuous(labels=xlabs, breaks=xbr) +
  theme_minimal() +
  theme(strip.text.x = element_text(size = 8),
        axis.text.x = element_text(size = 6, angle=45)) +
  facet_wrap(~year, ncol=10)
#print(p)
ggsave(p, width=20, height=8, file="plot.pdf")

