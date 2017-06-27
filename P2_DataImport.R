#     clear the space rm(list = ls())
# Introduction to R (Part 2: Data Import)
#  - read.csv() is a built in function that imports csv files
#  - xlsx package that reads .xlsx spreadsheets into R
#  - RSocrata package has read.socrata that reads data from Socrata portal
#  - RODBC package that enables direct connection to data in SQL databases 
#  - RFacebook and TwitteR packages that extract data from Facebook and Twitter
# Tatiana Kim 10/01/2017


###############################

# example of csv file import
HousePriceDF = read.csv("path to file/House_Price_Paid_Data_Land_Registry.csv")


#example of xls and xlsx spreadsheet imports using xlsx package
library(xlsx)
HousePriceDFxls = read.xlsx("path to file/House_Price_Data_Extract_xls_version.xls", 
                            sheetName = "Sheet1")


HousePriceDFxlsx = read.xlsx2("path to file/House_Price_Data_Extract_xlsx_version.xlsx", 
                            sheetName = "Sheet1")




################################

library(RSocrata)
HousePriceDF = read.socrata("https://data.bathhacked.org/resource/2cyh-9f6b.json")


###############################




