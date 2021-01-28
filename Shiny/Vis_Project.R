library(readr)  # for read_csv
library(inspectdf) #check NA
library(tidyverse)
library(tidyr)
library(leaflet)
library(plotly)
library(shinydashboard)
library(lubridate)
library(shiny)
library(data.table)
library(mltools)
library(lubridate)
library(flexdashboard)
library(base)
library(ggthemes)
library(highcharter)
library(gridExtra)
library(ggpubr)
library(cowplot)
library(ggforce)
library(GGally)
library(ggalluvial)
library(shinyWidgets)



churn <- read.csv("https://raw.githubusercontent.com/ozgur-polat/Advanced-Visualization-in-R-Term-Project/main/Data/churn.csv", sep = ',', stringsAsFactors = TRUE)
head(churn)


churnN <- read.csv("https://raw.githubusercontent.com/ozgur-polat/Advanced-Visualization-in-R-Term-Project/main/Data/churn.csv", sep = ',', na.strings = c("NA", "N/A", "Unknown"), stringsAsFactors = TRUE)
head(churnN)


# rename column names by index
names(churnN)[22] <- "NB_mon_1"
names(churnN)[23] <- "NB_mon_2"

str(churnN)

# check missing values
NA1 <- inspect_na(churnN)
NA1
show_plot(NA1)

# remove NA values
churnNN <- drop_na(churnN)
sum(is.na(churnNN))


#After dropping Unknowns we are having very similar distribution and I would say lets drop it in order to have better EDA
prop.table(table(churn$Attrition_Flag))

prop.table(table(churnNN$Attrition_Flag))


# dropping the columns which is not useful for our analysis
churnNN$CLIENTNUM <- NULL
churnNN$NB_mon_1 <- NULL
churnNN$NB_mon_2 <- NULL

summary(churnNN)
str(churn)


# Ordering factor from smaller to bigger in order to have it in correct order in plots
churnNN$Income_Category <- ordered(churnNN$Income_Category, levels = c("Less than $40K", "$40K - $60K", "$60K - $80K", "$80K - $120K", "$120K +"))
churnNN$Education_Level <- ordered(churnNN$Education_Level, levels = c("Uneducated", "High School", "College", "Graduate","Post-Graduate",  "Doctorate"))


# We can also use the `facet_wrap` function to split plot into multiple subplots:
ggplot(data = churnNN, aes(x = Customer_Age, y = Total_Trans_Amt)) +
  geom_point() +
  geom_smooth() +
  facet_wrap(~Education_Level)


churnNN$Customer_Age_Ordered <- case_when(churnNN$Customer_Age > 60 ~ '60+',
                                          between(churnNN$Customer_Age, 20, 30 ) ~ '20-30',
                                          between(churnNN$Customer_Age, 31, 40 ) ~ '31-40',
                                          between(churnNN$Customer_Age, 41, 50 ) ~ '41-50',
                                          between(churnNN$Customer_Age, 51, 60 ) ~ '51-60',
)


#Can'in yeri
##Dropdown
### Burasi server kodu koydugum yer umarim dogrudur. But did not work.





