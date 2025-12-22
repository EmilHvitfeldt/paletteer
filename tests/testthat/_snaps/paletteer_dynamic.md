# paletteer_dynamic returns something when n is unspecified

    Code
      paletteer_dynamic("ggthemes_solarized::green")
    Condition
      Error in `paletteer_dynamic()`:
      ! `n` not found. Please supply the number of colors you want returned.

# paletteer_dynamic throws an error when n is specified too high

    Code
      paletteer_dynamic("ggthemes_solarized::green", 100)
    Condition
      Error in `paletteer_dynamic()`:
      ! Number of requested colors greater than this palette can offer which is 8.

# direction works correctly in paletteer_dynamic

    Code
      paletteer_dynamic("ggthemes_solarized::green", 3, direction = 10)
    Condition
      Error in `paletteer_dynamic()`:
      ! `direction` must be 1 or -1.

