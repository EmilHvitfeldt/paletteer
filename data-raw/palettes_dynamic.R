## cartography
cartography_pals <- cartography:::cartography.colors

## ggthemes_ptol
ggthemes_ptol_pals <- list(qualitative = ggthemes::ggthemes_data$ptol$qualitative)

## ggthemes_solarized
ggthemes_solarized_pals <- ggthemes::ggthemes_data$solarized$palettes

# Discrete variable number of colors
palettes_dynamic <- list(
  cartography = cartography_pals,
  ggthemes_ptol = ggthemes_ptol_pals,
  ggthemes_solarized = ggthemes_solarized_pals
)

usethis::use_data(palettes_dynamic, overwrite = TRUE)
