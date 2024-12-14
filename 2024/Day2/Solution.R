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

PadReport <- function(report) {
  d <- lapply(report, diff) # Checks the report for differences in each element and saves it as "d".
  result <- lapply(seq_along(d), function(i) { # Sequences along the elements.
    negative_indices <- which(d[[i]] < 0) # Identifies the negative values.
    positive_indices <- which(d[[i]] > 0) # Identifies the positive values.
    equal_indices <- which(d[[i]] == 0)  # Identifies 0 values.
    if (length(negative_indices) == 1) {
      report[[i]] <- report[[i]][-(negative_indices+1)] # Removes "negative_indicies" (if there is only one of them).
    }
    if (length(positive_indices) == 1) {
      report[[i]] <- report[[i]][-(positive_indices+1)] # Removes "positive_indicies" (if there is only one of them).
    }
    if (length(equal_indices) == 1) {
      report[[i]] <- report[[i]][-(equal_indices-1)] # Removes "positive_indicies" (if there is only one of them).
    }
    return(report[[i]]) # Returns the specific value in the report.
  })
  
  return(result) # Returns the result taht has been saved.
}

PaddedReport <- PadReport(report) # Pad the report given the new guidelines and save it as PaddedReport.

sum(unlist(SafeReports(PaddedReport)) == TRUE) # This reports the number of reports that are safe (TRUE) with the new PaddedReport.