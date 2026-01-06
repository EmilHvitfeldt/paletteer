# paletteer_dynamic returns something when n is unspecified

    Code
      paletteer_dynamic("ggthemes_solarized::green")
    Condition
      Error in `paletteer_dynamic()`:
      ! `n` must be a whole number, not absent.

# paletteer_dynamic throws an error when n is specified too high

    Code
      paletteer_dynamic("ggthemes_solarized::green", 100)
    Condition
      Error in `paletteer_dynamic()`:
      ! `n` must be a whole number between 0 and 8, not the number 100.

# direction works correctly in paletteer_dynamic

    Code
      paletteer_dynamic("ggthemes_solarized::green", 3, direction = 10)
    Condition
      Error in `paletteer_dynamic()`:
      ! `direction` must be 1 or -1, not 10.

