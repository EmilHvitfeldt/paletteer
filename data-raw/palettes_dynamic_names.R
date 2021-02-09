library(tibble)
library(purrr)
library(dplyr)
library(paletteer)

palettes_dynamic_names <- purrr::imap_dfr(
  palettes_dynamic,
  ~ data.frame(
    package = .y,
    palette = names(.x),
    length = sapply(.x, length),
    stringsAsFactors = FALSE
  )
) %>%
  tibble::remove_rownames() %>%
  dplyr::mutate(type = case_when(
    palette %in% c("pastel.pal", "multi.pal") ~ "qualitative",
    package == "cartography" ~ "sequential",
    TRUE ~ "qualitative"
  ))

usethis::use_data(palettes_dynamic_names, overwrite = TRUE)
