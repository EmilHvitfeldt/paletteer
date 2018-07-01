
<!-- README.md is generated from README.Rmd. Please edit that file -->
paletteer <img src="man/figures/logo.png" align="right" />
==========================================================

[![Travis build status](https://travis-ci.org/EmilHvitfeldt/paletteer.svg?branch=master)](https://travis-ci.org/EmilHvitfeldt/paletteer) [![Coverage status](https://codecov.io/gh/EmilHvitfeldt/paletteer/branch/master/graph/badge.svg)](https://codecov.io/github/EmilHvitfeldt/paletteer?branch=master) [![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/EmilHvitfeldt/paletteer?branch=master&svg=true)](https://ci.appveyor.com/project/EmilHvitfeldt/paletteer) <!---
[![CRAN status](https://www.r-pkg.org/badges/version/paletteer)](https://cran.r-project.org/package=paletteer)
[![CRAN_Download_Badge](http://cranlogs.r-pkg.org/badges/scico)](https://CRAN.R-project.org/package=scico)
-->

The goal of paletteer is to be a comprehensize collection of color palettes in R using a common interface. Think of it as the "caret of palettes".

Installation
------------

<!---
You can install the released version of paletteer from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("paletteer")
```
-->
the package is not yet on CRAN but ff you want the development version then install directly from GitHub:

``` r
# install.packages("devtools")
devtools::install_github("EmilHvitfeldt/paletteer")
```

Palettes
--------

The palettes are divided into 2 groups; *discrete* and *continuous*. For discrete palette you have the choice between the *fixed width palettes* and *dynamic palettes*. Most common of the two are the fixed width palettes which have a set amount of colors which doesn't change when the number of colors requisted vary like the following palettes:

![](man/figures/README-unnamed-chunk-2-1.png)

on the other hand we have the dynamic palettes where the colors of the palette depend on the number of colors you need like the `green.pal` palette from the `cartography` package:

![](man/figures/README-unnamed-chunk-3-1.png)

Lastly we have the continuous palettes which provides as many colors as you need for a smooth transition of color:

![](man/figures/README-unnamed-chunk-4-1.png)

This package includes 647 from 27 different packages and information about these can be found in the following data.frames: `palettes_c_names`, `palettes_d_names` and `palettes_dynamic_names`.

Examples
--------

All the palettes can be accessed from the 3 functions `paletteer_c()`, `paletteer_d()` and `paletteer_dynamic()` using the package and palette arguments.

``` r
paletteer_c(package = "scico", palette = "berlin", n = 10)
#>  [1] "#9EB0FF" "#5AA3DA" "#2D7597" "#194155" "#11181D" "#270C01" "#501802"
#>  [8] "#8A3F2A" "#C37469" "#FFACAC"
paletteer_d("nord", "frost")
#> [1] "#8FBCBB" "#88C0D0" "#81A1C1" "#5E81AC"
paletteer_dynamic("cartography", "green.pal", 5)
#> [1] "#B8D9A9" "#8DBC80" "#5D9D52" "#287A22" "#17692C"
```

All of the functions also support symbol argument such that you don't have to put your names in quotes

``` r
paletteer_c(scico, berlin, 10)
#>  [1] "#9EB0FF" "#5AA3DA" "#2D7597" "#194155" "#11181D" "#270C01" "#501802"
#>  [8] "#8A3F2A" "#C37469" "#FFACAC"
paletteer_d(nord, frost)
#> [1] "#8FBCBB" "#88C0D0" "#81A1C1" "#5E81AC"
paletteer_dynamic(cartography, green.pal, 5)
#> [1] "#B8D9A9" "#8DBC80" "#5D9D52" "#287A22" "#17692C"
```

ggplot2 scales
--------------

Lastly the package also includes scales for `ggplot2` using the same standard interface

``` r
library(ggplot2)

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point() +
  scale_color_paletteer_d(nord, aurora)
```

![](man/figures/README-unnamed-chunk-7-1.png)

Included packages
-----------------

paletteer incldues palettes from the following packages:

-   awtools [github](https://github.com/awhstin/awtools)
-   cartography [github](https://github.com/riatelab/cartography) [CRAN](https://cran.r-project.org/web/packages/cartography/index.html)
-   dichromat [CRAN](https://cran.r-project.org/web/packages/dichromat/index.html)
-   dutchmasters [github](https://github.com/EdwinTh/dutchmasters)
-   ggsci [github](https://github.com/road2stat/ggsci) [CRAN](https://cran.r-project.org/web/packages/ggsci/index.html)
-   ggpomological [github](https://github.com/gadenbuie/ggpomological)
-   ggthemes [github](https://github.com/jrnold/ggthemes) [CRAN](https://cran.r-project.org/web/packages/ggthemes/index.html)
-   ghibli [github](https://github.com/ewenme/ghibli) [CRAN](https://cran.r-project.org/web/packages/ghibli/index.html)
-   grDevices [CRAN](https://cran.r-project.org/web/packages/RGraphics/index.html)
-   jcolors [github](https://github.com/jaredhuling/jcolors) [CRAN](https://cran.r-project.org/web/packages/jcolors/index.html)
-   LaCroixColoR [github](https://github.com/johannesbjork/LaCroixColoR)
-   NineteenEightyR [github](https://github.com/m-clark/NineteenEightyR)
-   nord [github](https://github.com/jkaupp/nord) [CRAN](https://cran.r-project.org/web/packages/nord/index.html)
-   oompaBase [CRAN](https://cran.r-project.org/web/packages/oompaBase/index.html)
-   palr [github](https://github.com/AustralianAntarcticDivision/palr) [CRAN](https://cran.r-project.org/web/packages/palr/index.html)
-   pals [github](https://github.com/kwstat/pals) [CRAN](https://cran.r-project.org/web/packages/pals/index.html)
-   Polychrome [CRAN](https://cran.r-project.org/web/packages/Polychrome/index.html)
-   quickpalette [github](https://github.com/EmilHvitfeldt/quickpalette)
-   rcartocolor [github](https://github.com/Nowosad/rcartocolor) [CRAN](https://cran.r-project.org/web/packages/rcartocolor/index.html)
-   RColorBrewer [CRAN](https://cran.r-project.org/web/packages/RColorBrewer/index.html)
-   Redmonder [CRAN](https://cran.r-project.org/web/packages/Redmonder/index.html)
-   RSkittleBrewer [github](https://github.com/alyssafrazee/RSkittleBrewer)
-   scico [github](https://github.com/thomasp85/scico) [CRAN](https://cran.r-project.org/web/packages/scico/index.html)
-   viridis [github](https://github.com/sjmgarnier/viridis) [CRAN](https://cran.r-project.org/web/packages/viridis/index.html)
-   visibly [github](https://github.com/m-clark/visibly) [CRAN](https://cran.r-project.org/web/packages/visibly/index.html)
-   wesanderson [github](https://github.com/karthik/wesanderson) [CRAN](https://cran.r-project.org/web/packages/wesanderson/index.html)
-   yarrr [github](https://github.com/ndphillips/yarrr) [CRAN](https://cran.r-project.org/web/packages/yarrr/index.html)
