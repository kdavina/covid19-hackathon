# A script to pull live-updated covid cases and deaths as maintained by the Center for Systems Science and Engineering at the John Hopkins University
# https://www.arcgis.com/home/item.html?id=628578697fb24d8ea4c32fa0c5ae1843
# Modified from tutorial https://medium.com/@traffordDataLab/querying-apis-in-r-39029b73d5f1

library(tidyverse); library(httr); library(jsonlite)
path <- "https://services1.arcgis.com/0MSEUqKaxRlEPj5g/ArcGIS/rest/services/ncov_cases_US/FeatureServer/0/query"
request <- GET(url = path,
                query = list(
                    f = "json",
                    where = '1=1',
                    outSr = 4326,
                    #outFields = "Province_State, Last_Update, Confirmed, Deaths, FIPS, Combined_Key" 
                    outFields = "Confirmed, Deaths, FIPS"   
                )
            )
print(request$status_code)
response <- content(request, as = "text", encoding = "UTF-8")