#' Get continuous palette by package and name
#'
#' Available package/palette combinations are available in the data.frame
#' \code{\link[paletteer]{palettes_c_names}}. Both `package` and `palette` can
#' be supplied as symbols or strings.
#'
#' @param package Name of package from which the palette is desired as string
#' or symbol.
#' @param palette Name of palette as string or symbol.
#' @param n Number of colors desired. If omitted, returns complete palette.
#' @param direction Either `1` or `-1`. If `-1` the palette will be reversed.
#' @return A vector of colors.
#' @examples
#' paletteer_c(jcolors, pal10, 10)
#' paletteer_c(scico, berlin, 100)
#' @export
paletteer_c <- function(package, palette, n, direction = 1) {

  if (abs(direction) != 1) {
    stop("direction must be 1 or -1")
  }

  package <- rlang::quo_name(rlang::enquo(package))
  palette <- rlang::quo_name(rlang::enquo(palette))

  gen_fun <- wrapper_c[[package]]

  out <- gen_fun(name = palette, n = n)

  if (direction == -1) {
    rev(out)
  } else {
    out
  }
}
