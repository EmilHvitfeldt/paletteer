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

  pal_gen <- ggthemes::tableau_gradient_pal(palette = name,
                                            type = type)

  pal_gen(x = seq(0, 1, length.out = n))
}

#' @rdname paleteer-c-wrapper
#' @export
paletteer_c_grDevices <- function(name, n) {
  objs <- mget(ls("package:grDevices"), inherits = TRUE)
  pal_gen <- get(name, objs)

  pal_gen(n = n)
}

#' @rdname paleteer-c-wrapper
#' @export
paletteer_c_jcolors <- function(name, n) {
  name <- match.arg(name, c("default", "pal2", "pal3", "pal4", "pal10",
                            "pal11", "pal12", "rainbow"))
  pal_gen <- jcolors::jcolors_contin(palette = name)

  pal_gen(n = n)
}

#' @importFrom oompaBase redscale greenscale bluescale blueyellow cyanyellow
#' @importFrom oompaBase redgreen jetColors greyscale
#' @rdname paleteer-c-wrapper
#' @export
paletteer_c_oompaBase <- function(name, n) {
  pal_gen <- get(name)

  pal_gen(N = n)
}

#' @importFrom palr bathyDeepPal chlPal icePal sstPal
#' @rdname paleteer-c-wrapper
#' @export
paletteer_c_palr <- function(name, n) {
  pal_gen <- get(name)

  pal_gen(x = n)
}

#' @importFrom pals coolwarm warmcool cubehelix gnuplot jet parula tol.rainbow
#' @importFrom pals cubicyf cubicl isol linearl linearlhot
#' @importFrom pals ocean.algae ocean.deep ocean.dense ocean.gray ocean.haline
#' @importFrom pals ocean.ice ocean.matter ocean.oxy ocean.phase ocean.solar
#' @importFrom pals ocean.thermal ocean.turbid ocean.balance ocean.curl
#' @importFrom pals ocean.delta ocean.amp ocean.speed ocean.tempo
#' @importFrom pals kovesi.cyclic_grey_15_85_c0 kovesi.cyclic_grey_15_85_c0_s25
#' @importFrom pals kovesi.cyclic_mrybm_35_75_c68
#' @importFrom pals kovesi.cyclic_mrybm_35_75_c68_s25
#' @importFrom pals kovesi.cyclic_mygbm_30_95_c78
#' @importFrom pals kovesi.cyclic_mygbm_30_95_c78_s25
#' @importFrom pals kovesi.cyclic_wrwbw_40_90_c42
#' @importFrom pals kovesi.cyclic_wrwbw_40_90_c42_s25
#' @importFrom pals kovesi.diverging_isoluminant_cjm_75_c23
#' @importFrom pals kovesi.diverging_isoluminant_cjm_75_c24
#' @importFrom pals kovesi.diverging_isoluminant_cjo_70_c25
#' @importFrom pals kovesi.diverging_linear_bjr_30_55_c53
#' @importFrom pals kovesi.diverging_linear_bjy_30_90_c45
#' @importFrom pals kovesi.diverging_rainbow_bgymr_45_85_c67
#' @importFrom pals kovesi.diverging_bkr_55_10_c35
#' @importFrom pals kovesi.diverging_bky_60_10_c30
#' @importFrom pals kovesi.diverging_bwr_40_95_c42
#' @importFrom pals kovesi.diverging_bwr_55_98_c37
#' @importFrom pals kovesi.diverging_cwm_80_100_c22
#' @importFrom pals kovesi.diverging_gkr_60_10_c40
#' @importFrom pals kovesi.diverging_gwr_55_95_c38
#' @importFrom pals kovesi.diverging_gwv_55_95_c39
#' @importFrom pals kovesi.isoluminant_cgo_70_c39 kovesi.isoluminant_cgo_80_c38
#' @importFrom pals kovesi.isoluminant_cm_70_c39 kovesi.linear_bgy_10_95_c74
#' @importFrom pals kovesi.linear_bgyw_15_100_c67 kovesi.linear_bgyw_15_100_c68
#' @importFrom pals kovesi.linear_blue_5_95_c73 kovesi.linear_blue_95_50_c20
#' @importFrom pals kovesi.linear_bmw_5_95_c86 kovesi.linear_bmw_5_95_c89
#' @importFrom pals kovesi.linear_bmy_10_95_c71 kovesi.linear_bmy_10_95_c78
#' @importFrom pals kovesi.linear_gow_60_85_c27 kovesi.linear_gow_65_90_c35
#' @importFrom pals kovesi.linear_green_5_95_c69 kovesi.linear_grey_0_100_c0
#' @importFrom pals kovesi.linear_grey_10_95_c0 kovesi.linear_kry_5_95_c72
#' @importFrom pals kovesi.linear_kry_5_98_c75 kovesi.linear_kryw_5_100_c64
#' @importFrom pals kovesi.linear_kryw_5_100_c67
#' @importFrom pals kovesi.linear_ternary_blue_0_44_c57
#' @importFrom pals kovesi.linear_ternary_green_0_46_c42
#' @importFrom pals kovesi.linear_ternary_red_0_50_c52
#' @importFrom pals kovesi.rainbow_bgyr_35_85_c72 kovesi.rainbow_bgyr_35_85_c73
#' @importFrom pals kovesi.rainbow_bgyrm_35_85_c69
#' @importFrom pals kovesi.rainbow_bgyrm_35_85_c71
#' @rdname paleteer-c-wrapper
#' @export
paletteer_c_pals <- function(name, n) {
  pal_gen <- get(name)

  pal_gen(n = n)
}

#' @rdname paleteer-c-wrapper
#' @export
paletteer_c_scico <- function(name, n) {
  scico::scico(n = n, palette = name)
}

#' @importFrom viridisLite cividis inferno magma plasma viridis
#' @rdname paleteer-c-wrapper
#' @export
paletteer_c_viridis <- function(name, n) {
  pal_gen <- get(name)

  pal_gen(n = n)
}
