# code for: package set up

# 1)) ----------------------------------------------------------
require(devtools)

# 2) ----------------------------------------------------------
# to update the documentation
devtools::document()
# You can check the documentation with check_man().
# This returns nothing when it’s good. Iterate between check_man()
# and document() to fix all errors.
devtools::load_all()
devtools::check_man()

# 3) ) ----------------------------------------------------------
# use_vignette("vignette_intro.rmd")
#     adds folder "vignettes"
#     creates "vignette_intro.rmd"

# 4) ) ----------------------------------------------------------
# I'd like to use a rmd README
devtools::use_readme_rmd()

# 5) ) ----------------------------------------------------------
# load locally the package
devtools::load_all()


# 5.1) ) ----------------------------------------------------------
# I have problems with dplyr (..."i can't find dplyr"...)
# solution:
# install dplyr newly (install.package())
# require dplyr
# devtools::use_package("dplyr")
# read here:
# http://www.jiddualexander.com/blog/r-package-building/



# 6) ) ----------------------------------------------------------
# source("./R/eq_clean_data.R")...NO
# package is loaded...therefore use function without sourcing before
#
NOAAearthquakes <- eq_clean_data()
use_data(NOAAearthquakes)



check()



#-----------------------------------------------------

# source("./R/eq_clean_data.R")
# require(magrittr)
# require(leaflet)
# require(readr) # required for the fcn: eq_clean_data()
# require(htmltools)

# source....

# EASY & WORKS
# eq_clean_data() %>%
#         dplyr::filter(COUNTRY == "MEXICO" & lubridate::year(date) >= 2000) %>%
#         eq_map(annot_col = "date")
#
#
# eq_clean_data() %>%
#         dplyr::filter(COUNTRY == "MEXICO" & lubridate::year(date) >= 2000) %>%
#         dplyr::mutate(popup_text = eq_create_label(.)) %>%
#
#         eq_map(annot_col = "popup_text")
