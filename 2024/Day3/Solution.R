# Load packages:
library(tidyverse)

data <- read_lines("~/GitHub/Advent-of-Code/2024/Day3/input.txt") # Imports the dataset.

## Part 1 ##

data1 <- data %>%
  str_match_all("mul\\((\\d+),(\\d+)\\)") %>% # Match together all the strings that matches the specified condition.
  map(~ .[, 2:3]) %>% # Extract the numbers.
  do.call(rbind, .) # Rowbind all the elements from the matrix created from the earlier code.

data1 <- matrix(as.numeric(data1), nrow = nrow(data1), ncol = ncol(data1))

sum(data1[,1] * data1[,2]) # Print the result for part 1.

## Part 2 ##

data2 <- data
data2 <- paste(unlist(data2), collapse = " ")

data2 <- data2 %>%
  str_match_all("(?<=do\\(\\)).*mul\\((\\d+),(\\d+)\\) | (?<=don't\\(\\)).*(?=.*do\\(\\)).*mul\\((\\d+),(\\d+)\\)") %>% # Match together all the strings that matches the specified condition.
  map(~ .[, 2:3]) %>% # Extract the numbers.
  do.call(rbind, .) # Rowbind all the elements from the matrix created from the earlier code.

data2 <- matrix(as.numeric(data2), nrow = nrow(data2), ncol = ncol(data2))

sum(data2[,1] * data2[,2])

## 1238651 is wrong.
## 220616 is wrong.