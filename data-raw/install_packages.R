# install.packages("devtools")
library(paletteer)
library(tidyverse)

df <- split(paletteer_packages, is.na(paletteer_packages$Github))

pak::pak(setdiff(
  union(unique(palettes_c_names$package), df$`TRUE`$Name),
  "grDevices"
))

df$`FALSE` %>%
  filter(!(Name %in% unique(palettes_c_names$package))) %>%
  filter(!Name %in% "MapPalettes") %>% # Too hard to install
  pull(Github) %>%
  pak::pak()
