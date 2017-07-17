################ ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ ##################
##                                                                            ##
##                      MSDR - Capstone Project NOAA                          ##
##                             geom_timeline()                                ##
##                                                                            ##
##                              Marco R. Morales                              ##
##                                                                            ##
##                                                                            ##
## created: 15.07.2017                                last update: 15.07.2017 ##
################# ~~~~~~~~~~~~~~~~~ ######## ~~~~~~~~~~~~~~~~~ #################



## function: geom_timeline (building the layer)  --------------------------------
##     quite generic
##     builds the layer based on the geom specifications
##     geom specification is defined in the next function
##     next function is:

#' Function which builts the layer for the ggplot
#' @importFrom ggplot2 layer
#'
#' @param mapping See \code{ggplot2} \code{\link[ggplot2]{layer}}
#' @param data See \code{ggplot2} \code{\link[ggplot2]{layer}}
#' @param stat See \code{ggplot2} \code{\link[ggplot2]{layer}}
#' @param position See \code{ggplot2} \code{\link[ggplot2]{layer}}
#' @param na.rm See \code{ggplot2} \code{\link[ggplot2]{layer}}
#' @param show.legend See \code{ggplot2} \code{\link[ggplot2]{layer}}
#' @param inherit.aes See \code{ggplot2} \code{\link[ggplot2]{layer}}
#' @param ... other arguments passed on to \code{\link[ggplot2]{layer}}
#'
#' @export
geom_timeline <- function(mapping = NULL, data = NULL, stat = "identity",
                           position = "identity", na.rm = FALSE,
                           show.legend = NA, inherit.aes = TRUE, ...) {
        ggplot2::layer(
                geom = geom_timeline_proto_class, # this here is important
                mapping = mapping,
                data = data, stat = stat, position = position,
                show.legend = show.legend, inherit.aes = inherit.aes,
                params = list(na.rm = na.rm, ...)
        ) # END layer
} # END geom_timeline function





## function: draw_panel_function  ------------------------------------------------
##     function within ggproto
##     I outsourced due to its length & it looks nicer

#' Outsourced function which builts the plot
#'
#' @importFrom ggplot2 ggproto
#' @importFrom grid pointsGrob gpar
#' @param data earth quake data set
#' @param panel_scales I don't know what that is
#' @param coord transformed data set
#'
#' @export
draw_panel_function <- function(data, panel_scales, coord) {

        ## Transform the data first
        ##     see book chapter 4.7.2
        ##     (this is rather generic)
        coords <- coord$transform(data, panel_scales)

        # resizing the oints
        coords$size <- coords$size / base::max(coords$size) * 1.3

        base::cat("==================================== coords ====================================\n")
        base::cat("================================================================================ \n\n")
        base::print(base::head(coords))
        base::cat("...\n")
        base::print(base::tail(coords))
        base::cat("=================================================================================== \n\n")


        grid::pointsGrob(
                x = coords$x,
                y = coords$y,
                pch = coords$shape,
                gp = grid::gpar(
                        col = coords$colour,
                        alpha = coords$alpha,
                        cex = coords$size
                ) # END gpar
        ) # END pointsGrob
} # END draw_panel_function






## function: geom_timeline_proto_class ---------------------------------------------
##     ggproto() creates new class corresponding to new geom (geom_timeline)
##     Chapter 4.7.1 in the book: building a geoms
##

#' Function creates the new geom (geom_timeline)
#' draw_panel_function is outsourced...looks nicer
#'
#' @format NULL
#' @usage NULL
#' @export
geom_timeline_proto_class <- ggplot2::ggproto("geom_timeline_proto_class", ggplot2::Geom,

                                          # required_aes = <a character vector of required aesthetics>,
                                          # default_aes = aes(<default values for certain aesthetics>),
                                          # draw_key = <a function used to draw the key in the legend>,
                                          # draw_panel = function(data, panel_scales, coord) {
                                          #         ## Function that returns a grid grob that will
                                          #         ## be plotted (this is where the real work occurs)
                                          # }

                                          required_aes = c("x"),
                                          default_aes = ggplot2::aes(y = 0,
                                                                     fill = NA,
                                                                     colour = "grey3",
                                                                     alpha = 0.4,
                                                                     shape = 19,

                                                                     stroke = 0.5,
                                                                     # stroke:
                                                                     #     needed, or else it gives error due to
                                                                     #     "fontsize" can't be zero
                                                                     size = 1
                                                                     ),
                                          draw_key = ggplot2::draw_key_point,

                                          ## function: draw_panel_function
                                          ##     is outsourced
                                          ##     due to its length & looks nicer
                                          ##     (!!) draw_panel only takes one colour
                                          ##     (!!) draw_group takes all colours (same shape)
                                          ##          (I used draw_group in the geom_hurricane)
                                          draw_panel = draw_panel_function
                                        ) # END geom_timeline_class ggproto

