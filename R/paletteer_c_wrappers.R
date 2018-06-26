#' @export
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

  pal_gen <- ggthemes:::tableau_gradient_pal(palette = name,
                                             type = type)

  pal_gen(x = seq(0, 1, length.out = n))
}

#' @export
paletteer_c_grDevices <- function(name, n) {
  objs <- mget(ls("package:grDevices"), inherits = TRUE)
  pal_gen <- get(name, objs)

  pal_gen(n = n)
}

#' @export
paletteer_c_jcolors <- function(name, n) {
  name <- match.arg(name, c("default", "pal2", "pal3", "pal4", "pal10",
                            "pal11", "pal12", "rainbow"))
  pal_gen <- jcolors::jcolors_contin(palette = name)

  pal_gen(n = n)
}

#' @importFrom oompaBase redscale greenscale bluescale blueyellow cyanyellow
#' @importFrom oompaBase redgreen jetColors greyscale
#' @export
paletteer_c_oompaBase <- function(name, n) {
  pal_gen <- get(name)

  pal_gen(N = n)
}

#' @importFrom palr bathyDeepPal chlPal icePal sstPal
#' @export
paletteer_c_palr <- function(name, n) {
  pal_gen <- get(name)

  pal_gen(x = n)
}

#' @import pals
#' @export
paletteer_c_pals <- function(name, n) {
  pal_gen <- get(name)

  pal_gen(n = n)
}

#' @export
paletteer_c_scico <- function(name, n) {
  scico::scico(n = n, palette = name)
}

#' @export
paletteer_c_viridis <- function(name, n) {
  pal_gen <- get(name)

  pal_gen(n = n)
}
