# scale_*_paletteer_c correctly used direction

    Code
      ggplot2::ggplot(df, ggplot2::aes(x, y, colour = color)) +
        scale_colour_paletteer_c("scico::berlin", direction = 10)
    Condition
      Error in `paletteer_c()`:
      ! `direction` must be 1 or -1, not 10.

