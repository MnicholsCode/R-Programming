library(readxl)
BlackFriday <- read_excel("C:/Users/malco/OneDrive/Desktop/DSCI 302/project3/BlackFriday.xlsx")
View(BlackFriday)

#Avg purchase amount using a FOR loop
sum <- 0
for (idx in c(1:nrow(BlackFriday))) {
  sum <- sum + BlackFriday[idx, "Purchase"]
}
avg <- sum / nrow(BlackFriday)
print(avg)

#Avg purchase amount using a WHILE loop
sum <- 0
idx <- 1
while (idx <= nrow(BlackFriday)) {
  sum <- sum + BlackFriday[idx, "Purchase"]
  idx <- idx + 1
}
avg <- sum / nrow(BlackFriday)
print(avg)

#Avg purchase amount using a REPEAT loop
sum <- 0
idx <- 1
repeat {
  sum <- sum + BlackFriday[idx, "Purchase"]
  idx <- idx + 1
  if (idx > nrow(BlackFriday)) {
    break
  }
}
avg <- sum / nrow(BlackFriday)
print(avg)

#Avg purchase amount for females using FOR loop
FemaleSum <- 0
count <- 0
for (idx in c(1:nrow(BlackFriday))) {
  if (BlackFriday[idx, "Gender"] == "F") {
   FemaleSum <- FemaleSum + BlackFriday[idx, "Purchase"]
   count <- count + 1
  }
}
FemaleAvg <- FemaleSum / count
print(FemaleAvg)

#Avg purchase amount for females using WHILE loop
#Since i have the value for count for Females purchase average
#I will be using that value for the While and repeat loop for
#Female avg
sum <- 0
idx <- 1
while (idx <= nrow(BlackFriday)) {
  if (BlackFriday[idx, "Gender"] == "F") {
    sum <- sum + BlackFriday[idx, "Purchase"]
  }
  idx <- idx + 1
}
avg <- sum / count
print(avg)

#Avg purchase amount for females using REPEAT loop
sum <- 0
idx <- 1
repeat {
  if (BlackFriday[idx, "Gender"] == "F") {
    sum <- sum + BlackFriday[idx, "Purchase"]
  }
  idx <- idx + 1
  if (idx > nrow(BlackFriday)) {
    break
  }
}
avg <- sum / count
print(avg)

#Difference between male and female purchase avg
#using previous value FemaleAvg to help find difference
MaleSum <- 0
MaleCount <- 0
for (idx in c(1:nrow(BlackFriday))) {
  if (BlackFriday[idx, "Gender"] == "M") {
    MaleSum <- MaleSum + BlackFriday[idx, "Purchase"]
    MaleCount <- MaleCount + 1
  }
}
MaleAvg <- MaleSum / MaleCount
print(MaleAvg)

result <- MaleAvg - FemaleAvg
print(result)
