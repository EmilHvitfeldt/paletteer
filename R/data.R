#' Complete list of fixed discrete palettes
#'
#' A list of all the discrete palettes of fixed lengths included in this
#' package. Structured as a list of lists with the first level being each
#' package and the second level being the palettes available in that package.
#'
#' Contains palettes from the following packages: awtools, dichromat,
#' dutchmasters, ggsci, ggpomological, ggthemes, ghibli, grDevices, jcolors,
#' LaCroixColoR, NineteenEightyR, nord, ochRe, pals, Polychrome, quickpalette,
#' rcartocolor, RColorBrewer, Redmonder, RSkittleBrewer, wesanderson and yarrr.
#'
#' data.frame of palette names can be found here \code{\link{palettes_d_names}}.
#'
#' @format A list of 22 lists.
"palettes_d"

#' Names of all fixed discrete palettes
#'
#' A data.frame of the names and lengths of the discrete palettes of fixed
#' lengths included in this package.
#'
#' Contains palettes names from the following packages: awtools, dichromat,
#' dutchmasters, ggsci, ggpomological, ggthemes, ghibli, grDevices, jcolors,
#' LaCroixColoR, NineteenEightyR, nord, ochRe, pals, Polychrome, quickpalette,
#' rcartocolor, RColorBrewer, Redmonder, RSkittleBrewer, wesanderson and yarrr.
#'
#' Full list of palette can be found here \code{\link{palettes_d}}.
#'
#' @format A data.frame of 396 observations with 3 variables:
#' \describe{
#'   \item{package}{character, name of package}
#'   \item{palette}{character, name of palette}
#'   \item{length}{integer, number of colors in palette}
#' }
"palettes_d_names"

#' Complete list of dynamic palettes
#'
#' A list of all the dynamic palettes included in this package. Structured as
#' a list of lists with the first level being each package and the second level
#' being the palettes avaliable in that package, and the third level being the
#' palettes for various lengths.
#'
#' Contains palettes from the following packages: cartography and ggthemes.
#'
#' Full list of palette names can be found here \code{\link{palettes_dynamic_names}}.
#'
#' @format A list of 3 lists.
"palettes_dynamic"

#' Names of all fixed discrete palettes
#'
#' A data.frame of the names and lengths of the dynamic palettes included in
#' this package.
#'
#' Contains palettes from the following packages: cartography and ggthemes.
#'
#' Full list of palette can be found here \code{\link{palettes_dynamic}}.
#'
#' @format A data.frame of 25 observations with 3 variables:
#' \describe{
#'   \item{package}{character, name of package}
#'   \item{palette}{character, name of palette}
#'   \item{length}{integer, maximal number of colors in palette}
#' }
"palettes_dynamic_names"

#' Names of all continuous palettes
#'
#' A data.frame of the names and lengths of the continuous palettes included in
#' this package.
#'
#' Contains palettes names from the following packages: ggthemes, grDevices,
#' jcolors, oompaBase, palr, pals, scico and viridis.
#'
#' @format A data.frame of 156 observations with 2 variables:
#' \describe{
#'   \item{package}{character, name of package}
#'   \item{palette}{character, name of palette}
#' }
"palettes_c_names"
