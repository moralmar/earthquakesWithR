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

context('clean data')

# load quakes from package
df <- NOAAearthquakes

test_that('is cleaning function working properly', {

        df_clean <- eq_clean_data()

        expect_equal(ncol(df), ncol(df_clean))
        expect_equal(nrow(df), nrow(df_clean))
        expect_is(df_clean$date, "Date")
        expect_is(df_clean$LATITUDE, "numeric")
        expect_is(df_clean$LONGITUDE, "numeric")
        expect_is(df_clean$DEATHS, "integer")   # you could reformat the column into numeric, theoretically.
                                                # But I kept it. Does 3.5 deaths make sense?
        expect_is(df_clean$EQ_PRIMARY, "numeric")

})



