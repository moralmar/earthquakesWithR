################ ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################
##                                                                            ##
##                      MSDR - Capstone Project NOAA                          ##
##                                   Main                                     ##
##                                                                            ##
##                              Marco R. Morales                              ##
##                                                                            ##
##                                                                            ##
## created: 09.07.2017                                last update: 15.07.2017 ##
################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################
#
# rm(list = ls())
# cat("\014")
#
#
# list.files()
# list.files("./inst/extdata")
#
# # packages
# require(readr)
# require(magrittr)
# require(dplyr)
# require(purrr)
# require(stringr)
#
# source("./R/eq_clean_data.R")
#
# data <- eq_clean_data()
#
# require(ggplot2)
# require(ggthemes)
#
# # dataTEST <- data[data$COUNTRY %in% c("USA", "CHINA"), ]
# dataTEST <- data %>%
#         filter(COUNTRY %in% c("USA", "CHINA") & YEAR >= 2000)
#
#
# ggplot(dataTEST, aes(x = date, y = COUNTRY, fill = TOTAL_DEATHS, size = EQ_PRIMARY)) +
#         geom_point(shape = 21, alpha = 0.4) +
#         # shape = 21: it was anyway round. But it removes the color in the legend #nice
#         scale_fill_continuous(low = "green", high = "blue4") +
#         theme_classic() +
#         theme(legend.position = "bottom", legend.direction = "horizontal",
#               axis.line.y = element_blank()) +
#         labs(size = "EQ_PRIMARY dingsda", fill = "TOTAL_DEATHS dingsda ")
#
# # sessionInfo()
#
# #-----
# source("./R/geom_timeline.R")
# source("./R/geom_timeline_label.R")
# ggplot() +
#         geom_timeline(data = dataTEST, aes(x = date, y = COUNTRY, color = TOTAL_DEATHS, size = EQ_PRIMARY)) +
#         geom_timeline_label(data = dataTEST, aes(x = date,
#                                                  y = COUNTRY,
#                                                  magnitude = EQ_PRIMARY,
#                                                  label = LOCATION_NAME,
#                                                  n_max = 8)) +
#         theme_classic()
#
#
#
#

