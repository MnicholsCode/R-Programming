loan <- read.csv("C:/Users/malco/OneDrive/Desktop/DSCI 302/Project5/loan.csv", stringsAsFactors=TRUE)
loan <- loan[seq(1, nrow(loan), 5), ]
View(loan)

#Checking if loan_amount is numerical
is.numeric(loan$loan_amnt)

#Plotting histogram and density of loan_amnt
hist(loan$loan_amnt, main = "Histogram of Loan Amount", xlab = "Loan Amount", ylab = "Frequency")

#density
dloanAmnt <- density(loan$loan_amnt)
plot(dloanAmnt, main= "Density Plot of Loam Amount")

#plotting scatter plot for loan_amnt vs. annual_inc
#first to make sure annual_inc is numeric
is.numeric(loan$annual_inc)

#now to plot the comparison with a trend line
plot(loan$annual_inc, loan$loan_amnt,
    main= "Loan_amnt vs. Annual_inc",
    xlab= "Annual Inc", ylab= "Loan Amount", xlim= c(0,1000000))
abline(lm(loan_amnt ~ annual_inc, data= loan), lwd= 2, col= "red")

#barplot for term and grade on the same plot
is.factor(loan$term)
is.factor(loan$grade)

tbl.term <- xtabs(~ grade + term, data = loan)
barplot(tbl.term, main= "Term Distribution",
        col= c("black", "blue", "red", "orange", "purple", "yellow", "pink"), legend= rownames(tbl.term))

#using a dotchart to describe loan_amnt
dotchart(loan$loan_amnt, pt.cex = 0.5, pch = 1,  xlab = "Loan Amount", color = "blue")

#Doing a boxplot of loan_amnt vs term by first creating the file
#then creating the plot and finally closing the file
jpeg("C:\\Users\\malco\\OneDrive\\Desktop\\DSCI 302\\Project5\\loanterm.jpg")
#plot
boxplot(loan_amnt~term, data= loan, notch=TRUE, col="green",
        main= "Loan Amount by Term", xlab= "Term")
#close the file
dev.off()

#Extra: putting together the histogram and desnsity plots
hist(loan$loan_amnt, main = "Histogram and Density plots for loan_amnt",
     prob= TRUE, xlab = "Loan Amount", ylab = "Probability")
lines(density(loan$loan_amnt), lwd= 2, col= "red")