library(tibble)
library(purrr)
library(dplyr)
library(paletteer)

palettes_discrete_names <- purrr::imap_dfr(palettes_discrete,
                                           ~ data.frame(package = .y,
                                                        name = names(.x),
                                                        length = sapply(.x, length),
                                                        stringsAsFactors = FALSE)) %>%
  tibble::remove_rownames()

usethis::use_data(palettes_discrete_names, overwrite = TRUE)
