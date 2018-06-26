
pal_pal <- function(package, palette, scale, direction, dynamic) {

  if (dynamic) {
    function(n) {
      paletteer_dynamic(package = package, palette = palette, n = n,
                        direction = direction, scale = scale)
    }
  } else {
    function(n) {
      paletteer_d(package = package, palette = palette, direction = direction,
                  scale = scale)
    }
  }
}

#' Discrete scales to use for ggplot2
#'
#' These functions provide the option to use the discrete and dynamic palettes
#' along with the `ggplot2` package. It goes without saying that it requires
#' `ggplot2` to work.
#'
#' Avaliable package/palette combinations are avaliable in the data.frame
#' \code{\link[paletteer]{palettes_d_names}} and
#' \code{\link[paletteer]{palettes_dynamic_names}}. Both `package` and
#' `palette` can be supplied as symbols or strings.
#'
#' @rdname ggplot2-scales-discrete
#' @param ... additional arguments to pass to discrete_scale
#' @param dynamic toggles between the discrete palettes and the dynamic
#'     palettes. Defaults to FALSE which indicates discrete palettes.
#' @inheritParams paletteer_d
#'
#' @examples
#'
#' if (require('ggplot2')) {
#'
#'   ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) +
#'     geom_point() +
#'     scale_colour_paletteer_d(package = "nord", palette = "frost")
#' }
#'
#' @export
scale_colour_paletteer_d <- function(package, palette, direction = 1,
                                     dynamic = FALSE, ...) {

  package <- rlang::quo_name(rlang::enquo(package))
  palette <- rlang::quo_name(rlang::enquo(palette))

  ggplot2::discrete_scale("colour", paste(package, palette, sep = "-"),
                 pal_pal(package = package, palette = palette, scale = TRUE,
                         dynamic = dynamic, direction = direction), ...)

}

#' @rdname ggplot2-scales-discrete
#' @export
scale_color_paletteer_d <- scale_colour_paletteer_d


#' @rdname ggplot2-scales-discrete
#' @export
#'
scale_fill_paletteer_d <- function(package, palette, direction = 1,
                                   dynamic = FALSE, ...) {

  package <- rlang::quo_name(rlang::enquo(package))
  palette <- rlang::quo_name(rlang::enquo(palette))

  ggplot2::discrete_scale("fill", paste(package, palette, sep = "-"),
                 pal_pal(package = package, palette = palette, scale = TRUE,
                         dynamic = dynamic, direction = direction), ...)

}
