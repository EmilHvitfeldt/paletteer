#' Get discrete palette by package and name
#'
#' @param package Name of package from which the palette is desired.
#' @param palette Name of palette.
#' @param n Number of colors desired. If omitted, returns complete palette.
#' @param type Either "discrete" or "continuous". Colors are interpolated if
#'   "continuous" is picked. Defaults to "discrete".
#' @return A vector of colors.
#' @examples
#' paletteer_d("nord", "frost")
#' paletteer_d("wesanderson", "Royal1", 3)
#' paletteer_d("Redmonder", "dPBIPuOr", 14, "continuous")
#' @export
paletteer_d <- function (package, palette, n, type = c("discrete", "continuous")) {
  package <- rlang::quo_name(rlang::enquo(package))
  palette <- rlang::quo_name(rlang::enquo(palette))

  type <- match.arg(type)
  pal <- palettes_discrete[[c(package, palette)]]
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
  out
}
