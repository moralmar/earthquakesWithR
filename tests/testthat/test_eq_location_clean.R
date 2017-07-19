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

context('Location Clean Function')

# load data from package
df <- NOAAearthquakes
df_clean <- eq_location_clean(df)

test_that('MMORALES:Is eq_location_clean(data) function working properly (??)', {


        expect_is(df_clean$LOCATION_NAME, 'character')

        # is it in title case?
        expect_equal(df_clean$LOCATION_NAME,
                     df_clean$LOCATION_NAME %>%  # transform first to lower then title
                             stringr::str_to_lower() %>%
                             stringr::str_to_title())
})



