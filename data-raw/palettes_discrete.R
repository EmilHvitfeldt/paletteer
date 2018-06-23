library(magrittr)

## awtools
awtools_pals <- list(
  a_palette = awtools:::a_palette,
  a_spalette = awtools:::a_spalette,
  mpalette = awtools:::mpalette,
  ppalette = awtools:::ppalette,
  spalette = awtools:::spalette
)

## dichromat
dichromat_pals <- dichromat::colorschemes

## dutchmasters
dutchmasters_pals <- lapply(dutchmasters::dutchmasters, unname)

## ggsci
ggsci_names <- mapply(function(x, y)
  paste(names(x), y, sep = "_"),
  ggsci:::ggsci_db,
  names(ggsci:::ggsci_db)) %>%
  unlist() %>%
  unname()
ggsci_pals <- lapply(purrr::flatten(ggsci:::ggsci_db), unname)
names(ggsci_pals) <- ggsci_names

## ggpomological
ggpomological_pals <- list(
  pomological_base = unname(unlist(ggpomological:::pomological_base)),
  pomological_palette = unname(unlist(ggpomological:::pomological_palette))
)

## ggthemes excel
ggthemes_excel_pals <- lapply(ggthemes::ggthemes_data$excel$themes,
                              function(x) x[["accents"]])
names(ggthemes_excel_pals) <- paste("excel", names(ggthemes_excel_pals), sep = "_")

## ggthemes tableau
ggthemes_tableau_pals <- lapply(ggthemes::ggthemes_data$tableau$`color-palettes`$regular,
                                function(x) x[["value"]])
names(ggthemes_tableau_pals) <- paste("tableau", names(ggthemes_tableau_pals), sep = "_")

ggthemes_pals <- c(
  list(
    calc = ggthemes::ggthemes_data$calc$colors$value,
    colorblind = ggthemes::ggthemes_data$colorblind$value,
    economist_bg = ggthemes::ggthemes_data$economist$bg$value,
    economist_fg = ggthemes::ggthemes_data$economist$fg$value
  ),
  ggthemes_excel_pals,
  list(
    few_light = ggthemes::ggthemes_data$few$colors$Light$value,
    few_medium = ggthemes::ggthemes_data$few$colors$Medium$value,
    few_dark = ggthemes::ggthemes_data$few$colors$Dark$value,
    fivethirtyeight = ggthemes::ggthemes_data$fivethirtyeight$value,
    gdocs = ggthemes::ggthemes_data$gdocs$colors$value,
    hc_default = ggthemes::ggthemes_data$hc$default,
    hc_darkunica = ggthemes::ggthemes_data$hc$darkunica,
    solarized_base = unlist(lapply(ggthemes::ggthemes_data$solarized$Base,
                                   function(x)
                                     x[["value"]])),
    solarized_accents = unlist(
      lapply(ggthemes::ggthemes_data$solarized$Accents,
             function(x)
               x[["value"]])
    ),
    stata_s2color = ggthemes::ggthemes_data$stata$colors$schemes$s2color$value,
    stata_s1rcolor = ggthemes::ggthemes_data$stata$colors$schemes$s1rcolor$value,
    stata_s1color = ggthemes::ggthemes_data$stata$colors$schemes$s1color$value,
    stata_mono = ggthemes::ggthemes_data$stata$colors$schemes$mono$value,
    wsj_rgby = ggthemes::ggthemes_data$wsj$palettes$rgby$value,
    wsj_red_green = ggthemes::ggthemes_data$wsj$palettes$red_green$value,
    wsj_black_green = ggthemes::ggthemes_data$wsj$palettes$black_green$value,
    wsj_dem_rep = ggthemes::ggthemes_data$wsj$palettes$dem_rep$value,
    wsj_colors6 = ggthemes::ggthemes_data$wsj$palettes$colors6$value
  ),
  ggthemes_tableau_pals
)

## ghibli
ghibli_pals <- ghibli::ghibli_palettes

## grDevices
grDevices_pals <- list(blues9 = grDevices::blues9)

## jcolors
jcolors_pals <- lapply(
  list(
    default = jcolors::jcolors(palette = "default"),
    pal2 = jcolors::jcolors(palette = "pal2"),
    pal3 = jcolors::jcolors(palette = "pal3"),
    pal4 = jcolors::jcolors(palette = "pal4"),
    pal5 = jcolors::jcolors(palette = "pal5"),
    pal6 = jcolors::jcolors(palette = "pal6"),
    pal7 = jcolors::jcolors(palette = "pal7"),
    pal8 = jcolors::jcolors(palette = "pal8"),
    pal9 = jcolors::jcolors(palette = "pal9"),
    pal10 = jcolors::jcolors(palette = "pal10"),
    pal11 = jcolors::jcolors(palette = "pal11"),
    pal12 = jcolors::jcolors(palette = "pal12"),
    rainbow = jcolors::jcolors(palette = "rainbow")
  ),
  unname
)

