check_palette <- function(palette, names, call = rlang::caller_env()) {
  if (!(palette %in% names)) {
    cli::cli_abort(
      "Palette not found. Make sure both package and palette
      name are spelled correct in the format {.val package::palette}.",
      call = call
    )
  }
}

check_direction <- function(direction, call = caller_env()) {
  if (abs(direction) != 1) {
    cli::cli_abort(
      "{.arg direction} must be 1 or -1, not {direction}.",
      call = call
    )
  }
}
