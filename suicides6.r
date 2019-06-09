# https://www.kaggle.com/zynicide/wine-reviews

# ler arquivo .csv
crashes <- read.csv2("suici2.csv", header = TRUE, 
                  sep = ";", stringsAsFactors = FALSE, encoding = "UTF-8")

library(ggplot2)

#numMale <- filter(crashes,sex=="male")
#numTotalByYear <-  summarise(X = sum(trunc(suicidesper100k)))  %>% group_by(year)

ggplot(crashes, aes(y=suicidesper100k, x=year)) + geom_bar(stat = "identity")




