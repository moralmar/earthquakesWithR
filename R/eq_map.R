################ ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ ##################
##                                                                            ##
##                      MSDR - Capstone Project NOAA                          ##
##                           eq_map() - Week 3                                ##
##                                                                            ##
##                              Marco R. Morales                              ##
##                                                                            ##
##                                                                            ##
## created: 15.07.2017                                last update: 17.07.2017 ##
################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################

# source("./R/eq_clean_data.R")
# require(magrittr)
# require(leaflet)
# require(readr) # required for the fcn: eq_clean_data()
# require(htmltools)

#' Visualization of Earth Quakes
#'
#' \code{eq_map} creates a Leaflet map, adds a polygon according to the chosen
#' country and adds the earthquakes as points (size according to magnitude)
#'
#' @param data_filtered A dataframe
#' @param annot_col Which column shall be displayed in the pop-up
#'
#' @importFrom rgdal readOGR
#' @importFrom magrittr "%>%"
#' @importFrom dplyr mutate_
#' @importFrom leaflet leaflet addTiles addProviderTiles addPolygons addCircleMarkers
#' @importFrom stringr str_to_title
#'
#' @return this function gives back a leaflet map. It includes various features.
#'
#' @examples
#' require(magrittr)
#' data("NOAAearthquakes")
#'
#' map_ex <- NOAAearthquakes %>%
#' dplyr::filter(COUNTRY == "MEXICO" & lubridate::year(date) >= 2000) %>%
#' eq_map(annot_col = "date")
#' map_ex
#'
#' @export
eq_map <- function(data_filtered, annot_col = "date") {

        # for: downloading each time / (in temp folder)
        #
        # utils::download.file(base::file.path('http://www.naturalearthdata.com/http/',
        #                         'www.naturalearthdata.com/download/50m/cultural',
        #                         'ne_50m_admin_0_countries.zip'),
        #               f <- tempfile())
        # utils::unzip(f, exdir=tempdir())
        # world <- rgdal::readOGR(tempdir(), 'ne_50m_admin_0_countries', encoding='UTF-8')


        # for: downloading file into 010_data folder
        # download.file(file.path('http://www.naturalearthdata.com/http/',
        #                         'www.naturalearthdata.com/download/50m/cultural',
        #                         'ne_50m_admin_0_countries.zip'),
        #                  "./inst/extdata/ne_50m_admin_0_countries.zip")
        # unzip("./inst/extdata/ne_50m_admin_0_countries.zip", exdir = "./inst/extdata")
        #
        # world <- readOGR("./inst/extdata", 'ne_50m_admin_0_countries', encoding='UTF-8')


        # world <- rgdal::readOGR("./inst/extdata", 'ne_50m_admin_0_countries', encoding='UTF-8')

        data(world)
        involved_countries <- base::unique(data_filtered$COUNTRY)

        data_filtered <- data_filtered %>%
                dplyr::mutate_(popup_col = base::as.name(annot_col))

        m <- leaflet::leaflet(data_filtered) %>%
                leaflet::addTiles() %>%
                leaflet::addProviderTiles("OpenMapSurfer.Roads") %>%  # OpenTopoMap
                leaflet::addPolygons(data = base::subset(world, name %in% stringr::str_to_title(involved_countries)),
                            weight = 2,
                            opacity = 0.8,
                            fillOpacity = 0.3,
                            fillColor = "red") %>%
                leaflet::addCircleMarkers(
                        lng = ~LONGITUDE,
                        lat = ~LATITUDE,
                        radius = ~EQ_PRIMARY^1.4, # 1.4: scale factor; only for visual effects
                        weight = 3,
                        color = c('maroon'),  # maroon purple
                        # label = ~htmltools::HTML(popup_col),
                        label = ~base::as.character(EQ_PRIMARY),
                        # to do:
                        #     I didn't manage this
                        #     label = ~htmltools::HTML(popup_col),
                        #     meaning:
                        #     the label shows the same information as the popup
                        #     Problem was: label showed the whole popup_col vector
                        popup = ~base::as.character(popup_col)
                )
        m
} # END eq_map




# good reading: https://rstudio.github.io/leaflet/popups.html

#' Creates Labes for the leaflet map
#'
#' \code{eq_map} creates a string / character combining some information to display
#' in the pop-up
#'
#' @param data This data frame is the whole earth quake data
#'
#' @return this function gives back a vector with character strings
#'
#' @examples
#' require(magrittr)
#' data("NOAAearthquakes")
#'
#' map_example <- NOAAearthquakes %>%
#' dplyr::filter(COUNTRY == "MEXICO" & lubridate::year(date) >= 2000) %>%
#' dplyr::mutate(popup_text = eq_create_label(.)) %>%
#' eq_map(annot_col = "popup_text")
#' map_example
#'
#' @export
eq_create_label <- function(data) {

        txt <- base::paste0("<b>Country: </b>", data$COUNTRY, "<br/>",
                            "<b>Location: </b>", data$LOCATION_NAME,  "<br/>",
                            "<b>Magnitude: </b>", data$EQ_PRIMARY,  "<br/>",
                            "<b>Total Deaths: </b>", data$TOTAL_DEATHS, "<br/>",
                            "<b>Date: </b>", data$date)
} # END eq_create_label


