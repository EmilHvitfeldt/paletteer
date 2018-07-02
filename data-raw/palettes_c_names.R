library(tibble)
library(magrittr)
library(paletteer)
library(stringr)


ggthemes_c_seq_names <- names(ggthemes::ggthemes_data$tableau$sequential)
ggthemes_c_diq_names <- names(ggthemes::ggthemes_data$tableau$diverging)

ggthemes_df <- tibble(package = "ggthemes",
           palette = c(ggthemes_c_seq_names, ggthemes_c_diq_names))


pals_df <- tibble(package = "pals",
       palette = names(pals:::syspals)) %>%
  dplyr::filter(!str_detect(palette, "^brewer"),
                !str_detect(palette, "glasbey|kelly|stepped|tol|watlington"),
                !str_detect(palette, "viridis|inferno|magma|plasma|cividis"))

scico_df <- tibble(package = "scico",
                   palette = names(scico:::palettes))

other_df <- frame_data(
  ~package, ~palette,
  "grDevices", "rainbow",
  "grDevices", "heat.colors",
  "grDevices", "terrain.colors",
  "grDevices", "topo.colors",
  "grDevices", "cm.colors",
  "oompaBase", "redscale",
  "oompaBase", "greenscale",
  "oompaBase", "bluescale",
  "oompaBase", "blueyellow",
  "oompaBase", "cyanyellow",
  "oompaBase", "redgreen",
  "oompaBase", "jetColors",
  "oompaBase", "greyscale",
  "palr", "bathyDeepPal",
  "palr", "chlPal",
  "palr", "icePal",
  "palr", "sstPal",
  "viridis", "viridis",
  "viridis", "inferno",
  "viridis", "magma",
  "viridis", "plasma",
  "viridis", "cividis"
) %>% as.data.frame()

palettes_c_names <- dplyr::bind_rows(ggthemes_df, pals_df, scico_df, other_df) %>%
  dplyr::arrange(package) %>%
  as.data.frame()

usethis::use_data(palettes_c_names, overwrite = TRUE)
