# functions and packages for the NHIS ACU data analysis project 
library("ipumsr")
library(tidyverse)

# NOTE: To load data, you must download both the extract's data and the DDI
# and also set the working directory to the folder with these files (or change the path below).
if (!require("ipumsr")) stop("Reading IPUMS data into R requires the ipumsr package. It can be installed using the following command: install.packages('ipumsr')")

# function to get the count of instances matching a certain answer in a column
getCount <- function(dataframe, col, value) {
  dataframe %>%
    filter(col == value) %>%
    summarise(count = n())
}

# function to get the percentage of the total for a variable. 
getPercentage <- function(dataframe, col, value) { 
  total <- dataframe %>% 
    summarise(count = n())
  variable <- dataframe %>%
    filter(col == value) %>%
    summarise(count = n())
  percentage <- round((variable / total) * 100, 3)
  return(paste0(percentage, " %"))
}

