#' Get continuous palette by package and name
#'
#' @param package Name of package from which the palette is desired.
#' @param name Name of palette.
#' @param n Number of colors desired. If omitted, returns complete palette.
#' @return A vector of colors.
#' @examples
#' paletteer_c(jcolors, pal10, 10)
#' paletteer_c(scico, berlin, 100)
#' @export
paletteer_c <- function(package, name, n) {
  package <- rlang::quo_name(rlang::enquo(package))
  name <- rlang::quo_name(rlang::enquo(name))

  objs <- mget(ls("package:paletteer"), inherits = TRUE)
  gen_fun <- get(paste0("paletteer_c_", package), objs)

  gen_fun(name = name, n = n)
}
