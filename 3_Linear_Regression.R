#' @title 3_Linear_Regression.R
#' @description Performing linear regression on exploratory and response variables
#' @author NMCG
#' @bugs None
#' @seealso https://www.tutorialspoint.com/r/r_linear_regression.htm
#' 

# plot of linear regression
if(!require("tidyverse"))
  install.packages("tidyverse")
library(tidyverse)


############################# Example 2 - In-built #############################

x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)  #weight
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48) #height

# Apply the lm() function.
relation <- lm(y~x)

print(summary(relation))

plot(y,x,col = "blue",main = "Height & Weight Regression",
     abline(lm(x~y)),cex = 1.3,pch = 16,xlab = "Weight in Kg",ylab = "Height in cm")


############################# Example 2 - GGplot2 ############################# 
data <- data.frame(
  dependent_var = c(1, 2, 3, 4, 5),
  independent_var = c(5, 4, 3, 2, 1)
)

# Run linear regression
model <- lm(dependent_var ~ independent_var, data = data)

# View the summary of the model
summary(model)

#using ggplot
p <- ggplot(data, aes(x = independent_var, y = dependent_var)) +
  geom_point() +
  theme_minimal()

# Add the linear regression line
p + geom_smooth(method = "lm", se = FALSE, color = "blue")