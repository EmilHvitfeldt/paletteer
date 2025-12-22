check_palette <- function(palette, names, call = rlang::caller_env()) {
  if (!(palette %in% names)) {
    abort(
      paste0(
        "Palette not found. Make sure both package and palette ",
        'name are spelled correct in the format "package::palette".'
      ),
      call = call
    )
  }
}
