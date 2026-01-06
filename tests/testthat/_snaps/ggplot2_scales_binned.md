# scale_*_paletteer_binned correctly used direction

    Code
      ggplot2::ggplot(df, ggplot2::aes(x, y, colour = color)) +
        scale_colour_paletteer_binned("scico::berlin", direction = 10)
    Condition
      Error in `scale_colour_paletteer_binned()`:
      ! `direction` must be 1 or -1, not 10.

