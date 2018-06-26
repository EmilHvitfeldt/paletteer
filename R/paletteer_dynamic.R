#' Get dynamic palette by package and name
#'
#' @param package Name of package from which the palette is desired.
#' @param name Name of palette.
#' @param n Number of colors desired. If omitted, returns complete palette.
#' @param scale Toggles quotation, defaults to FALSE.
#' @return A vector of colors.
#' @examples
#' paletteer_dynamic("ggthemes_solarized", "green", 8)
#' paletteer_dynamic("cartography", "sand.pal", 20)
#' @export
paletteer_dynamic <- function (package, palette, n, scale = FALSE) {

  if (!scale) {
    package <- rlang::quo_name(rlang::enquo(package))
    palette <- rlang::quo_name(rlang::enquo(palette))
    if (missing(n)) {
      stop("n not found. Please supply the number of colors you want returned.")
    }
  }

  pal <- palettes_dynamic[[c(package, palette)]]
  if (is.null(pal))
    stop("Palette not found. Make sure both package and palette name are spelled correct.")

  if (n > length(pal)) {
    stop(paste("Number of requested colors greater than this palette can offer which is ",
               length(pal), ".", sep = ""))
  }
  pal[[n]]
}
