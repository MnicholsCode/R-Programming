#Include class and ggplot2 package to do KNN and read in the data via csv
library(class)
library(ggplot2)
breast_cancer_data <- read.csv("C:/Users/malco/OneDrive/Desktop/DSCI 302/Project8/breast_cancer_data.csv", stringsAsFactors=TRUE)
View(breast_cancer_data)

BoxPlotPredictorOnTarget <- function(target, predictor){
  return(ggplot(data = breast_cancer_data, aes(x = target, y = predictor)) + geom_boxplot(aes(col = target),
                                                                                   notch = TRUE))
}

#area_mean against Diagnosis
#assuming diagnosisis target and therefore x value
BoxPlotPredictorOnTarget(breast_cancer_data$diagnosis, breast_cancer_data$area_mean)
#area_se against Diagnosis
BoxPlotPredictorOnTarget(breast_cancer_data$diagnosis, breast_cancer_data$area_se)
#texture_mean against Diagnosis
BoxPlotPredictorOnTarget(breast_cancer_data$diagnosis, breast_cancer_data$texture_mean)

#creating normalization
Normal <- function (val){
  result <- (val - min(val)) / (max(val) - min(val))
  return(result)
}
#normalize the necessary values
breast_cancer_data$area_mean <- Normal(breast_cancer_data$area_mean)
breast_cancer_data$area_se <- Normal(breast_cancer_data$area_se)
breast_cancer_data$texture_mean <- Normal(breast_cancer_data$texture_mean)

#Check is normalization worked
summary(breast_cancer_data)   #each value is between 0 and 1 as needed

#Now to create KNN model
#Splitting the data into train (80%) and test(20%)
sample.size <- floor(0.8*nrow(breast_cancer_data))

#selecting my target
data.target <- breast_cancer_data$diagnosis

#selecting cols used for the next instances
predictors <- c("area_mean", "area_se", "texture_mean")
data.predictors <- breast_cancer_data[predictors]

#setting train and test to fit area_mean
train.full <- data.predictors[1:sample.size,]
test.full <- data.predictors[-c(1:sample.size),]

#Selecting corresponding labels
cl <- data.target[1:sample.size]
test.label.full <- data.target[-c(1:sample.size)]


#forecast for area_mean, area_se
knn.two.pred <- knn(train.full[1:2], test.full[1:2], cl, k = 1)
table(test.label.full, knn.two.pred)

#forecast for area_mean, area_se and texture_area
knn.full <- knn(train.full, test.full, cl, k = 1)

#construct the confusion matrix/contingency table
table(test.label.full, knn.full)

