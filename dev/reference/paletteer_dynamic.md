# Get dynamic palette by package and name

Available package/palette combinations are available in the data.frame
[`palettes_dynamic_names`](palettes_dynamic_names.md).

## Usage

``` r
paletteer_dynamic(palette, n, direction = 1)
```

## Arguments

- palette:

  Name of palette as a string. Must be on the form
  packagename::palettename.

- n:

  Number of colors desired. If omitted, returns complete palette.

- direction:

  Either `1` or `-1`. If `-1` the palette will be reversed.

## Value

A vector of colors.

## Examples

``` r
paletteer_dynamic("ggthemes_solarized::green", 8)
#> <colors>
#> #859900FF #B58900FF #CB4B16FF #DC322FFF #D33682FF #6C71C4FF #268BD2FF #2AA198FF 
paletteer_dynamic("cartography::sand.pal", 20)
#> <colors>
#> #FFF5DCFF #FCEFD1FF #F9E9C6FF #F6E3BBFF #F3DDB0FF #F1D7A5FF #EED19AFF #EBCB8FFF #E8C584FF #E4BD75FF #E1B567FF #DDAD58FF #D9A54AFF #D59D3BFF #CB922EFF #AD7B25FF #90651CFF #724F13FF #55390AFF #382301FF 
```
