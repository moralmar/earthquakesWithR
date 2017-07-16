################ ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ ##################
##                                                                            ##
##                      MSDR - Capstone Project NOAA                          ##
##                           Leaflet - Week 3                                 ##
##                                                                            ##
##                              Marco R. Morales                              ##
##                                                                            ##
##                                                                            ##
## created: 15.07.2017                                last update: 15.07.2017 ##
################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################


# https://rstudio.github.io/leaflet/


# http://www.digital-geography.com/category/leaflet-js/#.WWp1kOlpyLk


# https://stackoverflow.com/questions/29118059/display-spatialpolygonsdataframe-on-leaflet-map-with-r
# library(rgdal)
# library(leaflet)
#
# download.file(file.path('http://www.naturalearthdata.com/http/',
#                         'www.naturalearthdata.com/download/50m/cultural',
#                         'ne_50m_admin_0_countries.zip'),
#               # f <- tempfile())
#                 "./inst/extdata/ne_50m_admin_0_countries.zip")
# unzip("./inst/extdata/ne_50m_admin_0_countries.zip", exdir = "./inst/extdata")
#
# world <- readOGR("./inst/extdata", 'ne_50m_admin_0_countries', encoding='UTF-8')
#
# commonwealth <- c("Antigua and Barb.", "Australia", "Bahamas", "Bangladesh",
#                   "Barbados", "Belize", "Botswana", "Brunei", "Cameroon", "Canada", "Cyprus",
#                   "Dominica", "Fiji", "Ghana", "Grenada", "Guyana", "India", "Jamaica", "Kenya",
#                   "Kiribati", "Lesotho", "Malawi", "Malaysia", "Maldives", "Malta", "Mauritius",
#                   "Mozambique", "Namibia", "Nauru", "New Zealand", "Nigeria", "Pakistan", "Papua
#                   New Guinea", "Rwanda", "St. Kitts and Nevis", "Saint Lucia", "St. Vin. and
#                   Gren.", "Samoa", "Seychelles", "Sierra Leone", "Singapore", "Solomon Is.",
#                   "South Africa", "Sri Lanka", "Swaziland", "Tanzania", "Tonga", "Trinidad and
#                   Tobago", "Tuvalu", "Uganda", "United Kingdom", "Vanuatu", "Zamibia")
#
# leaflet() %>% addTiles() %>%
#         addPolygons(data=subset(world, name %in% commonwealth), weight=2)
#
#



