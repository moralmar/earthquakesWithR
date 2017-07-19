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

context('Handling NEGATIVE dates')



test_that('MMORALES:Is handle_negative_dates(y,m,d) working properly (??)', {


        expect_is(handle_negative_dates(-2017, 07, 19), "Date")
        expect_is(handle_negative_dates(-1, 01, 1), "Date")

})



