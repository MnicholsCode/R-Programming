loan <- read.csv("C:/Users/malco/OneDrive/Desktop/DSCI 302/Project6/loan.csv", stringsAsFactors=TRUE)
#loading in ggplot2
library(ggplot2)

#Histogram and density plot for loan_amnt
ggplot(data = loan, aes(x = loan_amnt)) + geom_histogram(aes(y = ..density..), col = "black",
                                                         fill = "white") +
  geom_density(alpha = .2, fill = "pink") + geom_vline(aes(xintercept = mean(loan_amnt)),
                                                       col = "green", linetype = "dashed",
                                                       size = 1) +
  ggtitle("Histogram and Density of Loan_Amnt")

#Scatter plot for loan vs.annual
ggplot(data = loan, aes(x = annual_inc, y = loan_amnt)) +
  geom_point() + geom_smooth() + ggtitle("Loan vs Annual Scatter Plot")

#Checking if term and grade are factors
is.factor(loan$term)
is.factor(loan$grade)

#Now to create a barplot with these two using ggplot2
ggplot(data = loan, aes(x = grade, y = ..count..)) + geom_bar(aes(fill = term)) +
  ggtitle("Bar Plot of term and grade")

max(loan$loan_amnt)
#dotplot for loan_amnt
ggplot(data = loan, aes(x = loan_amnt)) + geom_dotplot(dotsize = 0.5, col = "blue") +
  

ggplot(data = loan, aes(x = grade, y = loan_amnt)) + geom_dotplot(aes(fill = grade),
                                                                  binaxis = "y", binwidth = 2,
                                                                  stackdir = "center") + 
  labs(title = "Loan amount for Grade", x = "Grade", y = "Loan Amnt")
  

#boxplot for term vs loan_amnt
#we will first create the graph, thne save it to a file
ggplot(data = loan, aes(x = term, y = loan_amnt)) + geom_boxplot(aes(col = term),
                                                                 notch = TRUE)
#save the file by specifying the file size
ggsave("C:\\Users\\malco\\OneDrive\\Desktop\\DSCI 302\\project6\\loanterm.jpg", 
       width = 20, height = 15, units = "cm")

#close the file
dev.off()
