#     clear the space rm(list = ls())
# Introduction to R (Part 3: Data Manipulation)
# - dplyr
#       Filter()
#       Mutate()
#       Summarise()
#       Group by()
#       Pipe()
# - tidyR
#       Gather()
#       Unite()
#       Spread()
#       Gather()
      
# Tatiana Kim 10/01/2017

#----------------------------------------------------------------------------------------


library(dplyr)

# SELECT
CHousePriceDF = select(HousePriceDF, date_of_transfer, locality, old_new, postcode, price, property_type)


# FILTER - filter data by condition
NewHousesDF = filter(CHousePriceDF, old_new == "Y")

RecentSalesDF = filter(CHousePriceDF, substr(date_of_transfer, 1, 4) >2014 )


# MUTATE - add new column
PriceConvDF = mutate(RecentSalesDF, USDPrice = price*1.22)

# SUMMARISE
Summary = summarise(RecentSalesDF, mean(price, ma.rm = TRUE))

# GROUP BY
summarise(group_by(PriceConvDF, property_type), mean(USDPrice, na.rm = TRUE))

# ARRANGE
ArrangeByPriceDF = arrange(NewHousesDF, desc(price))

#PIPE
FilteredArrangedDF = CHousePriceDF %>% filter(old_new == "Y") %>% arrange(desc(price))



#----------------------------------------------------------------------------------------



# store data by month
#SalesByDateDF = CHousePriceDF %>% 
#  mutate(year = substr(date_of_transfer,1,4), month = substr(date_of_transfer,6,7), day = substr(date_of_transfer,9,10)) %>%
#  select(month, year, price, property_type)


library(tidyr)

# SEPARATE
SalesByDateDF2 = CHousePriceDF %>% separate(date_of_transfer, c("year", "month", "day"), sep = "-")

#UNITE
SalesByDateDF3 = SalesByDateDF2 %>% unite(date_of_transfer, year, month, day, sep = "-")

#SPREAD
SalesbyTypeDF = SalesByDateDF %>% select(year, price, property_type) 
SalesDF = summarise(group_by(SalesbyTypeDF, property_type,year), avprice = mean(price))


SpreadSalesDF = SalesDF %>% spread(year, avprice)

SpreadSalesDF = SalesDF %>% spread(property_type, avprice)

# GATHER
GatheredSalesDF = SpreadSalesDF %>% gather(property_type, avprice, D,F,O,S,T)


# events merge with parking data set





