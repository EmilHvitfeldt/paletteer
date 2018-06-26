library(tibble)
library(purrr)
library(dplyr)
library(paletteer)

palettes_d_names <- purrr::imap_dfr(palettes_d,
                                           ~ data.frame(package = .y,
                                                        palette = names(.x),
                                                        length = sapply(.x, length),
                                                        stringsAsFactors = FALSE)) %>%
  tibble::remove_rownames()

usethis::use_data(palettes_d_names, overwrite = TRUE)
