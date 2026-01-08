# Get discrete palette by package and name

Available package/palette combinations are available in the data.frame
[`palettes_d_names`](palettes_d_names.md).

## Usage

``` r
paletteer_d(
  palette,
  n,
  direction = 1,
  type = c("discrete", "continuous"),
  call = caller_env(0)
)
```

## Arguments

- palette:

  Name of palette as a string. Must be on the form
  packagename::palettename.

- n:

  Number of colors desired. If omitted, returns complete palette.

- direction:

  Either `1` or `-1`. If `-1` the palette will be reversed.

- type:

  Either "discrete" or "continuous". Colors are interpolated if
  "continuous" is picked. Defaults to "discrete".

- call:

  The execution environment of a currently running function, e.g.
  `caller_env()`. The function will be mentioned in error messages as
  the source of the error. See the `call` argument of
  [`abort()`](https://rlang.r-lib.org/reference/abort.html) for more
  information.

## Value

A vector of colors.

## Examples

``` r
paletteer_d("nord::frost")
#> <colors>
#> #8FBCBBFF #88C0D0FF #81A1C1FF #5E81ACFF 
paletteer_d("wesanderson::Royal1", 3)
#> <colors>
#> #899DA4FF #C93312FF #FAEFD1FF 
paletteer_d("Redmonder::dPBIPuOr", 14, type = "continuous")
#> <colors>
#> #53354DFF #73496AFF #9C6D92FF #BD90B3FF #CBA7C3FF #D8BED2FF #EBE1E9FF #F8E8E1FF #FED1BDFF #FEC1A5FF #FEB18EFF #E0906BFF #B06846FF #7F4B33FF 
```
