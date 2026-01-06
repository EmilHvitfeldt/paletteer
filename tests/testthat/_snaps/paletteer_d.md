# paletteer_d throws an error when n is specified too high

    Code
      paletteer_d("wesanderson::Royal1", 100)
    Condition
      Error in `paletteer_d()`:
      ! `n` must be a whole number between 1 and 4, not the number 100.

# direction works correctly in paletteer_d

    Code
      paletteer_d("wesanderson::Royal1", 3, direction = 10)
    Condition
      Error in `paletteer_d()`:
      ! `direction` must be 1 or -1, not 10.

# paletteer_d errors with wrong names

    Code
      paletteer_d("paletteer::notreal")
    Condition
      Error in `paletteer_d()`:
      ! Palette not found. Make sure both package and palette name are spelled correct in the format "package::palette".

