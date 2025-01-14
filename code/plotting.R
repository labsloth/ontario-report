
library(tidyverse)

sample_data <- read_csv("sample_data.csv")
# reads csv file: for tidyverse read_csv / other read.csv

# lets comment
Sys.Date() # outputs the current date

getwd() # outputs the current working directory

sum(5,6) # adds numbers
 
# creating first plot
ggplot(data = sample_data) +
  aes(x = temperature) +
  labs(x = "Temperature (C)") +
  aes(y = cells_per_ml/1000000) +
  labs(y = "Cells (millions/mL)") +
  geom_point() +
  labs(title = "Does temperature affect microbial abundance?") +
  aes(color = env_group) + # groups by different colors
  aes(size = chlorophyll) + # groups by different sizes
  aes(shape = env_group) + 
  labs(size = "Chlorophyll (ug/L)",
       color = "Environmental Group",
       shape = "Environmental Group")

# combined "neater" code
ggplot(data = sample_data) +
  aes(x = temperature,
      y = cells_per_ml/1000000,
      color = env_group,
      size = chlorophyll,
      shape = env_group) +
  geom_point() +
  labs(x = "Temperature (C)",
       y = "Cells (millions/mL)",
       title = "Does temperature affect microbial abundance?",
       size = "Chlorophyll (ug/L)",
       color = "Environmental Group",
       shape = "Environmental Group")


# importing datasets
buoy_data <- read_csv("buoy_data.csv")
View(buoy_data)
dim(buoy_data)  
head(buoy_data) # see the beginning of data
tail(buoy_data) # see the end of data


# plot some more - introduce facets
# facet wrap
ggplot(data = buoy_data) +
  aes(x = day_of_year,
      y = temperature,
      group = sensor,
      color = depth) +
  geom_line() +
  facet_wrap(~buoy, scales = "free_y") # free_y: make plots have their own axis

# facet grid
ggplot(data = buoy_data) +
  aes(x = day_of_year,
      y = temperature,
      group = sensor,
      color = depth) +
  geom_line() +
  facet_grid(rows = vars(buoy)) # use  rows = vars(buoy) or = "buoy" for facetgrid / cols & rows / 



# structure of data object
str(buoy_data)

  
# discrete plots
# box plot
boxplot2 <-
  ggplot(data = sample_data)+
  aes(x = env_group,
      y = cells_per_ml) +
  geom_boxplot(fill = "darkblue",
               alpha = 0.3) + # alpha for transparency / outliers = FALSE
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) # rotate x axis lables

# color = line coloring, sample(colors(), size = 10) helps you decide colors
#  scale_fill_manual(values = wes_palette(("Cavalcanti1"))) # or c("pink", "tomato", "papayawhip")

# scale fill brewer
ggplot(data = sample_data)+
  aes(x = env_group,
      y = cells_per_ml) +
  geom_boxplot(aes(fill = env_group)) + # color = line coloring, sample(colors(), size = 10) helps you decide colors
  scale_fill_manual(values = c("#020203", "#e0dcce", "#ab8d59"))

# scale_fill_manual(c(#020203,#e0dcce,#ab8d59))
# scale_fill_brewer(hcl.colors(3, palette = "YlGnBu")) # for color blind or just palette = "Okabe-Ito"

# RColorBrewer::display.brewer.all() 

# custom palette time
install.packages("wesanderson")
library(wesanderson)


# or geom_violin
#  geom_jitter(aes(size = chlorophyll)) # or geom_point & the order affects which one shows first
# only geom_jitter use sizes?


# univariate plots
ggplot(sample_data) +
  aes(x = cells_per_ml) +
  geom_density(aes(fill = env_group), alpha = 0.5) +
  theme_classic() # plot background & theme change

# geom_histogram(bins = 10) # x axis group number

# saving plots
ggsave("awesome_plot.png", width = 6, height = 4, dpi = 600)

  
boxplot2 <- boxplot2 + theme_classic()

ggsave("awesome_plot332.png", plot = boxplot2, width = 6, height = 4, dpi = 600 )

  
# :) hello! 
