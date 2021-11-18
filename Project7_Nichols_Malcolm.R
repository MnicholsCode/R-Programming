#Read in data with strings as factors
kc_house_data <- read.csv("C:/Users/malco/OneDrive/Desktop/DSCI 302/Project7/kc_house_data.csv", header=TRUE, stringsAsFactors=TRUE)
View(kc_house_data)

#Building model to forecast price using these 3 variables
lm.result <- lm(price ~ bedrooms + bathrooms + sqft_living, data= kc_house_data)
#Checking coefficients
summary(lm.result)$coefficients
summary(lm.result)

#Using summary to find R^2 and adj R^2
summary(lm.result)$r.squared
summary(lm.result)$adj.r.squared

#Building same model but using all cross effects between them
#Interpret as * between bathrooms, bedrooms, and sqft_living
#So we are going to end up with a frmula like
#price = bedrooms + bathrooms + sqft_living
#       + bedrooms:bathrooms + bedrooms:sqft_living + bathrooms:sqft_living
#       + bedrooms:bathrooms:sqft_living
lm.result2 <- lm(price ~ bedrooms * bathrooms * sqft_living, data= kc_house_data)
summary(lm.result2)

#Building model using same three variables as well as waterfront and grade
#will check if waterfront and grade are numeric or factors first
is.factor(kc_house_data$grade)
is.numeric(kc_house_data$grade)
is.factor(kc_house_data$waterfront)
is.numeric(kc_house_data$waterfront)

#they are both numeric values and will be treated as such
lm.result3 <- lm(price ~ bedrooms + bathrooms + sqft_living + waterfront + grade, data= kc_house_data)
summary(lm.result3)

#building a model that forecast price using all other cols except
# id, date, zipcode, lat, and long and without y-intercept
lm.result4 <- lm(price ~ . -1 -id -date -zipcode -lat -long, data = kc_house_data)
summary(lm.result4)


#building model to include more varibles to then compare to new data
lm.result5 <- lm(price ~ bedrooms + bathrooms + sqft_living + sqft_lot + floors + waterfront + view +
                   condition + grade, data = kc_house_data)

#will create a new dataframe with the given information
new.house <- data.frame(bedrooms = 4, bathrooms = 2, sqft_living = 2560, sqft_lot = 7650, floors = 1.5,
                        waterfront = 1, view = 3, condition = 5, grade = 10)
#going to now predict avg sales price for this house
predict(lm.result5, newdata = new.house, interval = "predict")

