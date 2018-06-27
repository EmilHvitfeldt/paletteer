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

  ggthemes_c_seq_names <- names(ggthemes::ggthemes_data[[
    c("tableau", "color-palettes", "ordered-sequential")
    ]])
  ggthemes_c_diq_names <- names(ggthemes::ggthemes_data[[
    c("tableau", "color-palettes", "ordered-diverging")
    ]])

  name <- match.arg(name, c(ggthemes_c_seq_names, ggthemes_c_diq_names))

  if (name %in% ggthemes_c_seq_names) {
    type <- "ordered-sequential"
  } else {
    type <- "ordered-diverging"
  }

  pal_gen <- ggthemes::tableau_gradient_pal(palette = name,
                                            type = type)

  pal_gen(x = seq(0, 1, length.out = n))
}

#' @rdname paleteer-c-wrapper
paletteer_c_grDevices <- function(name, n) {
  pal_gen <- getExportedValue("grDevices", name)

  pal_gen(n = n)
}

#' @rdname paleteer-c-wrapper
paletteer_c_jcolors <- function(name, n) {
  name <- match.arg(name, c("default", "pal2", "pal3", "pal4", "pal10",
                            "pal11", "pal12", "rainbow"))
  pal_gen <- jcolors::jcolors_contin(palette = name)

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
  jcolors = paletteer_c_jcolors,
  oompaBase = paletteer_c_oompaBase,
  palr = paletteer_c_palr,
  pals = paletteer_c_pals,
  scico = paletteer_c_scico,
  viridis = paletteer_c_viridis
)
