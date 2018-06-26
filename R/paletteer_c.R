#' Get continuous palette by package and name
#'
#' @param package Name of package from which the palette is desired.
#' @param palette Name of palette.
#' @param n Number of colors desired. If omitted, returns complete palette.
#' @param scale Toggles quotation, defaults to FALSE.
#' @param direction Either `1` or `-1`. If `-1` the palette will be reversed.
#' @return A vector of colors.
#' @examples
#' paletteer_c(jcolors, pal10, 10)
#' paletteer_c(scico, berlin, 100)
#' @export
paletteer_c <- function(package, palette, n, direction = 1, scale = FALSE) {

  if (abs(direction) != 1) {
    stop("direction must be 1 or -1")
  }

  if (!scale) {
    package <- rlang::quo_name(rlang::enquo(package))
    palette <- rlang::quo_name(rlang::enquo(palette))
  }

  objs <- mget(ls("package:paletteer"), inherits = TRUE)
  gen_fun <- get(paste0("paletteer_c_", package), objs)

  out <- gen_fun(name = palette, n = n)

  if (direction == -1) {
    rev(out)
  } else {
    out
  }
}
