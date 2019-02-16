library(magrittr)


## awtools --------------------------------------------------------------------
awtools_pals <- list(
  a_palette = awtools:::a_palette,
  a_spalette = awtools:::a_spalette,
  mpalette = awtools:::mpalette,
  ppalette = awtools:::ppalette,
  spalette = awtools:::spalette
)

## dichromat ------------------------------------------------------------------
dichromat_pals <- dichromat::colorschemes

## dutchmasters ---------------------------------------------------------------
dutchmasters_pals <- lapply(dutchmasters::dutchmasters, unname)

## ggsci ----------------------------------------------------------------------
ggsci_names <- mapply(function(x, y)
  paste(names(x), y, sep = "_"),
  ggsci:::ggsci_db,
  names(ggsci:::ggsci_db)) %>%
  unlist() %>%
  unname()
ggsci_pals <- lapply(purrr::flatten(ggsci:::ggsci_db), unname)
names(ggsci_pals) <- ggsci_names

## ggpomological --------------------------------------------------------------
ggpomological_pals <- list(
  pomological_base = unname(unlist(ggpomological:::pomological_base)),
  pomological_palette = unname(unlist(ggpomological:::pomological_palette))
)

## ggthemes -------------------------------------------------------------------

## ggthemes tableau
ggthemes_tableau_pals <- lapply(ggthemes::ggthemes_data$tableau$`color-palettes`$regular,
                                function(x) x$value)

## ggthemes few
ggthemes_few_pals <- lapply(ggthemes::ggthemes_data$few$colors, function(x) x$value)
names(ggthemes_few_pals) <- paste("few", names(ggthemes_few_pals), sep = "_")
names(ggthemes_few_pals) <- gsub(" ", "_", names(ggthemes_few_pals))

## ggthemes excel
ggthemes_excel_pals <- lapply(ggthemes::ggthemes_data$excel$themes, function(x) x$accents)
names(ggthemes_excel_pals) <- paste("excel", names(ggthemes_excel_pals), sep = "_")
names(ggthemes_excel_pals) <- gsub(" ", "_", names(ggthemes_excel_pals))

## ggthemes wsj
ggthemes_wsj_pals <- lapply(ggthemes::ggthemes_data$wsj$palettes, function(x) x$value)
names(ggthemes_wsj_pals) <- paste("wsj", names(ggthemes_wsj_pals), sep = "_")
names(ggthemes_wsj_pals) <- gsub(" ", "_", names(ggthemes_wsj_pals))

## ggthemes stata
ggthemes_stata_pals <- lapply(ggthemes::ggthemes_data$stata$colors$schemes,
                              function(x) x$value)
names(ggthemes_stata_pals) <- paste("stata", names(ggthemes_stata_pals), sep = "_")
names(ggthemes_stata_pals) <- gsub(" ", "_", names(ggthemes_stata_pals))

## ggthemes hc
ggthemes_hc_pals <- ggthemes::ggthemes_data$hc
names(ggthemes_hc_pals) <- paste("hc", names(ggthemes_hc_pals), sep = "_")
names(ggthemes_hc_pals) <- gsub(" ", "_", names(ggthemes_hc_pals))

## ggthemes economist
ggthemes_economist_pals <- lapply(ggthemes::ggthemes_data$economist,
                           function(x) x$value)
names(ggthemes_economist_pals) <- paste("hc", names(ggthemes_economist_pals), sep = "_")
names(ggthemes_economist_pals) <- gsub(" ", "_", names(ggthemes_economist_pals))

ggthemes_pals <- c(
  list(
    calc = ggthemes::ggthemes_data$calc$colors$value,
    manyeys = ggthemes::ggthemes_data$manyeyes,
    gdoc = ggthemes::ggthemes_data$gdocs$colors$value,
    fivethirtyeight = ggthemes::ggthemes_data$fivethirtyeight$value,
    colorblind = ggthemes::ggthemes_data$colorblind$value
  ),
  ggthemes_tableau_pals,
  ggthemes_few_pals,
  ggthemes_excel_pals,
  ggthemes_wsj_pals,
  ggthemes_stata_pals,
  ggthemes_hc_pals,
  ggthemes_economist_pals
)

## ghibli ---------------------------------------------------------------------
ghibli_pals <- ghibli::ghibli_palettes

## grDevices ------------------------------------------------------------------
grDevices_pals <- list(blues9 = grDevices::blues9)

