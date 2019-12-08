# install.packages("devtools")
library(paletteer)
library(tidyverse)

df <- split(paletteer_packages, is.na(paletteer_packages$Github))

install.packages(setdiff(union(unique(palettes_c_names$package), df$`TRUE`$Name), "grDevices"))

df$`FALSE` %>%
  filter(!(Name %in% unique(palettes_c_names$package))) %>%
  pull(Github) %>%
  remotes::install_github()
