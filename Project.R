#---------------------------------------------------------#
#               Advanced Visualization in R               #
#              Ozgur POLAT & H. Can Minareci              #
#             Faculty of Economic Sciences UW             #
#                      Term Project                       #
#---------------------------------------------------------#

# Set the working directory
setwd('...')

# Read database
BankChurners <- read.csv("BankChurners.csv", stringsAsFactors = T)

# Read libs
head(BankChurners)


numbers <-c()
factors <- c()
for (i in colnames(BankChurners)){
  if (is.factor(BankChurners[,i]) == TRUE){
    print(i)
    print(unique(BankChurners[,i]))
    factors <- append(factors, i)} else{
      numbers <- append(numbers, i)
    }

}

print(numbers)
print(factors)
