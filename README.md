
<!-- README.md is generated from README.Rmd. Please edit that file -->
paletteer
=========

<!---
[![Travis build status](https://travis-ci.org/EmilHvitfeldt/paletteer.svg?branch=master)](https://travis-ci.org/EmilHvitfeldt/paletteer)
[![Coverage status](https://codecov.io/gh/EmilHvitfeldt/paletteer/branch/master/graph/badge.svg)](https://codecov.io/github/EmilHvitfeldt/paletteer?branch=master)
[![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/EmilHvitfeldt/paletteer?branch=master&svg=true)](https://ci.appveyor.com/project/EmilHvitfeldt/paletteer)
[![CRAN status](https://www.r-pkg.org/badges/version/paletteer)](https://cran.r-project.org/package=paletteer)
[![CRAN_Download_Badge](http://cranlogs.r-pkg.org/badges/scico)](https://CRAN.R-project.org/package=scico)
-->
The goal of paletteer is to be a comprehensize collection of color palettes in r using a common API.

Installation
------------

<!---
You can install the released version of paletteer from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("paletteer")
```
-->
If you want the development version then install directly from GitHub:

``` r
# install.packages("devtools")
devtools::install_github("EmilHvitfeldt/paletteer")
```

Palettes
--------

The palettes are divided into 2 groups; *discrete* and *continuous*. For discrete palette you have the choice between the *fixed width palettes* and *dynamic palettes*. Most common of the two are the fixed width palettes which have a set amout of colors which doesn't change when the number of colors requisted vary.

``` r
library(paletteer)
pals::pal.bands(
  paletteer_d("nord", "frost"),
  paletteer_d("dutchmasters", "milkmaid"),
  paletteer_d("LaCroixColoR", "Lime"), 
  main = "Fixed width palettes",
  labels = c("nord\n frost", "dutchmasters\n milkmaid", "LaCroixColoR\n Lime")
  )
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />

on the other hand we have the dynamic palettes where the colors of the palette depend on the number of colors you need.

``` r
pals::pal.bands(
  paletteer_dynamic("cartography", "green.pal", 2),
  paletteer_dynamic("cartography", "green.pal", 5),
  paletteer_dynamic("cartography", "green.pal", 8),
  main = "Dynamic palettes",
  labels = c("cartography\n green.pal\n n = 2",
             "cartography\n green.pal\n n = 5",
             "cartography\n green.pal\n n = 6")
  )
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />

Names of current avaliable dicrete palettes.

``` r
palettes_discrete_names
#>             package                            name length
#> 1           awtools                       a_palette      8
#> 2           awtools                      a_spalette      4
#> 3           awtools                        mpalette      6
#> 4           awtools                        ppalette      8
#> 5           awtools                        spalette      6
#> 6         dichromat                  BrowntoBlue.10     10
#> 7         dichromat                  BrowntoBlue.12     12
#> 8         dichromat             BluetoDarkOrange.12     12
#> 9         dichromat             BluetoDarkOrange.18     18
#> 10        dichromat                DarkRedtoBlue.12     12
#> 11        dichromat                DarkRedtoBlue.18     18
#> 12        dichromat                  BluetoGreen.14     14
#> 13        dichromat                    BluetoGray.8      8
#> 14        dichromat              BluetoOrangeRed.14     14
#> 15        dichromat                 BluetoOrange.10     10
#> 16        dichromat                 BluetoOrange.12     12
#> 17        dichromat                  BluetoOrange.8      8
#> 18        dichromat          LightBluetoDarkBlue.10     10
#> 19        dichromat           LightBluetoDarkBlue.7      7
#> 20        dichromat                  Categorical.12     12
#> 21        dichromat               GreentoMagenta.16     16
#> 22        dichromat             SteppedSequential.5     25
#> 23     dutchmasters                        milkmaid     13
#> 24     dutchmasters                   pearl_earring     11
#> 25     dutchmasters                   view_of_Delft     12
#> 26     dutchmasters                   little_street     11
#> 27     dutchmasters                         anatomy      7
#> 28     dutchmasters                   staalmeesters      7
#> 29            ggsci                         nrc_npg     10
#> 30            ggsci                    default_aaas     10
#> 31            ggsci                    default_nejm      8
#> 32            ggsci                   lanonc_lancet      9
#> 33            ggsci                    default_jama      7
#> 34            ggsci                     default_jco     10
#> 35            ggsci                  default_ucscgb     26
#> 36            ggsci                   category10_d3     10
#> 37            ggsci                   category20_d3     20
#> 38            ggsci                  category20b_d3     20
#> 39            ggsci                  category20c_d3     20
#> 40            ggsci                     default_igv     51
#> 41            ggsci                 alternating_igv      2
#> 42            ggsci               default_locuszoom      7
#> 43            ggsci                default_uchicago      9
#> 44            ggsci                  light_uchicago      9
#> 45            ggsci                   dark_uchicago      9
#> 46            ggsci            springfield_simpsons     16
#> 47            ggsci          planetexpress_futurama     12
#> 48            ggsci           schwifty_rickandmorty     12
#> 49            ggsci                uniform_startrek      7
#> 50            ggsci                     legacy_tron      7
#> 51            ggsci                    default_gsea     12
#> 52            ggsci                    red_material     10
#> 53            ggsci                   pink_material     10
#> 54            ggsci                 purple_material     10
#> 55            ggsci            deep-purple_material     10
#> 56            ggsci                 indigo_material     10
#> 57            ggsci                   blue_material     10
#> 58            ggsci             light-blue_material     10
#> 59            ggsci                   cyan_material     10
#> 60            ggsci                   teal_material     10
#> 61            ggsci                  green_material     10
#> 62            ggsci            light-green_material     10
#> 63            ggsci                   lime_material     10
#> 64            ggsci                 yellow_material     10
#> 65            ggsci                  amber_material     10
#> 66            ggsci                 orange_material     10
#> 67            ggsci            deep-orange_material     10
#> 68            ggsci                  brown_material     10
#> 69            ggsci                   grey_material     10
#> 70            ggsci              blue-grey_material     10
#> 71    ggpomological                pomological_base      7
#> 72    ggpomological             pomological_palette      9
#> 73         ggthemes                            calc     12
#> 74         ggthemes                      colorblind      8
#> 75         ggthemes                    economist_bg      5
#> 76         ggthemes                    economist_fg     12
#> 77         ggthemes                     excel_Atlas      6
#> 78         ggthemes                     excel_Badge      6
#> 79         ggthemes                    excel_Berlin      6
#> 80         ggthemes                 excel_Celestial      6
#> 81         ggthemes                      excel_Crop      6
#> 82         ggthemes                     excel_Depth      6
#> 83         ggthemes                   excel_Droplet      6
#> 84         ggthemes                     excel_Facet      6
#> 85         ggthemes                 excel_Feathered      6
#> 86         ggthemes                   excel_Gallery      6
#> 87         ggthemes                 excel_Headlines      6
#> 88         ggthemes                  excel_Integral      6
#> 89         ggthemes             excel_Ion Boardroom      6
#> 90         ggthemes                       excel_Ion      6
#> 91         ggthemes                   excel_Madison      6
#> 92         ggthemes                excel_Main Event      6
#> 93         ggthemes                      excel_Mesh      6
#> 94         ggthemes              excel_Office Theme      6
#> 95         ggthemes                   excel_Organic      6
#> 96         ggthemes                  excel_Parallax      6
#> 97         ggthemes                    excel_Parcel      6
#> 98         ggthemes                excel_Retrospect      6
#> 99         ggthemes                     excel_Savon      6
#> 100        ggthemes                     excel_Slice      6
#> 101        ggthemes               excel_Vapor Trail      6
#> 102        ggthemes                      excel_View      6
#> 103        ggthemes                      excel_Wisp      6
#> 104        ggthemes                 excel_Wood Type      6
#> 105        ggthemes                    excel_Aspect      6
#> 106        ggthemes                excel_Blue Green      6
#> 107        ggthemes                   excel_Blue II      6
#> 108        ggthemes                 excel_Blue Warm      6
#> 109        ggthemes                      excel_Blue      6
#> 110        ggthemes                 excel_Grayscale      6
#> 111        ggthemes              excel_Green Yellow      6
#> 112        ggthemes                     excel_Green      6
#> 113        ggthemes                   excel_Marquee      6
#> 114        ggthemes                    excel_Median      6
#> 115        ggthemes          excel_Office 2007-2010      6
#> 116        ggthemes                excel_Orange Red      6
#> 117        ggthemes                    excel_Orange      6
#> 118        ggthemes                     excel_Paper      6
#> 119        ggthemes                excel_Red Orange      6
#> 120        ggthemes                excel_Red Violet      6
#> 121        ggthemes                       excel_Red      6
#> 122        ggthemes                excel_Slipstream      6
#> 123        ggthemes                 excel_Violet II      6
#> 124        ggthemes                    excel_Violet      6
#> 125        ggthemes             excel_Yellow Orange      6
#> 126        ggthemes                    excel_Yellow      6
#> 127        ggthemes                       few_light      9
#> 128        ggthemes                      few_medium      9
#> 129        ggthemes                        few_dark      9
#> 130        ggthemes                 fivethirtyeight      6
#> 131        ggthemes                           gdocs     32
#> 132        ggthemes                      hc_default     10
#> 133        ggthemes                    hc_darkunica     11
#> 134        ggthemes                  solarized_base      8
#> 135        ggthemes               solarized_accents      8
#> 136        ggthemes                   stata_s2color     15
#> 137        ggthemes                  stata_s1rcolor     15
#> 138        ggthemes                   stata_s1color     15
#> 139        ggthemes                      stata_mono     15
#> 140        ggthemes                        wsj_rgby      4
#> 141        ggthemes                   wsj_red_green      2
#> 142        ggthemes                 wsj_black_green      4
#> 143        ggthemes                     wsj_dem_rep      3
#> 144        ggthemes                     wsj_colors6      6
#> 145        ggthemes              tableau_Tableau 10     10
#> 146        ggthemes              tableau_Tableau 20     23
#> 147        ggthemes             tableau_Color Blind     10
#> 148        ggthemes           tableau_Seattle Grays      5
#> 149        ggthemes                 tableau_Traffic      9
#> 150        ggthemes            tableau_Miller Stone     11
#> 151        ggthemes       tableau_Superfishel Stone     10
#> 152        ggthemes            tableau_Nuriel Stone      9
#> 153        ggthemes            tableau_Jewel Bright      9
#> 154        ggthemes                  tableau_Summer      8
#> 155        ggthemes                  tableau_Winter     10
#> 156        ggthemes       tableau_Green-Orange-Teal     12
#> 157        ggthemes          tableau_Red-Blue-Brown     12
#> 158        ggthemes        tableau_Purple-Pink-Gray     12
#> 159        ggthemes              tableau_Hue Circle     19
#> 160        ggthemes              tableau_Classic 10     10
#> 161        ggthemes       tableau_Classic 10 Medium     10
#> 162        ggthemes        tableau_Classic 10 Light     10
#> 163        ggthemes              tableau_Classic 20     20
#> 164        ggthemes          tableau_Classic Gray 5      5
#> 165        ggthemes     tableau_Classic Color Blind     10
#> 166        ggthemes   tableau_Classic Traffic Light      9
#> 167        ggthemes   tableau_Classic Purple-Gray 6      6
#> 168        ggthemes  tableau_Classic Purple-Gray 12     12
#> 169        ggthemes  tableau_Classic Green-Orange 6      6
#> 170        ggthemes tableau_Classic Green-Orange 12     12
#> 171        ggthemes      tableau_Classic Blue-Red 6      6
#> 172        ggthemes     tableau_Classic Blue-Red 12     12
#> 173        ggthemes          tableau_Classic Cyclic     13
#> 174          ghibli                    MarnieLight1      7
#> 175          ghibli                   MarnieMedium1      7
#> 176          ghibli                     MarnieDark1      7
#> 177          ghibli                    MarnieLight2      7
#> 178          ghibli                   MarnieMedium2      7
#> 179          ghibli                     MarnieDark2      7
#> 180          ghibli                      PonyoLight      7
#> 181          ghibli                     PonyoMedium      7
#> 182          ghibli                       PonyoDark      7
#> 183          ghibli                     LaputaLight      7
#> 184          ghibli                    LaputaMedium      7
#> 185          ghibli                      LaputaDark      7
#> 186          ghibli                   MononokeLight      7
#> 187          ghibli                  MononokeMedium      7
#> 188          ghibli                    MononokeDark      7
#> 189          ghibli                   SpiritedLight      7
#> 190          ghibli                  SpiritedMedium      7
#> 191          ghibli                    SpiritedDark      7
#> 192          ghibli                  YesterdayLight      7
#> 193          ghibli                 YesterdayMedium      7
#> 194          ghibli                   YesterdayDark      7
#> 195          ghibli                       KikiLight      7
#> 196          ghibli                      KikiMedium      7
#> 197          ghibli                        KikiDark      7
#> 198          ghibli                     TotoroLight      7
#> 199          ghibli                    TotoroMedium      7
#> 200          ghibli                      TotoroDark      7
#> 201       grDevices                          blues9      9
#> 202         jcolors                         default      5
#> 203         jcolors                            pal2      5
#> 204         jcolors                            pal3      5
#> 205         jcolors                            pal4      6
#> 206         jcolors                            pal5      6
#> 207         jcolors                            pal6      8
#> 208         jcolors                            pal7      8
#> 209         jcolors                            pal8     12
#> 210         jcolors                            pal9      6
#> 211         jcolors                           pal10     10
#> 212         jcolors                           pal11     12
#> 213         jcolors                           pal12     13
#> 214         jcolors                         rainbow      9
#> 215    LaCroixColoR                    PassionFruit      6
#> 216    LaCroixColoR                           Mango      6
#> 217    LaCroixColoR                            Pure      6
#> 218    LaCroixColoR                            Lime      6
#> 219    LaCroixColoR                           Lemon      6
#> 220    LaCroixColoR                          Orange      6
#> 221    LaCroixColoR                           Berry      6
#> 222    LaCroixColoR                   CranRaspberry      6
#> 223    LaCroixColoR                    Pamplemousse      6
#> 224    LaCroixColoR                       PeachPear      6
#> 225    LaCroixColoR                         Coconut      6
#> 226    LaCroixColoR                         Apricot      6
#> 227    LaCroixColoR                       Tangerine      7
#> 228    LaCroixColoR                         KeyLime      5
#> 229    LaCroixColoR                       PommeBaya      5
#> 230    LaCroixColoR                     CeriseLimon      6
#> 231    LaCroixColoR                      PinaFraise      6
#> 232    LaCroixColoR                      KiwiSandia      7
#> 233    LaCroixColoR                     MelonPomelo      6
#> 234    LaCroixColoR                      MurePepino      6
#> 235    LaCroixColoR                          paired     14
#> 236 NineteenEightyR                           cobra      6
#> 237 NineteenEightyR                electronic_night      5
#> 238 NineteenEightyR                         hotpink      5
#> 239 NineteenEightyR                          malibu      5
#> 240 NineteenEightyR                          miami1      5
#> 241 NineteenEightyR                          miami2      5
#> 242 NineteenEightyR         seventies_aint_done_yet      5
#> 243 NineteenEightyR                           sonny      5
#> 244 NineteenEightyR                         sunset1      5
#> 245 NineteenEightyR                         sunset2      5
#> 246 NineteenEightyR                         sunset3      5
#> 247 NineteenEightyR                      youngturqs     12
#> 248            nord                      polarnight      4
#> 249            nord                       snowstorm      3
#> 250            nord                           frost      4
#> 251            nord                          aurora      5
#> 252            nord                          lumina      5
#> 253            nord                  mountain_forms      5
#> 254            nord                     silver_mine      5
#> 255            nord                   lake_superior      6
#> 256            nord                   victory_bonds      5
#> 257            nord                  halifax_harbor      6
#> 258            nord                      moose_pond      8
#> 259            nord                   algoma_forest      7
#> 260            nord                  rocky_mountain      6
#> 261            nord                    red_mountain      8
#> 262            nord                     baie_mouton      7
#> 263            nord                afternoon_prarie      9
#> 264           ochRe                  namatjira_qual      8
#> 265           ochRe                   namatjira_div      8
#> 266           ochRe                          mccrea     11
#> 267           ochRe                      parliament      8
#> 268           ochRe                        tasmania      7
#> 269           ochRe                       nolan_ned      5
#> 270           ochRe                          winmar      7
#> 271           ochRe                      olsen_qual      6
#> 272           ochRe                       olsen_seq     14
#> 273           ochRe                williams_pilbara      7
#> 274           ochRe                    healthy_reef      9
#> 275           ochRe                emu_woman_paired     18
#> 276           ochRe                           galah      6
#> 277           ochRe                        lorikeet      6
#> 278           ochRe                       dead_reef      6
#> 279           ochRe                    jumping_frog      5
#> 280            pals                        alphabet     26
#> 281            pals                       alphabet2     26
#> 282            pals                         glasbey     32
#> 283            pals                           kelly     22
#> 284            pals                      polychrome     36
#> 285            pals                         stepped     24
#> 286            pals                             tol     12
#> 287            pals                      watlington     16
#> 288      Polychrome                        alphabet     26
#> 289      Polychrome                            dark     24
#> 290      Polychrome                         glasbey     32
#> 291      Polychrome                  green.armytage     26
#> 292      Polychrome                           kelly     22
#> 293      Polychrome                           light     24
#> 294      Polychrome                       palette36     36
#> 295    quickpalette                        dreaming      8
#> 296    quickpalette                            jojo      8
#> 297    quickpalette                           beach      8
#> 298    quickpalette                       waterfall      8
#> 299    quickpalette                          sunset      8
#> 300    quickpalette                          Bright     16
#> 301    quickpalette                       Grayscale     16
#> 302    quickpalette                           Excel     16
#> 303    quickpalette                           Light     10
#> 304    quickpalette                          Pastel     16
#> 305    quickpalette                      EarthTones     16
#> 306    quickpalette                 SemiTransparent     16
#> 307    quickpalette                           Berry     11
#> 308    quickpalette                       Chocolate     10
#> 309    quickpalette                            Fire     10
#> 310    quickpalette                        SeaGreen     10
#> 311    quickpalette                    BrightPastel     15
#> 312     rcartocolor                       ag_Sunset      7
#> 313     rcartocolor                        ag_GrnYl      7
#> 314     rcartocolor                          Tropic      7
#> 315     rcartocolor                           Temps      7
#> 316     rcartocolor                        TealRose      7
#> 317     rcartocolor                          Geyser      7
#> 318     rcartocolor                            Fall      7
#> 319     rcartocolor                           Earth      7
#> 320     rcartocolor                        ArmyRose      7
#> 321     rcartocolor                           Vivid     12
#> 322     rcartocolor                            Safe     12
#> 323     rcartocolor                           Prism     12
#> 324     rcartocolor                          Pastel     12
#> 325     rcartocolor                            Bold     12
#> 326     rcartocolor                         Antique     12
#> 327     rcartocolor                         TealGrn      7
#> 328     rcartocolor                            Teal      7
#> 329     rcartocolor                      SunsetDark      7
#> 330     rcartocolor                          Sunset      7
#> 331     rcartocolor                           RedOr      7
#> 332     rcartocolor                          PurpOr      7
#> 333     rcartocolor                            Purp      7
#> 334     rcartocolor                          PinkYl      7
#> 335     rcartocolor                           Peach      7
#> 336     rcartocolor                           OrYel      7
#> 337     rcartocolor                            Mint      7
#> 338     rcartocolor                         Magenta      7
#> 339     rcartocolor                           Emrld      7
#> 340     rcartocolor                        DarkMint      7
#> 341     rcartocolor                          BurgYl      7
#> 342     rcartocolor                            Burg      7
#> 343     rcartocolor                          BrwnYl      7
#> 344     rcartocolor                           BluYl      7
#> 345     rcartocolor                          BluGrn      7
#> 346    RColorBrewer                            BrBG     11
#> 347    RColorBrewer                            PiYG     11
#> 348    RColorBrewer                            PRGn     11
#> 349    RColorBrewer                            PuOr     11
#> 350    RColorBrewer                            RdBu     11
#> 351    RColorBrewer                            RdGy     11
#> 352    RColorBrewer                          RdYlBu     11
#> 353    RColorBrewer                          RdYlGn     11
#> 354    RColorBrewer                        Spectral     11
#> 355    RColorBrewer                          Accent      8
#> 356    RColorBrewer                           Dark2      8
#> 357    RColorBrewer                          Paired     12
#> 358    RColorBrewer                         Pastel1      9
#> 359    RColorBrewer                         Pastel2      8
#> 360    RColorBrewer                            Set1      9
#> 361    RColorBrewer                            Set2      8
#> 362    RColorBrewer                            Set3     12
#> 363    RColorBrewer                           Blues      9
#> 364    RColorBrewer                            BuGn      9
#> 365    RColorBrewer                            BuPu      9
#> 366    RColorBrewer                            GnBu      9
#> 367    RColorBrewer                          Greens      9
#> 368    RColorBrewer                           Greys      9
#> 369    RColorBrewer                         Oranges      9
#> 370    RColorBrewer                            OrRd      9
#> 371    RColorBrewer                            PuBu      9
#> 372    RColorBrewer                          PuBuGn      9
#> 373    RColorBrewer                            PuRd      9
#> 374    RColorBrewer                         Purples      9
#> 375    RColorBrewer                            RdPu      9
#> 376    RColorBrewer                            Reds      9
#> 377    RColorBrewer                            YlGn      9
#> 378    RColorBrewer                          YlGnBu      9
#> 379    RColorBrewer                          YlOrBr      9
#> 380    RColorBrewer                          YlOrRd      9
#> 381       Redmonder                        dPBIYlBu     11
#> 382       Redmonder                        dPBIYlPu     11
#> 383       Redmonder                        dPBIPuGn     11
#> 384       Redmonder                        dPBIPuOr     11
#> 385       Redmonder                        dPBIRdBu     11
#> 386       Redmonder                        dPBIRdGy     11
#> 387       Redmonder                        dPBIRdGn     11
#> 388       Redmonder                         qMSOStd     10
#> 389       Redmonder                          qMSO12      8
#> 390       Redmonder                          qMSO15      8
#> 391       Redmonder                      qMSOBuWarm      8
#> 392       Redmonder                          qMSOBu      8
#> 393       Redmonder                         qMSOBu2      8
#> 394       Redmonder                        qMSOBuGn      8
#> 395       Redmonder                          qMSOGn      8
#> 396       Redmonder                        qMSOGnYl      8
#> 397       Redmonder                          qMSOYl      8
#> 398       Redmonder                        qMSOYlOr      8
#> 399       Redmonder                          qMSOOr      8
#> 400       Redmonder                        qMSOOrRd      8
#> 401       Redmonder                        qMSORdOr      8
#> 402       Redmonder                          qMSORd      8
#> 403       Redmonder                        qMSORdPu      8
#> 404       Redmonder                          qMSOPu      8
#> 405       Redmonder                         qMSOPu2      8
#> 406       Redmonder                         qMSOMed      8
#> 407       Redmonder                         qMSOPap      8
#> 408       Redmonder                         qMSOMrq      8
#> 409       Redmonder                         qMSOSlp      8
#> 410       Redmonder                         qMSOAsp      8
#> 411       Redmonder                            qPBI      8
#> 412       Redmonder                          sPBIGn      9
#> 413       Redmonder                         sPBIGy1      9
#> 414       Redmonder                          sPBIRd      9
#> 415       Redmonder                          sPBIYl      9
#> 416       Redmonder                         sPBIGy2      9
#> 417       Redmonder                          sPBIBu      9
#> 418       Redmonder                          sPBIOr      9
#> 419       Redmonder                          sPBIPu      9
#> 420       Redmonder                        sPBIYlGn      9
#> 421       Redmonder                        sPBIRdPu      9
#> 422  RSkittleBrewer                        original      5
#> 423  RSkittleBrewer                        tropical      5
#> 424  RSkittleBrewer                       wildberry      5
#> 425  RSkittleBrewer                             M&M      6
#> 426  RSkittleBrewer                        smarties      8
#> 427     wesanderson                   BottleRocket1      7
#> 428     wesanderson                   BottleRocket2      5
#> 429     wesanderson                       Rushmore1      5
#> 430     wesanderson                        Rushmore      5
#> 431     wesanderson                          Royal1      4
#> 432     wesanderson                          Royal2      5
#> 433     wesanderson                         Zissou1      5
#> 434     wesanderson                     Darjeeling1      5
#> 435     wesanderson                     Darjeeling2      5
#> 436     wesanderson                      Chevalier1      4
#> 437     wesanderson                   FantasticFox1      5
#> 438     wesanderson                       Moonrise1      4
#> 439     wesanderson                       Moonrise2      4
#> 440     wesanderson                       Moonrise3      5
#> 441     wesanderson                     Cavalcanti1      5
#> 442     wesanderson                  GrandBudapest1      4
#> 443     wesanderson                  GrandBudapest2      4
#> 444     wesanderson                     IsleofDogs1      6
#> 445     wesanderson                     IsleofDogs2      5
#> 446           yarrr                           basel     10
#> 447           yarrr                            pony      9
#> 448           yarrr                            xmen      8
#> 449           yarrr                        decision      6
#> 450           yarrr                       southpark      6
#> 451           yarrr                          google      4
#> 452           yarrr                         eternal      7
#> 453           yarrr                        evildead      6
#> 454           yarrr                   usualsuspects      7
#> 455           yarrr                       ohbrother      7
#> 456           yarrr                         appletv      6
#> 457           yarrr                           brave      5
#> 458           yarrr                            bugs      5
#> 459           yarrr                            cars      5
#> 460           yarrr                            nemo      5
#> 461           yarrr                             rat      5
#> 462           yarrr                              up      5
#> 463           yarrr                        espresso      5
#> 464           yarrr                            ipod      7
#> 465           yarrr                            info      9
#> 466           yarrr                           info2     14
```

Names of current avaliable dynamic palettes.

``` r
palettes_dynamic_names
#>               package          name length
#> 1         cartography      blue.pal     20
#> 2         cartography    orange.pal     20
#> 3         cartography       red.pal     20
#> 4         cartography     brown.pal     20
#> 5         cartography     green.pal     20
#> 6         cartography    purple.pal     20
#> 7         cartography      pink.pal     20
#> 8         cartography      wine.pal     20
#> 9         cartography      grey.pal     20
#> 10        cartography turquoise.pal     20
#> 11        cartography      sand.pal     20
#> 12        cartography     taupe.pal     20
#> 13        cartography      kaki.pal     20
#> 14        cartography     harmo.pal     20
#> 15        cartography    pastel.pal     20
#> 16        cartography     multi.pal     20
#> 17      ggthemes_ptol   qualitative     12
#> 18 ggthemes_solarized        yellow      8
#> 19 ggthemes_solarized        orange      8
#> 20 ggthemes_solarized           red      8
#> 21 ggthemes_solarized       magenta      8
#> 22 ggthemes_solarized        violet      8
#> 23 ggthemes_solarized          blue      8
#> 24 ggthemes_solarized          cyan      8
#> 25 ggthemes_solarized         green      8
```
