#' Get continuous palette by package and name
#'
#' Available package/palette combinations are available in the data.frame
#' \code{\link[paletteer]{palettes_c_names}}.
#'
#' @param palette Name of palette as a string. Must be on the form
#' packagename::palettename.
#' @param n Number of colors desired. Must be supplied.
#' @param direction Either `1` or `-1`. If `-1` the palette will be reversed.
#' @return A vector of colors.
#' @examplesIf rlang::is_installed("scico")
#' paletteer_c("scico::berlin", 100)
#' @export
paletteer_c <- function(palette, n, direction = 1) {
  if (abs(direction) != 1) {
    cli::cli_abort("{.arg direction} must be 1 or -1, not {direction}.")
  }

  palette <- try(palette, silent = TRUE)
  if (inherits(palette, "try-error")) {
    palette <- attr(palette, "condition")$message
    palette <- sub("^.*?\"", "", palette)
    palette <- sub("\".*$", "", palette)
  }

  check_palette(palette, c_names)

  palette <- unlist(strsplit(palette, "::"))

  gen_fun <- wrapper_c[[palette[1]]]

  out <- gen_fun(name = palette[2], n = n)

  if (direction == -1) {
    prismatic::color(rev(out))
  } else {
    prismatic::color(out)
  }
}