## jcolors --------------------------------------------------------------------
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

## LaCroixColoR ---------------------------------------------------------------
LaCroixColoR_pals <- c(
  lapply(LaCroixColoR::lacroix_palettes[1:20], function(x)
    x[1,]),
  list(paired = LaCroixColoR::lacroix_palettes$paired)
)

## NineteenEightyR ------------------------------------------------------------
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

## nord -----------------------------------------------------------------------
nord_pals <- nord:::nord_palettes

## ochRe ----------------------------------------------------------------------
ochRe_pals <- ochRe::ochre_palettes

## palettetown ----------------------------------------------------------------
palettetown_pals <- palettetown:::pokeColours

## pals -----------------------------------------------------------------------
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

## Polychrome -----------------------------------------------------------------
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

## quickpalette ---------------------------------------------------------------
quickpalette_pals <- c(quickpalette:::qp_art,
                       quickpalette:::mschart)

## rcartocolor ----------------------------------------------------------------
rcartocolors_pals <- lapply(rcartocolor::cartocolors$Name,
                            function(x) rcartocolor::carto_pal(name = x))
names(rcartocolors_pals) <- rcartocolor::cartocolors$Name

## rcolorbrewer ---------------------------------------------------------------
RColorBrewer_name <- rownames(RColorBrewer::brewer.pal.info)
RColorBrewer_ncolor <- RColorBrewer::brewer.pal.info$maxcolors
rcolorbrewer_pals <- mapply(RColorBrewer::brewer.pal, n = RColorBrewer_ncolor,
                            name = RColorBrewer_name)
names(rcolorbrewer_pals) <- RColorBrewer_name

## redmonder ------------------------------------------------------------------
redmonder_name <- rownames(Redmonder::redmonder.pal.info)
redmonder_ncolor <- Redmonder::redmonder.pal.info$maxcolors
redmonder_pals <- mapply(Redmonder::redmonder.pal, n = redmonder_ncolor, name = redmonder_name)
names(redmonder_pals) <- redmonder_name

## RSkittleBrewer -------------------------------------------------------------
RSkittleBrewer_name <- c("original", "tropical", "wildberry", "M&M", "smarties")
RSkittleBrewer_pals <- lapply(mapply(RSkittleBrewer::RSkittleBrewer,
                                     flavor = RSkittleBrewer_name),
                              unname)

## tidyquant ------------------------------------------------------------------
tidyquant_pals <- list(
  tq_light = tidyquant::palette_light(),
  tq_dark = tidyquant::palette_dark(),
  tq_green = tidyquant::palette_green()
)

## wesanderson ----------------------------------------------------------------
wesanderson_pals <- wesanderson::wes_palettes

## yarrr ----------------------------------------------------------------------
yarrr_names <- yarrr::piratepal("names")
yarrr_pals <- mapply(yarrr::piratepal, yarrr_names) %>%
  lapply(unname)

## vapoRwave
vapoRwave_pals <- list(
  avanti = vapoRwave::avanti_palette,
  cool = vapoRwave::cool_palette,
  crystalPepsi = vapoRwave::crystalPepsi_palette,
  floralShoppe = vapoRwave::floralShoppe_palette,
  hotlineBling = vapoRwave::hotlineBling_palette,
  hyperBubble = vapoRwave::hyperBubble_palette,
  jazzCup = vapoRwave::jazzCup_palette,
  jwz = vapoRwave::jwz_palette,
  macPlus = vapoRwave::macPlus_palette,
  mallSoft = vapoRwave::mallSoft_palette,
  newRetro = vapoRwave::newRetro_palette,
  seaPunk = vapoRwave::seaPunk_palette,
  sunSet = vapoRwave::sunSet_palette
)
                            
# discrete fixed number of colors ---------------------------------------------
palettes_d <- list(
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
  palettetown = palettetown_pals,
  pals = pals_pals,
  Polychrome = Polychrome_pals,
  quickpalette = quickpalette_pals,
  rcartocolor = rcartocolors_pals,
  RColorBrewer = rcolorbrewer_pals,
  Redmonder = redmonder_pals,
  RSkittleBrewer = RSkittleBrewer_pals,
  tidyquant = tidyquant_pals,
  wesanderson = wesanderson_pals,
  yarrr = yarrr_pals,
  vapoRwave = vapoRwave_pals
)

usethis::use_data(palettes_d, overwrite = TRUE)
