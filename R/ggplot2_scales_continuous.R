#' Continuous scales to use for ggplot2
#'
#' These functions provide the option to use continuous palettes along with the
#' `ggplot2` package. It goes without saying that it requires `ggplot2` to work.
#'
#' Available package/palette combinations are available in the data.frame
#' \code{\link[paletteer]{palettes_c_names}}. Both `package` and `palette` can be
#' supplied as symbols or strings.
#'
#' @param ... Arguments to pass on to `ggplot2::scale_colour_gradientn()` or
#' `ggplot2::scale_fill_gradientn()`
#' @inheritParams paletteer_c
#'
#' @return A `ScaleContinuous` object that can be added to a `ggplot` object
#'
#' @name ggplot2-scales-continuous
#' @rdname ggplot2-scales-continuous
#'
#' @examples
#'
#' if (require('ggplot2')) {
#'
#'   ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Petal.Length)) +
#'     geom_point() +
#'     scale_colour_paletteer_c(package = "scico", palette = "tokyo")
#' }
#'
#' @export
scale_colour_paletteer_c <- function(package, palette, direction = 1, ...) {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop('ggplot2 is required for this functionality', call. = FALSE)
  }

  package <- rlang::ensym(package)
  palette <- rlang::ensym(palette)

  ggplot2::scale_colour_gradientn(colours = paletteer_c(package = !!package,
                                                        palette = !!palette,
                                                        direction = direction,
                                                        256), ...)
}
#' @rdname ggplot2-scales-continuous
#' @export
#'
scale_color_paletteer_c <- scale_colour_paletteer_c
#' @rdname ggplot2-scales-continuous
#' @export
#'
scale_fill_paletteer_c <- function(package, palette, direction = 1, ...) {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop('ggplot2 is required for this functionality', call. = FALSE)
  }

  package <- rlang::ensym(package)
  palette <- rlang::ensym(palette)

  ggplot2::scale_fill_gradientn(colours = paletteer_c(package = !!package,
                                                      palette = !!palette,
                                                      direction = direction,
                                                      256), ...)
}
