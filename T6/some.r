library(jsonlite)
library(leaflet)


url_str <- "https://developers.onemap.sg/commonapi/search?searchVal=jalan&returnGeom=Y&getAddrDetails=Y&pageNum=1"

URL <- paste0(url_str)


json <- fromJSON(URL)



results <- json$results
addresses <- json$results$ADDRESS
qty_addresses <- length(addresses)


result_0 <- json$results[1]

