#' Get dynamic palette by package and name
#'
#' Avaliable package/palette combinations are avaliable in the data.frame
#' \code{\link[paletteer]{palettes_dynamic_names}}. Both `package` and `palette` can
#' be supplied as symbols or strings.
#'
#' @param package Name of package from which the palette is desired as string
#' or symbol.
#' @param palette Name of palette as string or symbol.
#' @param n Number of colors desired. If omitted, returns complete palette.
#' @param direction Either `1` or `-1`. If `-1` the palette will be reversed.
#' @return A vector of colors.
#' @examples
#' paletteer_dynamic("ggthemes_solarized", "green", 8)
#' paletteer_dynamic("cartography", "sand.pal", 20)
#' @export
paletteer_dynamic <- function (package, palette, n, direction = 1) {

  if (abs(direction) != 1) {
    stop("direction must be 1 or -1")
  }


  package <- rlang::quo_name(rlang::enquo(package))
  palette <- rlang::quo_name(rlang::enquo(palette))
  if (missing(n)) {
    stop("n not found. Please supply the number of colors you want returned.")
  }

  pal <- paletteer::palettes_dynamic[[c(package, palette)]]
  if (is.null(pal))
    stop("Palette not found. Make sure both package and palette name are spelled correct.")

  if (n > length(pal)) {
    stop(paste("Number of requested colors greater than this palette can offer which is ",
               length(pal), ".", sep = ""))
  }

  if (direction == -1) {
    rev(pal[[n]])
  } else {
    pal[[n]]
  }
}
