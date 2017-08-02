################ ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ ##################
##                                                                            ##
##                      MSDR - Capstone Project NOAA                          ##
##                                 testthat                                   ##
##                                                                            ##
##                              Marco R. Morales                              ##
##                                                                            ##
##                                                                            ##
## created: 02.08.2017                                last update: 02.08.2017 ##
################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################

context("GEOM Timeline Label")


df_clean <- eq_clean_data()

obj_out <- df_clean %>% dplyr::filter(COUNTRY %in% c('USA', 'PERU')) %>%
        dplyr::filter(date > '2000-01-01') %>%
        ggplot() +
        geom_timeline(aes(x = date, y = COUNTRY, color = TOTAL_DEATHS,
                          size = EQ_PRIMARY)) +
        geom_timeline_label(aes(x = date,
                                y = COUNTRY,
                                magnitude = EQ_PRIMARY,
                                label = LOCATION_NAME,
                                n_max = 2))


test_that("MMORALES: Is GEOM_Timeline + GEOM_Timeline_Label functions TOGETHER giving back ggplot object (??)", {


        expect_s3_class(obj_out, 'ggplot')

})



