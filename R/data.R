#' Complete list of fixed discrete palettes
#'
#' A list of all the discrete palettes of fixed lengths included in this
#' package. Structured as a list of lists with the first level being each
#' package and the second level being the palettes available in that package.
#'
#' Contains palettes from the following packages:
#' `r paste(sort(names(palettes_d)), collapse = ", ")`.
#'
#' data.frame of palette names can be found here \code{\link{palettes_d_names}}.
#'
#' @format A list of `r length(palettes_d)` lists.
"palettes_d"

#' Data Frame of all fixed discrete palettes
#'
#' A data.frame of the names and other characteristics of the discrete palettes
#' of fixed lengths included in this package.
#'
#' Contains palettes names from the following packages:
#' `r paste(sort(unique(palettes_d_names$package)), collapse = ", ")`.
#'
#' Full list of palette can be found here \code{\link{palettes_d}}.
#'
#' @format A data.frame of `r nrow(palettes_d_names)` observations with 4
#'     variables:
#' \describe{
#'   \item{package}{character, name of package}
#'   \item{palette}{character, name of palette}
#'   \item{length}{integer, number of colors in palette}
#'   \item{type}{character, type of palette}
#' }
"palettes_d_names"

#' Complete list of dynamic palettes
#'
#' A list of all the dynamic palettes included in this package. Structured as
#' a list of lists with the first level being each package and the second level
#' being the palettes available in that package, and the third level being the
#' palettes for various lengths.
#'
#' Contains palettes from the following packages: cartography and ggthemes.
#'
#' Full list of palette names can be found here \code{\link{palettes_dynamic_names}}.
#'
#' @format A list of 3 lists.
"palettes_dynamic"

#' Data Frame of all fixed discrete palettes
#'
#' A data.frame of the names and other characteristics of the dynamic palettes
#' included in this package.
#'
#' Contains palettes from the following packages: cartography and ggthemes.
#'
#' Full list of palette can be found here \code{\link{palettes_dynamic}}.
#'
#' @format A data.frame of `r nrow(palettes_dynamic_names)` observations with
#'     4 variables:
#' \describe{
#'   \item{package}{character, name of package}
#'   \item{palette}{character, name of palette}
#'   \item{length}{integer, maximal number of colors in palette}
#'   \item{type}{character, type of palette}
#'
#' }
"palettes_dynamic_names"

#' Data Frame of all continuous palettes
#'
#' A data.frame of the names and other characteristics of the continuous
#' palettes included in this package.
#'
#' Contains palettes names from the following packages:
#' `r paste(sort(unique(palettes_c_names$package)), collapse = ", ")`.
#'
#' @format A data.frame of `r nrow(palettes_c_names)` observations with 3
#'     variables:
#' \describe{
#'   \item{package}{character, name of package}
#'   \item{palette}{character, name of palette}
#'   \item{type}{character, type of palette}
#' }
"palettes_c_names"

#' Names and version information for all included packages
#'
#' @format A data.frame with `r ncol(paletteer_packages)` variables and
#' `r nrow(paletteer_packages)` rows:
#' \describe{
#'   \item{Names}{character, name of package}
#'   \item{Github}{character, name of Github repository}
#'   \item{github_ver}{character, version number on Github}
#'   \item{CRAN}{logical, is package available on CRAN}
#'   \item{CRAN_ver}{character, version number on CRAN, NA if not on CRAN}
#' }
"paletteer_packages"
