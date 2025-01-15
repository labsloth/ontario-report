
library(tidyverse)

getwd()
setwd("Users/woojin/Desktop/ontario-report/data")

sample_data <- read_csv("data/sample_data.csv")
  
summarize(sample_data, average_cells = mean(cells_perMml))