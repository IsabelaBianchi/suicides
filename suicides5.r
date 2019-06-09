# https://www.kaggle.com/zynicide/wine-reviews

# ler arquivo .csv
crashes <- read.csv2("suici2.csv", header = TRUE, 
                  sep = ";", stringsAsFactors = FALSE, encoding = "UTF-8")
colnames(crashes)[1] <- c("country")

library(dplyr)
library(ggplot2)
library(ggrepel)
# as.data.frame(table(wine$country))

numMillenials <- filter(crashes,generation=="Millenials")
numTotalEachCountry <- numMillenials %>% group_by(country) %>% summarise(X = sum(trunc(suicidesper100k)))

  colnames(crashes) = c('country','year','sex','age','suicides_no','population', 'suicidesper100k')
ggplot(crashes, aes(x=population, y=numTotalEachCountry))+
  geom_point()+
  geom_text(aes(label=country))

