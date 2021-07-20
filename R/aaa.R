#' @importFrom rlang check_installed
NULL

check_palette <- function(palette, names) {
  if (!(palette %in% names)) {
    stop(
      "Palette not found. Make sure both package and palette ",
      'name are spelled correct in the format "package::palette"'
    )
  }
}
