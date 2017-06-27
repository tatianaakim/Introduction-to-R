#     clear the space rm(list = ls())
# Introduction to R (Part 4: Visualising data)
# - Basic graphs in R (plot, hist, etc)
# - Saving graphs in the "Plots" pane OR saving programmatically
# - Layered plots in R with ggplot2
# -
# Tatiana Kim 10/01/2017

summary(SpreadSalesDF)

sapply(SpreadSalesDF, mean, na.rm = TRUE)
# The warning message appear because the column "year" in the data frame is currently stored as a character string, 
# we need to convert it intonumerical value
SpreadSalesDF$year = as.numeric(SpreadSalesDF$year)

# try sapply again - it should now work again
# you can also use sd, var, min, max, median, range, and quantile oinstead of mean

#---------------------------------
# Creating basic linear models and predict values based onthe linear model
linear_model = lm(D~year, data = SpreadSalesDF)

linear_model$coefficients
summary(linear_model)$r.squared
#---------------------------------



attach(SpreadSalesDF)
plot(year, D) 
abline(300000,0, col = "red")
abline(linear_model, col = "blue")
title("Regression of prices on detached properties on year")


#forecasting
forecast_years = data.frame(year = c(2017,2018,2019,2020))
predictions_linear_model = predict(linear_model, forecast_years)


#histogram
hist(CHousePriceDF$price)


FilteredHousePriceDF = CHousePriceDF %>% filter(price<500000)
hist(FilteredHousePriceDF$price)
#pdf("mygraph.pdf")

#------------------------------------

#Saving graphs: 
# 1. from "Plots" pane
# 2. using e.g. pdf() function

#------------------------------------



library(ggplot2)

#basic histogram
qplot(data=FilteredHousePriceDF, price, main="Histogram of property prices below 500K")

qplot( data = SalesDF, year, avprice, colour = "red")

qplot( data = SalesDF, year, avprice, colour = property_type)
qplot( data = SalesDF, year, avprice, group = property_type, geom = "line", colour = property_type, size = 12)

#qplot( data = SalesDF, year, avprice, colour = property_type, geom = "path")



ggplot(FilteredHousePriceDF, aes(x = price)) +
  ggtitle("Histogram of property prices below 500K") +
  labs(x = "price of properties", y = "frequency of sales") +
  geom_histogram()


#coloured scatter plot
ggplot(FilteredHousePriceDF,
       aes(x=date_of_transfer,
           y=price,
           color=old_new))+
  geom_point()

#coloured scattered plot
ggplot(SalesDF,
       aes(x=year,
           y=avprice,
           color=property_type))+
  ggtitle("Sold Propery Prices by Year and Property type")+
  geom_point()


a <- ggplot(data=SalesDF, mapping = aes(x=year, y=avprice, group = property_type))
a <- a + geom_line(mapping = aes(colour = property_type), size = 1)
plot(a)



library(plotly)
library(dplyr)
Groupdata = group_by(SalesDF, property_type)
p <- plot_ly(data = Groupdata, x = ~year, y = ~avprice)

p <-SalesDF %>% 
  group_by(property_type) %>%
  plot_ly(x = ~year, y = ~avprice) %>%
  add_lines(name = "property_type", hoverinfo = ~avprice, color = ~property_type)



