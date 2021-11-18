# Read in file
library(readxl)
SP500 <- read_excel("C:/Users/malco/OneDrive/Desktop/DSCI 302/project2/SP500-1.xlsx")
View(SP500)

# Getting dimensions of the data frame
dim(SP500)

# Selecting three columns
SP500[, c("SP500", "CPI", "Rate")]

# Selecting Some rows
SP500[c(10, 100, 500, 1500),]

# Filtering the data frame
HighSP500 <- subset(SP500,(SP500 > 2000) | (CPI < 100))
print(HighSP500)

# More filtering data
EarningsCheck <- subset(SP500, (Earnings > 50) & (Rate < 3), select = c(SP500, Dividend))
print(EarningsCheck)

# Removing a column
SP500$Rate <- NULL

# adding a column
LatestCPI <- as.double(SP500[1773, "CPI"])       # Grabbing latest element for CPI
print(LatestCPI)                                 # This value represents CPI(2018.09)

# Create column and used other columns to calculate the values
SP500$RealPrice <- SP500$SP500 * (SP500$CPI / LatestCPI)
head(SP500)

SP500$RealEarnings <- SP500$Earnings * (SP500$CPI / LatestCPI)
head(SP500)

SP500$PERatio <- SP500$RealPrice / SP500$RealEarnings
head(SP500)