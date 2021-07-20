#' @importFrom rlang check_installed abort
NULL

check_palette <- function(palette, names) {
  if (!(palette %in% names)) {
    abort(
      paste0(
        "Palette not found. Make sure both package and palette ",
        'name are spelled correct in the format "package::palette"'
      )
    )
  }
}
