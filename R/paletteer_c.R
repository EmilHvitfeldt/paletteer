#' Get continuous palette by package and name
#'
#' Available package/palette combinations are available in the data.frame
#' \code{\link[paletteer]{palettes_c_names}}. Both `package` and `palette` can
#' be supplied as symbols or strings.
#'
#' @param palette Name of palette as string or symbol. Must be on the form
#' packagename::palettename.
#' @param n Number of colors desired. If omitted, returns complete palette.
#' @param direction Either `1` or `-1`. If `-1` the palette will be reversed.
#' @return A vector of colors.
#' @examples
#' paletteer_c("scico::berlin", 100)
#' paletteer_c(`scico::berlin`, 100)
#' @export
paletteer_c <- function(palette, n, direction = 1) {

  if (abs(direction) != 1) {
    stop("direction must be 1 or -1")
  }

  palette <- rlang::quo_name(rlang::enquo(palette))

  if (!(palette %in% c_names)) {
    stop("Palette not found. Make sure the palette name are spelled correct.")
  }

  palette <- unlist(strsplit(palette, "::"))

  gen_fun <- wrapper_c[[palette[1]]]

  out <- gen_fun(name = palette[2], n = n)

  if (direction == -1) {
    rev(out)
  } else {
    out
  }
}
