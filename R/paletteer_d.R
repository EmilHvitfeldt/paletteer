#' Get discrete palette by package and name
#'
#' Available package/palette combinations are available in the data.frame
#' \code{\link[paletteer]{palettes_d_names}}. Both `package` and `palette`
#' can be supplied as symbols or strings.
#'
#' @param package Name of package from which the palette is desired as string
#' or symbol.
#' @param palette Name of palette as string or symbol.
#' @param n Number of colors desired. If omitted, returns complete palette.
#' @param direction Either `1` or `-1`. If `-1` the palette will be reversed.
#' @param type Either "discrete" or "continuous". Colors are interpolated if
#'   "continuous" is picked. Defaults to "discrete".
#' @param scale Toggles quotation, defaults to FALSE.
#' @return A vector of colors.
#' @examples
#' paletteer_d("nord", "frost")
#' paletteer_d("wesanderson", "Royal1", 3)
#' paletteer_d("Redmonder", "dPBIPuOr", 14, type = "continuous")
#' @export
paletteer_d <- function (package, palette, n, direction = 1,
                         type = c("discrete", "continuous"), scale = FALSE) {

  if (abs(direction) != 1) {
    stop("direction must be 1 or -1")
  }

  if (!scale) {
    package <- rlang::quo_name(rlang::enquo(package))
    palette <- rlang::quo_name(rlang::enquo(palette))
  }

  type <- match.arg(type)
  pal <- paletteer::palettes_d[[c(package, palette)]]
  if (is.null(pal))
    stop("Palette not found. Make sure both package and palette name are spelled correct.")
  if (missing(n)) {
    n <- length(pal)
  }
  if (type == "discrete" && n > length(pal)) {
    stop(paste("Number of requested colors greater than this palette can offer which is ",
               length(pal), ".", sep = ""))
  }
  out <- switch(type,
                continuous = (grDevices::colorRampPalette(pal))(n),
                discrete = pal[1:n])

  if (direction == -1) {
    rev(out)
  } else {
    out
  }
}
