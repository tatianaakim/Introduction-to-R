#     clear the space rm(list = ls())
# Introduction to R (Part 1: the basics)
# This part of the tutorial is from http://www.r-tutor.com/r-introduction
#  - Variable assignment <- or =?
#  - functions are invoked by their names, e.g c()
#  - comments
#  - extension package
#  - getting help
#  - standard data types (numeric, ligical, etc)
#  - vectors, matrices, lists, dataframes
# Tatiana Kim 10/01/2017

myvector = c(1,2,3,4,5,6,7,8,9,10)
print(myvector)


mymatrix = matrix(c(1,2,3,4,5,6,7,8,9),
                ncol = 3,
                nrow = 3)
print(mymatrix)


name = c("Bob", "Alice", "Tom")
age = c(19,21,25)
drivers = c(FALSE, TRUE, TRUE)
mylist = list(name, age, drivers, 3)
print(list)


mydf = data.frame(name, age, drivers)
print(mydf)

#---------------------------------------------
# Data frames

namevector = mydf$name
agevector = mydf$age
driversvector = mydf$drivers


Bobsage = mydf$age[1]
Bobsage = mydaf[1,2]

#column slice
mydf[2]
mydf[,2]

#row slice
mydf[2,]



