# code for: package set up

# 1)) ----------------------------------------------------------
require(devtools)
# 2) ----------------------------------------------------------
# Update the documentation
#     This returns nothing when it’s good. Iterate between check_man()
#     and document() to fix all errors.
devtools::document()
devtools::load_all()
devtools::check_man()


# 3) ----------------------------------------------------------
# adds folder "vignettes"
#     creates "vignette_intro.rmd"
#     (!!) use this only ONCE (or else it overwrites)
use_vignette("vignette_intro.rmd")


# 4) ----------------------------------------------------------
# I'd like to use a rmd README
#     (!!) use this only ONCE (or else it overwrites)
devtools::use_readme_rmd()

# 5) ----------------------------------------------------------
# load locally the package
devtools::load_all()


# 5.1) ----------------------------------------------------------
# I have problems with dplyr (..."i can't find dplyr"...)
# solution:
# install dplyr newly (install.package())
# require dplyr
# devtools::use_package("dplyr")
# read here:
# http://www.jiddualexander.com/blog/r-package-building/


# 5.2) ----------------------------------------------------------
?geom_timeline
?geom_timeline_label
?eq_clean_data
?eq_map


# 6) ----------------------------------------------------------
# source("./R/eq_clean_data.R")...NO
# package is loaded...therefore use function without sourcing before
#
NOAAearthquakes <- eq_clean_data()
use_data(NOAAearthquakes)





# 7) Check ------------------------------------------------------
devtools::document()
devtools::load_all()
devtools::check()

# 8) testthat  --------------------------------------------------
devtools::use_testthat()        # page 82 // addes directory
                                # addes field in DESCRIPTION
                                # (!!) use once

# 14) Travis  ---------------------------------------------------
devtools::use_travis()  # (!!) use once - gives yaml file



