library(paletteer)

testthat::skip_if_not_installed("ggplot2")

list_plotter <- function(color_list, names, package_name) {
  par(mar = c(0, 0, 0, 0) + 0.1)

  plot(0, 0,
    type = "n", axes = FALSE, bty = "n", xlab = "", ylab = "",
    xlim = c(0, 1), ylim = c(-length(color_list) - 1, 0)
  )

  title(package_name, line = -3)
  for (i in seq_len(length(color_list))) {
    colors_len <- length(color_list[[i]])
    breaks <- seq(from = 0, to = 1, length = colors_len + 1)


    text(0, -i, names[i], pos = 4)
    rect(
      xleft = breaks[1:colors_len], xright = breaks[1:colors_len + 1],
      ytop = -0.15 - i, ybottom = -0.8 - i,
      col = color_list[[i]], border = NA
    )
  }
}

all_names <- function(package, type = NULL) {
  color_list_d <- character()
  color_list_c <- character()
  color_list_dynamic <- character()

  if (is.null(type)) {
    names_d <- palettes_d_names[which(palettes_d_names$package == package), ]$palette
  } else {
    names_d <- palettes_d_names[intersect(
      which(palettes_d_names$package == package),
      which(palettes_d_names$type == type)
    ), ]$palette
  }

  if (length(names_d) > 0) {
    color_list_d <- lapply(paste0(package, "::", names_d), paletteer_d)
  }
  if (is.null(type)) {
    names_c <- palettes_c_names[which(palettes_c_names$package == package), ]$palette
  } else {
    names_c <- palettes_c_names[intersect(
      which(palettes_c_names$package == package),
      which(palettes_c_names$type == type)
    ), ]$palette
  }

  if (length(names_c) > 0) {
    color_list_c <- lapply(paste0(package, "::", names_c), paletteer_c, n = 256)
  }

  if (is.null(type)) {
    which_dynamic <- which(palettes_dynamic_names$package == package)
  } else {
    which_dynamic <- intersect(
      which(palettes_dynamic_names$package == package),
      which(palettes_dynamic_names$type == type)
    )
  }

  names_dynamic <- palettes_dynamic_names[which_dynamic, ]$palette
  length_dynamic <- palettes_dynamic_names[which_dynamic, ]$length

  if (length(names_dynamic) > 0) {
    color_list_dynamic <- mapply(paletteer_dynamic,
      palette = paste0(package, "::", names_dynamic),
      n = length_dynamic, SIMPLIFY = FALSE
    )
  }

  list(
    names = c(names_d, names_c, names_dynamic),
    color = c(color_list_d, color_list_c, unname(color_list_dynamic))
  )
}

plot_in_one <- function(name) {
  function() {
    aaa <- all_names(name)
    list_plotter(color_list = aaa$color, names = aaa$names, name)
  }
}

all_package_names <- unique(
  c(
    palettes_c_names$package,
    palettes_d_names$package,
    palettes_dynamic_names$package
  )
)

all_package_names <- setdiff(
  all_package_names,
  c(
    # "gameofthrones",
    "ggthemes",
    "harrypotter",
    "oompaBase",
    "palr",
    "pals",
    "scico",
    "viridisLite")
)

expect_doppelganger <- function(title, fig, ...) {
  testthat::skip_if_not_installed("vdiffr")
  vdiffr::expect_doppelganger(title, fig, ...)
}

test_that("colors show up correctly", {
  for (package in all_package_names) {
    expect_doppelganger(package, plot_in_one(package))
  }
})

# test_that("colors show up correctly for gameofthrones", {
#   testthat::skip_if_not_installed("vdiffr")
#   testthat::skip_if_not_installed("gameofthrones")
#   vdiffr::expect_doppelganger("gameofthrones", plot_in_one("gameofthrones")())
# })

test_that("colors show up correctly for ggthemes", {
  testthat::skip_if_not_installed("vdiffr")
  testthat::skip_if_not_installed("ggthemes")
  vdiffr::expect_doppelganger("ggthemes", plot_in_one("ggthemes")())
})

test_that("colors show up correctly for harrypotter", {
  testthat::skip_if_not_installed("vdiffr")
  testthat::skip_if_not_installed("harrypotter")
  vdiffr::expect_doppelganger("harrypotter", plot_in_one("harrypotter")())
})

test_that("colors show up correctly for oompaBase", {
  testthat::skip_if_not_installed("vdiffr")
  testthat::skip_if_not_installed("oompaBase")
  vdiffr::expect_doppelganger("oompaBase", plot_in_one("oompaBase")())
})

test_that("colors show up correctly for palr", {
  testthat::skip_if_not_installed("vdiffr")
  testthat::skip_if_not_installed("palr")
  vdiffr::expect_doppelganger("palr", plot_in_one("palr")())
})

test_that("colors show up correctly for pals", {
  testthat::skip_if_not_installed("vdiffr")
  testthat::skip_if_not_installed("pals")
  vdiffr::expect_doppelganger("pals", plot_in_one("pals")())
})

test_that("colors show up correctly for scico", {
  testthat::skip_if_not_installed("vdiffr")
  testthat::skip_if_not_installed("scico")
  vdiffr::expect_doppelganger("scico", plot_in_one("scico")())
})

test_that("colors show up correctly for viridisLite", {
  testthat::skip_if_not_installed("vdiffr")
  testthat::skip_if_not_installed("viridisLite")
  vdiffr::expect_doppelganger("viridisLite", plot_in_one("viridisLite")())
})
