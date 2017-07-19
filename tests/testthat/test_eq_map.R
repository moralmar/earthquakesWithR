################ ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ ##################
##                                                                            ##
##                      MSDR - Capstone Project NOAA                          ##
##                                 testthat                                   ##
##                                                                            ##
##                              Marco R. Morales                              ##
##                                                                            ##
##                                                                            ##
## created: 19.07.2017                                last update: 19.07.2017 ##
################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################

context("Leaflet Map Checking")

df_clean <- eq_clean_data()
obj_out <- df_clean %>%
                dplyr::filter(COUNTRY == 'JAPAN') %>%
                dplyr::filter(lubridate::year(date) >= 2000)



test_that('MMORALES: Is the MAP correct Object (??)', {

        map <- eq_map(obj_out, annot_col = 'date')


        expect_s3_class(map, 'leaflet')
        expect_s3_class(map, 'htmlwidget')
})



