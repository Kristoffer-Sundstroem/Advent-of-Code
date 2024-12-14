# Load packages:
library(tidyverse)

data <- read_lines("~/GitHub/Advent-of-Code/2024/Inputs/Day3.txt") # Imports the dataset.

data <- data %>%
  str_match_all("mul\\((\\d+),(\\d+)\\)") %>% # Match together all the strings that matches the specified condition.
  map(~ .[, 2:3]) %>% # Extract the numbers.
  unlist() %>% # Unlist the list.
  data.frame() # Put it all in a dataframe.