#' shinyfishies
#'
#' This Shiny App displays a histogram of the DDT data set
#'
#' @return An unispiring histogram...
#' @export
#'
#' @importFrom shiny runApp
#'
#' @examples \dontrun{shinyfishies()}
shinyfishies <- function() {
  runApp(system.file("shinyfishies",
                     package = "MATH4753ROSAlab11"),
         launch.browser = TRUE)
}
