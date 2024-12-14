# Load packages:
require(tidyverse) 

data <- read.table("~/GitHub/Advent-of-Code/2024/Day1/input.txt",
                   header = FALSE) # Reads the table from the GitHub directory.

## Part 1 ##

# Sort and set each of the columns into 2 vectors:
x1 <- data$V1[order(data$V1)] # Vector 1.
x2 <- data$V2[order(data$V2)] # Vector 2.

# Sum the absolute values between x1 and x2 to get answer for part 1.
sum(abs(x1 - x2))

## Part 2 ##

data %>%
  mutate(CountV1 = sapply(V1, function(x) sum(V2 == x))) %>% # Count the amount of times the values in column V1 appears in column V2.
  mutate(Similarity_Score = V1 * CountV1) %>% # Create a similarity score according to the assignment by multiplying the value in V1 with CountV1.
  pull(Similarity_Score) %>% # Pulls the Similarity_Score from data.  
  sum(data$Similarity_Score) %>% # Sums the similarity score to get the answer for part 2 of day 1.
  print() # Prints answer.
