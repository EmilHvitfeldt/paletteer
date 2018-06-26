#' Get continuous palette by package and name
#'
#' @param package Name of package from which the palette is desired.
#' @param palette Name of palette.
#' @param n Number of colors desired. If omitted, returns complete palette.
#' @return A vector of colors.
#' @examples
#' paletteer_c(jcolors, pal10, 10)
#' paletteer_c(scico, berlin, 100)
#' @export
paletteer_c <- function(package, palette, n) {
  if(!is.character(package)) {
    package <- rlang::quo_name(rlang::enquo(package))
  }
  if(!is.character(palette)) {
    palette <- rlang::quo_name(rlang::enquo(palette))
  }
  objs <- mget(ls("package:paletteer"), inherits = TRUE)
  gen_fun <- get(paste0("paletteer_c_", package), objs)

  gen_fun(name = palette, n = n)
}
