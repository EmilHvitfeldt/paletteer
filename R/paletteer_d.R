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
#' @inheritParams rlang::args_error_context
#'
#' @return A vector of colors.
#' @examples
#' paletteer_d("nord::frost")
#' paletteer_d("wesanderson::Royal1", 3)
#' paletteer_d("Redmonder::dPBIPuOr", 14, type = "continuous")
#' @export
paletteer_d <- function(
  palette,
  n,
  direction = 1,
  type = c("discrete", "continuous"),
  call = caller_env(0)
) {
  check_direction(direction, call = call)
  type <- match.arg(type)

  palette <- try(palette, silent = TRUE)
  if (inherits(palette, "try-error")) {
    palette <- attr(palette, "condition")$message
    palette <- sub("^.*?\"", "", palette)
    palette <- sub("\".*$", "", palette)
  }

  check_palette(palette, d_names)

  palette <- unlist(strsplit(palette, "::"))

  pal <- paletteer::palettes_d[[palette]]

  if (missing(n)) {
    n <- length(pal)
  }
  if (type == "discrete") {
    check_number_whole(n, min = 1, max = as.double(length(pal)), call = call)
  }

  out <- switch(
    type,
    continuous = (grDevices::colorRampPalette(pal))(n),
    discrete = pal[1:n]
  )

  if (direction == -1) {
    prismatic::color(rev(out))
  } else {
    prismatic::color(out)
  }
}
