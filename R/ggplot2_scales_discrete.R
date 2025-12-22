
pal_pal <- function(palette, direction, dynamic) {

  palette <- try(palette, silent = TRUE)
  if (inherits(palette, "try-error")) {
    palette <- attr(palette, "condition")$message
    palette <- sub("^.*?\"", "", palette)
    palette <- sub("\".*$", "", palette)
  }

  if (dynamic) {
    function(n) {
      paletteer_dynamic(
        palette = palette,
        n = n,
        direction = direction
      )
    }
  } else {
    function(n) {
      paletteer_d(palette = palette, direction = direction)
    }
  }
}

#' Discrete scales to use for ggplot2
#'
#' These functions provide the option to use the discrete and dynamic palettes
#' along with the `ggplot2` package. It goes without saying that it requires
#' `ggplot2` to work.
#'
#' Available package/palette combinations are available in the data.frame
#' \code{\link[paletteer]{palettes_d_names}} and
#' \code{\link[paletteer]{palettes_dynamic_names}}.
#'
#' @rdname ggplot2-scales-discrete
#' @param ... additional arguments to pass to discrete_scale
#' @param dynamic toggles between the discrete palettes and the dynamic
#'     palettes. Defaults to FALSE which indicates discrete palettes.
#' @inheritParams paletteer_d
#'
#' @examplesIf rlang::is_installed("ggplot2")
#' library(ggplot2)
#' ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) +
#'   geom_point() +
#'   scale_colour_paletteer_d("nord::frost")
#' @export
scale_colour_paletteer_d <- function(palette, direction = 1,
                                     dynamic = FALSE, ...) {

  ggplot2::discrete_scale("colour",
                palette = pal_pal(palette = {{palette}},
                         dynamic = dynamic, direction = direction), ...)

}

#' @rdname ggplot2-scales-discrete
#' @export
scale_color_paletteer_d <- scale_colour_paletteer_d


#' @rdname ggplot2-scales-discrete
#' @export
#'
scale_fill_paletteer_d <- function(palette, direction = 1,
                                   dynamic = FALSE, ...) {

  ggplot2::discrete_scale("fill",
                palette = pal_pal(palette = {{palette}},
                         dynamic = dynamic, direction = direction), ...)
}
