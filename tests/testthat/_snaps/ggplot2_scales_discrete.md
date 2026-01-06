# scale_*_paletteer_d correctly used direction

    Code
      ggplot2::ggplot(df, ggplot2::aes(x, y, colour = color)) +
        scale_colour_paletteer_d("nord::lumina", direction = 10)
    Condition
      Error in `paletteer_d()`:
      ! `direction` must be 1 or -1, not 10.

