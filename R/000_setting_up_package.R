


# code for: package set up

require(devtools)

# document()

# next step: roxygen2....create namespace with this package?

# use_vignette("vignette_intro.rmd")
#     adds folder "vignettes"
#     creates "vignette_intro.rmd"







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
