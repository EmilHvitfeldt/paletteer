#' Binned scales to use for ggplot2
#'
#' These functions provide the option to use binned palettes along with the
#' `ggplot2` package. It goes without saying that it requires `ggplot2` to work.
#'
#' Available package/palette combinations are available in the data.frame
#' \code{\link[paletteer]{palettes_c_names}}.
#'
#' @param ... Arguments to pass on to `ggplot2::scale_colour_stepsn()` or
#' `ggplot2::scale_fill_stepsn()`
#' @inheritParams paletteer_c
#'
#' @return A `ScaleContinuous` object that can be added to a `ggplot` object
#'
#' @name ggplot2-scales-binned
#' @rdname ggplot2-scales-binned
#'
#' @examplesIf rlang::is_installed(c("scico", "ggplot2"))
#' library(ggplot2)
#' ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Petal.Length)) +
#'   geom_point() +
#'   scale_colour_paletteer_binned("scico::tokyo")
#' @export
scale_colour_paletteer_binned <- function(palette, direction = 1, ...) {
  check_installed("ggplot2")

  ggplot2::scale_colour_stepsn(
    colours = paletteer_c(
      palette = {{ palette }},
      direction = direction,
      256
    ),
    ...
  )
}
#' @rdname ggplot2-scales-binned
#' @export
#'
scale_color_paletteer_binned <- scale_colour_paletteer_binned
#' @rdname ggplot2-scales-binned
#' @export
#'
scale_fill_paletteer_binned <- function(palette, direction = 1, ...) {
  check_installed("ggplot2")

  ggplot2::scale_fill_stepsn(
    colours = paletteer_c(
      palette = {{ palette }},
      direction = direction,
      256
    ),
    ...
  )
}
