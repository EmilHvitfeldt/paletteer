#' Wrappers around continuous palette functions by package
#'
#' These functions provide a function wrapper for each package such that a
#' palette can be generated using only the name of the desired palette and the
#' length.
#'
#' @param name Character, name of palette.
#' @param n Integer, number of colors.
#'
#' @return Vector of color values from specified palette.
#'
#' @name paleteer-c-wrapper
#' @rdname paleteer-c-wrapper
paletteer_c_ggthemes <- function(name, n) {

  ggthemes_c_seq_names <- c("Red", "Green", "Blue", "Orange", "Gray",
                            "Red Light", "Green Light", "Blue Light",
                            "Orange Light", "Area Red" , "Area Green",
                            "Area Brown", "Blue-Green Sequential",
                            "Brown Sequential", "Purple Sequential",
                            "Grey Sequential")

  ggthemes_c_div_names <- c("Red-Blue", "Red-Green", "Red-White-Green",
                            "Red-Black", "Red-White-Black","Green-Blue",
                            "Orange-Blue", "Orange-White-Blue",
                            "Red-Green Light", "Red-White-Green Light",
                            "Red-White-Black Light", "Orange-Blue Light",
                            "Orange-White-Blue Light", "Orange-Blue",
                            "Light Red-Green", "Temperature")

  name <- match.arg(name, c(ggthemes_c_seq_names, ggthemes_c_div_names))

  if (name %in% ggthemes_c_seq_names) {
    pal_gen <- ggthemes::tableau_seq_gradient_pal(palette = name)
  } else {
    pal_gen <- ggthemes::tableau_div_gradient_pal(palette = name)
  }

  pal_gen(x = seq(0, 1, length.out = n))
}

#' @rdname paleteer-c-wrapper
paletteer_c_grDevices <- function(name, n) {
  pal_gen <- getExportedValue("grDevices", name)

  pal_gen(n = n)
}

#' @rdname paleteer-c-wrapper
paletteer_c_oompaBase <- function(name, n) {
  pal_gen <- getExportedValue("oompaBase", name)

  pal_gen(N = n)
}

#' @rdname paleteer-c-wrapper
paletteer_c_palr <- function(name, n) {
  pal_gen <- getExportedValue("palr", name)

  pal_gen(x = n)
}

#' @rdname paleteer-c-wrapper
paletteer_c_pals <- function(name, n) {
  pal_gen <- getExportedValue("pals", name)

  pal_gen(n = n)
}

#' @rdname paleteer-c-wrapper
paletteer_c_scico <- function(name, n) {
  scico::scico(n = n, palette = name)
}

#' @rdname paleteer-c-wrapper
paletteer_c_viridis <- function(name, n) {
  pal_gen <- getExportedValue("viridisLite", name)

  pal_gen(n = n)
}

#' List of all wrapper functions used in paletteer_c
#'
#' @format Named list of all wrapper functions
"wrapper_c"
wrapper_c <- list(
  ggthemes = paletteer_c_ggthemes,
  grDevices = paletteer_c_grDevices,
  oompaBase = paletteer_c_oompaBase,
  palr = paletteer_c_palr,
  pals = paletteer_c_pals,
  scico = paletteer_c_scico,
  viridis = paletteer_c_viridis
)
