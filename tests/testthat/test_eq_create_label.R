################ ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ ##################
##                                                                            ##
##                      MSDR - Capstone Project NOAA                          ##
##                                 testthat                                   ##
##                                                                            ##
##                              Marco R. Morales                              ##
##                                                                            ##
##                                                                            ##
## created: 05.08.2017                                last update: 05.08.2017 ##
################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################

context("MMORALES: Checking Labels in Leaflet Map")


df_clean <- eq_clean_data()

obj_out <- df_clean %>%
        dplyr::filter(COUNTRY %in% c('USA', 'PERU')) %>%
        dplyr::filter(date > '2000-01-01') %>%
        dplyr::mutate(popup_text = eq_create_label(.))


ncol_df_clean <- ncol(df_clean)
ncol_obj_out <- ncol(obj_out)



test_that("MMORALES: Checking Labels of Leaflet Map (??)", {
        expect_is(obj_out$popup_text, "character")
        expect_equal(ncol_df_clean, ncol_obj_out - 1)
})



