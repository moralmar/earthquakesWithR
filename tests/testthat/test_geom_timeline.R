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

context("GEOM Timeline")


df_clean <- eq_clean_data()

obj_out <- df_clean %>% dplyr::filter(COUNTRY %in% c('RUSSIA', 'JAPAN')) %>%
        dplyr::filter(date > '2000-01-01') %>%
        ggplot() +
        geom_timeline(aes(x = date, y = COUNTRY, color = TOTAL_DEATHS,
                          size = EQ_PRIMARY))


test_that("MMORALES: Is GEOM Timeline function giving back ggplot object (??)", {


        expect_s3_class(obj_out, 'ggplot')

})



