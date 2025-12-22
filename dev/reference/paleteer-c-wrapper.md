# Wrappers around continuous palette functions by package

These functions provide a function wrapper for each package such that a
palette can be generated using only the name of the desired palette and
the length.

## Usage

``` r
paletteer_c_ggthemes(name, n)

paletteer_c_grDevices(name, n)

paletteer_c_oompaBase(name, n)

paletteer_c_palr(name, n)

paletteer_c_pals(name, n)

paletteer_c_scico(name, n)

paletteer_c_viridis(name, n)

paletteer_c_harrypotter(name, n)
```

## Arguments

- name:

  Character, name of palette.

- n:

  Integer, number of colors.

## Value

Vector of color values from specified palette.
