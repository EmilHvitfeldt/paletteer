# Binned scales to use for ggplot2

These functions provide the option to use binned palettes along with the
`ggplot2` package. It goes without saying that it requires `ggplot2` to
work.

## Usage

``` r
scale_colour_paletteer_binned(palette, direction = 1, ...)

scale_color_paletteer_binned(palette, direction = 1, ...)

scale_fill_paletteer_binned(palette, direction = 1, ...)
```

## Arguments

- palette:

  Name of palette as a string. Must be on the form
  packagename::palettename.

- direction:

  Either `1` or `-1`. If `-1` the palette will be reversed.

- ...:

  Arguments to pass on to
  [`ggplot2::scale_colour_stepsn()`](https://ggplot2.tidyverse.org/reference/scale_steps.html)
  or
  [`ggplot2::scale_fill_stepsn()`](https://ggplot2.tidyverse.org/reference/scale_steps.html)

## Value

A `ScaleContinuous` object that can be added to a `ggplot` object

## Details

Available package/palette combinations are available in the data.frame
[`palettes_c_names`](palettes_c_names.md).

## Examples

``` r
library(ggplot2)
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Petal.Length)) +
  geom_point() +
  scale_colour_paletteer_binned("scico::tokyo")
```
