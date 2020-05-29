check_package <- function(package) {
  if (!requireNamespace(package, quietly = TRUE)) {
    rlang::abort(
      paste0(
        "Package '",
        package ,
        "' needed. Please install it by running `install.packages('",
        package,
        "')`."
        )
      )
  }
}
