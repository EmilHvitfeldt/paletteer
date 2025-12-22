d_names <- paste0(palettes_d_names$package, "::", palettes_d_names$palette)
dym_names <- paste0(
  palettes_dynamic_names$package,
  "::",
  palettes_dynamic_names$palette
)
c_names <- paste0(palettes_c_names$package, "::", palettes_c_names$palette)

readr::write_lines(d_names, "data-raw/d_names.txt")
readr::write_lines(dym_names, "data-raw/dym_names.txt")
readr::write_lines(c_names, "data-raw/c_names.txt")
usethis::use_data(
  d_names,
  dym_names,
  c_names,
  internal = TRUE,
  overwrite = TRUE
)
