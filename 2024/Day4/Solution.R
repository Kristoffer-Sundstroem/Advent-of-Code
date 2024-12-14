# Load packages:
library(tidyverse)

data <- readLines("~/GitHub/Advent-of-Code/2024/Day4/input.txt") %>% # Imports the dataset. 
  strsplit("") %>% # Creates a list.
  do.call(rbind, .) # Binds the rows together from the different parts of the list to a matrix.

## Part 1 ##
## Currently working on this.