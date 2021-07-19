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
  check_package("ggthemes")

  ggthemes_c_seq_names <- c(
    "Blue-Green Sequential", "Blue Light", "Orange Light", "Blue", "Orange",
    "Green", "Red", "Purple", "Brown", "Gray", "Gray Warm", "Blue-Teal",
    "Orange-Gold", "Green-Gold", "Red-Gold", "Classic Green", "Classic Gray",
    "Classic Blue", "Classic Red", "Classic Orange", "Classic Area Red",
    "Classic Area Green", "Classic Area-Brown"
  )

  ggthemes_c_div_names <- c(
    "Orange-Blue Diverging", "Red-Green Diverging", "Green-Blue Diverging",
    "Red-Blue Diverging", "Red-Black Diverging", "Gold-Purple Diverging",
    "Red-Green-Gold Diverging", "Sunset-Sunrise Diverging", "Orange-Blue-White Diverging",
    "Red-Green-White Diverging", "Green-Blue-White Diverging", "Red-Blue-White Diverging",
    "Red-Black-White Diverging", "Orange-Blue Light Diverging", "Temperature Diverging",
    "Classic Red-Green", "Classic Red-Blue", "Classic Red-Black", "Classic Area Red-Green",
    "Classic Orange-Blue", "Classic Green-Blue", "Classic Red-White-Green",
    "Classic Red-White-Black", "Classic Orange-White-Blue", "Classic Red-White-Black Light",
    "Classic Orange-White-Blue Light", "Classic Red-White-Green Light",
    "Classic Red-Green Light"
  )

  name <- try(match.arg(name, c(ggthemes_c_seq_names, ggthemes_c_div_names)), silent = T)

  if (class(name) == "try-error") {
    ggthemes_list <- paste(c(
      ggthemes_c_seq_names,
      ggthemes_c_div_names
    ),
    collapse = "\n"
    )
    stop(sprintf(
      'Error in match.arg, "arg" should be one of: \n%s',
      ggthemes_list
    ))
  }

  if (name %in% ggthemes_c_seq_names) {
    pal_gen <- ggthemes::tableau_seq_gradient_pal(palette = name)
  } else {
    pal_gen <- ggthemes::tableau_div_gradient_pal(palette = name)
  }

  pal_gen(x = seq(0, 1, length.out = n))
}

#' @rdname paleteer-c-wrapper
paletteer_c_grDevices <- function(name, n) {
  if (name %in% c(
    "rainbow", "heat.colors", "terrain.colors",
    "topo.colors", "cm.colors"
  )) {
    pal_gen <- getExportedValue("grDevices", name)

    return(pal_gen(n = n))
  } else {
    pal_gen <- function(n) {
      grDevices::hcl.colors(n = n, palette = name)
    }
    return(pal_gen(n = n))
  }
}

#' @rdname paleteer-c-wrapper
paletteer_c_oompaBase <- function(name, n) {
  check_package("oompaBase")
  pal_gen <- getExportedValue("oompaBase", name)

  pal_gen(N = n)
}

#' @rdname paleteer-c-wrapper
paletteer_c_palr <- function(name, n) {
  check_package("palr")
  pal_gen <- getExportedValue("palr", name)

  pal_gen(x = n)
}

#' @rdname paleteer-c-wrapper
paletteer_c_pals <- function(name, n) {
  check_package("pals")
  pal_gen <- getExportedValue("pals", name)

  pal_gen(n = n)
}

#' @rdname paleteer-c-wrapper
paletteer_c_scico <- function(name, n) {
  check_package("scico")
  scico::scico(n = n, palette = name)
}

#' @rdname paleteer-c-wrapper
paletteer_c_viridis <- function(name, n) {
  check_package("viridisLite")
  pal_gen <- getExportedValue("viridisLite", name)

  pal_gen(n = n)
}

#' @rdname paleteer-c-wrapper
paletteer_c_harrypotter <- function(name, n) {
  check_package("harrypotter")
  harrypotter::hp(n = n, option = name)
}

#' @rdname paleteer-c-wrapper
paletteer_c_gameofthrones <- function(name, n) {
  check_package("gameofthrones")
  gameofthrones::got(n = n, option = name)
}

#' List of all wrapper functions used in paletteer_c
#'
#' @format Named list of all wrapper functions
"wrapper_c"
wrapper_c <- list(
  gameofthrones = paletteer_c_gameofthrones,
  ggthemes      = paletteer_c_ggthemes,
  grDevices     = paletteer_c_grDevices,
  harrypotter   = paletteer_c_harrypotter,
  oompaBase     = paletteer_c_oompaBase,
  palr          = paletteer_c_palr,
  pals          = paletteer_c_pals,
  scico         = paletteer_c_scico,
  viridis       = paletteer_c_viridis
)
