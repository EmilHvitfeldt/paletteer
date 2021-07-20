check_package <- function(package) {
  if (!requireNamespace(package, quietly = TRUE)) {
    rlang::abort(
      paste0(
        "Package '",
        package,
        "' needed. Please install it by running `install.packages('",
        package,
        "')`."
      )
    )
  }
}

check_palette <- function(palette, names) {
  if (!(palette %in% names)) {
    stop(
      "Palette not found. Make sure both package and palette ",
      'name are spelled correct in the format "package::palette"'
    )
  }
}
