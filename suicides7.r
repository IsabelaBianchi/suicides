# https://www.kaggle.com/zynicide/wine-reviews

# ler arquivo .csv
crashes <- read.csv2("suici2.csv", header = TRUE, 
                  sep = ";", stringsAsFactors = FALSE, encoding = "UTF-8")
pais <- subset(crashes,country =="Brazil")



library(ggplot2)

#numMale <- filter(crashes,sex=="male")
#numTotalByYear <-  summarise(X = sum(trunc(suicidesper100k)))  %>% group_by(year)

ggplot(pais, aes(y=suicidesper100k, x=gdp_per_capita, color=sex)) +
  geom_point(alpha=0.6)





