#' Get discrete palette by package and name
#'
#' Available package/palette combinations are available in the data.frame
#' \code{\link[paletteer]{palettes_d_names}}.
#'
#' @param palette Name of palette as a string. Must be on the form
#' packagename::palettename.
#' @param n Number of colors desired. If omitted, returns complete palette.
#' @param direction Either `1` or `-1`. If `-1` the palette will be reversed.
#' @param type Either "discrete" or "continuous". Colors are interpolated if
#'   "continuous" is picked. Defaults to "discrete".
#' @return A vector of colors.
#' @examples
#' paletteer_d("nord::frost")
#' paletteer_d("wesanderson::Royal1", 3)
#' paletteer_d("Redmonder::dPBIPuOr", 14, type = "continuous")
#' @export
paletteer_d <- function (palette, n, direction = 1,
                         type = c("discrete", "continuous")) {

  if (abs(direction) != 1) {
    stop("direction must be 1 or -1")
  }

  type <- match.arg(type)

  palette <- unlist(strsplit(palette, "::"))

  pal <- paletteer::palettes_d[[palette]]
  if (is.null(pal))
    stop('Palette not found. Make sure both package and palette ',
         'name are spelled correct in the format "package::palette"')
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
    prismatic::color(rev(out))
  } else {
    prismatic::color(out)
  }
}
