library(readxl)
CarInsurances <- read_excel("C:/Users/malco/OneDrive/Desktop/DSCI 302/project1/CarInsurances.xlsx")
View(CarInsurances)

# dimensions of the datasheet
dim(CarInsurances)

# Setting variable for first 8 rows in the datasheet, than printing them
first.eight.rows <- head(CarInsurances, 8)
print(first.eight.rows)

# Setting variable for last 5 rows in the datasheet, then printing them
last.five.rows <- tail(CarInsurances, 5)
print(last.five.rows)

# Two methods used to list the objects in memory
ls()
objects()

# Summary of the datasheet (gives min, max, mean etc.)
summary(CarInsurances)