# paletteer_c throws an error when n is unspecified

    Code
      paletteer_c("grDevices::rainbow")
    Condition
      Error in `paletteer_c()`:
      ! argument "n" is missing, with no default

# direction works correctly in paletteer_c

    Code
      paletteer_c("grDevices::rainbow", 3, direction = 10)
    Condition
      Error in `paletteer_c()`:
      ! `direction` must be 1 or -1, not 10.

