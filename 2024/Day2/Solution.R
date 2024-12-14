# Load packages:
library(tidyverse)

## Part 1 ##

report <- readLines("~/GitHub/Advent-of-Code/2024/Day2/input.txt") # Reads the table from the GitHub directory.
report <- report %>%
  strsplit(., "\\s+") %>% # Split strings into substrings for each element of the list. 
  lapply(., as.numeric) # Make the values numeric.

# This function checks the report for differences in each element and saves it as "d".
# Then the lapply function is used to run through the new d list to determine if all values are within the limits.
# The results are reported as TRUE or FALSE.
SafeReports <- function(report){
  d <- lapply(report, diff)
  lapply(d, function(x) all(x > 0 & x <= 3) || all(x >= -3 & x < 0))
}

sum(unlist(SafeReports(report)) == TRUE) # This reports the number of reports that are safe (TRUE).

## Part 2 ##

SafeReports2 <- function(report){
  
}

sum(unlist(SafeReports2(report)) == TRUE) # This reports the number of reports that are safe (TRUE).