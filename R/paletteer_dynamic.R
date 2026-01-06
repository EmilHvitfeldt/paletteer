#' Get dynamic palette by package and name
#'
#' Available package/palette combinations are available in the data.frame
#' \code{\link[paletteer]{palettes_dynamic_names}}.
#
#' @param palette Name of palette as a string. Must be on the form
#' packagename::palettename.
#' @param n Number of colors desired. If omitted, returns complete palette.
#' @param direction Either `1` or `-1`. If `-1` the palette will be reversed.
#' @return A vector of colors.
#' @examples
#' paletteer_dynamic("ggthemes_solarized::green", 8)
#' paletteer_dynamic("cartography::sand.pal", 20)
#' @export
paletteer_dynamic <- function(palette, n, direction = 1) {
  check_direction(direction)

  if (missing(n)) {
    cli::cli_abort(
      "{.arg n} not found. Please supply the number of colors you want returned."
    )
  }

  palette <- try(palette, silent = TRUE)
  if (inherits(palette, "try-error")) {
    palette <- attr(palette, "condition")$message
    palette <- sub("^.*?\"", "", palette)
    palette <- sub("\".*$", "", palette)
  }

  check_palette(palette, dym_names)

  palette <- unlist(strsplit(palette, "::"))

  pal <- paletteer::palettes_dynamic[[palette]]

  if (n > length(pal)) {
    cli::cli_abort(
      "Number of requested colors ({n}) greater than this palette can offer 
      ({length(pal)})."
    )
  }

  if (direction == -1) {
    prismatic::color(rev(pal[[n]]))
  } else {
    prismatic::color(pal[[n]])
  }
}