## LaCroixColoR
LaCroixColoR_pals <- c(
  lapply(LaCroixColoR::lacroix_palettes[1:20], function(x)
    x[1,]),
  list(paired = LaCroixColoR::lacroix_palettes$paired)
)

## NineteenEightyR
NineteenEightyR_pals <- list(
  cobra = NineteenEightyR::cobra(),
  electronic_night = NineteenEightyR::electronic_night(),
  hotpink = NineteenEightyR::hotpink(),
  malibu = NineteenEightyR::malibu(),
  miami1 = NineteenEightyR::miami1(),
  miami2 = NineteenEightyR::miami2(),
  seventies_aint_done_yet = NineteenEightyR::seventies_aint_done_yet(),
  sonny = NineteenEightyR::sonny(),
  sunset1 = NineteenEightyR::sunset1(),
  sunset2 = NineteenEightyR::sunset2(),
  sunset3 = NineteenEightyR::sunset3(),
  youngturqs = NineteenEightyR::youngturqs()
)

## nord
nord_pals <- nord:::nord_palettes

## ochRe
ochRe_pals <- ochRe::ochre_palettes

## pals
pals_pals <- lapply(
  list(
    alphabet = pals::alphabet(),
    alphabet2 = pals::alphabet2(),
    glasbey = pals::glasbey(),
    kelly = pals::kelly(),
    polychrome = pals::polychrome(),
    stepped = pals::stepped(),
    tol = pals::tol(),
    watlington = pals::watlington()
  ),
  unname
)

## Polychrome
Polychrome_pals <- lapply(
  list(
    alphabet = Polychrome::alphabet.colors(),
    dark = Polychrome::dark.colors(),
    glasbey = Polychrome::glasbey.colors(),
    green.armytage = Polychrome::green.armytage.colors(),
    kelly = Polychrome::kelly.colors(),
    light = Polychrome::light.colors(),
    palette36 = Polychrome::palette36.colors()
  ),
  unname
)

## quickpalette
quickpalette_pals <- c(quickpalette:::qp_art,
                       quickpalette:::mschart)

## rcartocolor
rcartocolors_pals <- lapply(rcartocolor::cartocolors$Name,
                            function(x) rcartocolor::carto_pal(name = x))
names(rcartocolors_pals) <- rcartocolor::cartocolors$Name

## rcolorbrewer
RColorBrewer_name <- rownames(RColorBrewer::brewer.pal.info)
RColorBrewer_ncolor <- RColorBrewer::brewer.pal.info$maxcolors
rcolorbrewer_pals <- mapply(RColorBrewer::brewer.pal, n = RColorBrewer_ncolor,
                            name = RColorBrewer_name)
names(rcolorbrewer_pals) <- RColorBrewer_name

## redmonder
redmonder_name <- rownames(Redmonder::redmonder.pal.info)
redmonder_ncolor <- Redmonder::redmonder.pal.info$maxcolors
redmonder_pals <- mapply(Redmonder::redmonder.pal, n = redmonder_ncolor, name = redmonder_name)
names(redmonder_pals) <- redmonder_name

## RSkittleBrewer
RSkittleBrewer_name <- c("original", "tropical", "wildberry", "M&M", "smarties")
RSkittleBrewer_pals <- lapply(mapply(RSkittleBrewer::RSkittleBrewer,
                                     flavor = RSkittleBrewer_name),
                              unname)

## wesanderson
wesanderson_pals <- wesanderson::wes_palettes

## yarrr
yarrr_names <- yarrr::piratepal("names")
yarrr_pals <- mapply(yarrr::piratepal, yarrr_names) %>%
  lapply(unname)

# discrete fixed number of colors
palettes_discrete <- list(
  awtools = awtools_pals,
  dichromat = dichromat_pals,
  dutchmasters = dutchmasters_pals,
  ggsci = ggsci_pals,
  ggpomological = ggpomological_pals,
  ggthemes = ggthemes_pals,
  ghibli = ghibli_pals,
  grDevices = grDevices_pals,
  jcolors = jcolors_pals,
  LaCroixColoR = LaCroixColoR_pals,
  NineteenEightyR = NineteenEightyR_pals,
  nord = nord_pals,
  ochRe = ochRe_pals,
  pals = pals_pals,
  Polychrome = Polychrome_pals,
  quickpalette = quickpalette_pals,
  rcartocolor = rcartocolors_pals,
  RColorBrewer = rcolorbrewer_pals,
  Redmonder = redmonder_pals,
  RSkittleBrewer = RSkittleBrewer_pals,
  wesanderson = wesanderson_pals,
  yarrr = yarrr_pals
)

usethis::use_data(palettes_discrete)
