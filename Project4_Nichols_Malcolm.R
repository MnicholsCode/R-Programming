loan <- read.csv("C:/Users/malco/OneDrive/Desktop/DSCI 302/Project4/loan.csv")
View(loan)

#checking the numerical variables
is.numeric(loan$loan_amnt)
is.numeric(loan$id)
is.numeric(loan$annual_inc)

#using summary to find min, max, 25th, 50th(median) and 75th of loan_amnt
#Could use mean(), meadian(), min(), max()
#and quantile(loan$loan_amnt, probs = c(0.25, 0.5, 0.75)) to get the same answers as summary
summary(loan$loan_amnt)
#Now to find standard deviation of loan_amnt
sd(loan$loan_amnt)

#Same methods used above but for int_rate
summary(loan$int_rate)
sd(loan$int_rate)

#calculating coefficient for int_rate and installment
cor(loan$int_rate, loan$installment)

#checking if term is categorical, if not will have to make it one
is.factor(loan$term)
loan$term <- as.factor(loan$term)
print(is.factor(loan$term))

#now we will find the freq tables and mode variable
table(loan$term)
names(sort(-table(loan$term)))[1]

#Checking if loan_status is categorical, if not will have to make it one
is.factor(loan$loan_status)
loan$loan_status <- as.factor(loan$loan_status)
print(is.factor(loan$loan_status))

#Now we will do prop table and find the mode for this variable
prop.table(table(loan$loan_status))
names(sort(-prop.table(table(loan$loan_status))))[1]

#See the cross table between term and loan_status
xtabs(~ term + loan_status, data = loan)

#will provide prop for row and col
xtab.term.loan_status <- xtabs(~ term + loan_status, data = loan)
prop.table(xtab.term.loan_status, margin = 1)
prop.table(xtab.term.loan_status, margin = 2)

#now to summarize the entire data set, but first we must make sure the remaining
#categorical variables are created.
loan$grade <- as.factor(loan$grade)
loan$emp_length <- as.factor(loan$emp_length)
loan$home_ownership <- as.factor(loan$home_ownership)
loan$verification_status <- as.factor(loan$verification_status)

summary(loan)

#testing prop.table to see if I can get it to look better
test <- prop.table(table(loan$loan_status))
df <- as.data.frame(test)
colnames(df) <- c("Loan_Status", "Freq")
print(df)

#Doing the same method to clean up xtab
xtab_full <- xtabs(~ term + loan_status, data = loan)
xtab_full_df <- as.data.frame(xtab_full)
print(xtab_full_df)

xtab_row <- prop.table(xtab.term.loan_status, margin = 1)
xtab_row_df <- as.data.frame(xtab_row)
print(xtab_row_df)

xtab_col <- prop.table(xtab.term.loan_status, margin = 2)
xtab_col_df <- as.data.frame(xtab_col)
print(xtab_col_df)
