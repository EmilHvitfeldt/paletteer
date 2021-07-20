library(magrittr)


## awtools --------------------------------------------------------------------
awtools_pals <- list(
  a_palette = awtools::a_palette,
  ppalette = awtools::ppalette,
  bpalette = awtools::bpalette,
  gpalette = awtools::gpalette,
  mpalette = awtools::mpalette,
  spalette = awtools::spalette
)

## basetheme ------------------------------------------------------------------
basetheme_pals <- list(
  brutal = basetheme:::basetheme_brutal()$palette.labels,
  clean = basetheme:::basetheme_clean()$palette.labels,
  dark = basetheme:::basetheme_dark()$palette.labels,
  deepblue = basetheme:::basetheme_deepblue()$palette.labels,
  ink = basetheme:::basetheme_ink()$palette.labels,
  minimal = basetheme:::basetheme_minimal()$palette.labels,
  royal = basetheme:::basetheme_royal()$palette.labels,
  void = basetheme:::basetheme_void()$palette.labels
)

## beyonce --------------------------------------------------------------------
beyonce_pals <- setNames(
  beyonce::beyonce_palettes,
  seq_along(beyonce::beyonce_palettes)
)

## calecopal ------------------------------------------------------------------
calecopal_pals <- calecopal::cal_palettes

## colorBlindness -------------------------------------------------------------
colorBlindness_pals <- list(
  paletteMartin = colorBlindness::paletteMartin,
  Blue2DarkOrange12Steps = colorBlindness::Blue2DarkOrange12Steps,
  Blue2DarkOrange18Steps = colorBlindness::Blue2DarkOrange18Steps,
  Blue2DarkRed12Steps = colorBlindness::Blue2DarkRed12Steps,
  Blue2DarkRed18Steps = colorBlindness::Blue2DarkRed18Steps,
  Blue2Gray8Steps = colorBlindness::Blue2Gray8Steps,
  Blue2Green14Steps = colorBlindness::Blue2Green14Steps,
  Blue2Orange10Steps = colorBlindness::Blue2Orange10Steps,
  Blue2Orange12Steps = colorBlindness::Blue2Orange12Steps,
  Blue2Orange8Steps = colorBlindness::Blue2Orange8Steps,
  Blue2OrangeRed14Steps = colorBlindness::Blue2OrangeRed14Steps,
  Brown2Blue10Steps = colorBlindness::Brown2Blue10Steps,
  Brown2Blue12Steps = colorBlindness::Brown2Blue12Steps,
  Green2Magenta16Steps = colorBlindness::Green2Magenta16Steps,
  LightBlue2DarkBlue10Steps = colorBlindness::LightBlue2DarkBlue10Steps,
  LightBlue2DarkBlue7Steps = colorBlindness::LightBlue2DarkBlue7Steps,
  ModifiedSpectralScheme11Steps = colorBlindness::ModifiedSpectralScheme11Steps,
  PairedColor12Steps = colorBlindness::PairedColor12Steps,
  SteppedSequential5Steps = colorBlindness::SteppedSequential5Steps
)

## colorblindr ----------------------------------------------------------------
colorblindr_pals <- list(
  OkabeIto = colorblindr::palette_OkabeIto,
  OkabeIto_black = colorblindr::palette_OkabeIto_black
)

## colRoz ---------------------------------------------------------------------
colRoz_pals <- purrr::reduce(lapply(colRoz::oz_palettes, function(y) lapply(y, function(x) x[1, ])), c)

## dichromat ------------------------------------------------------------------
dichromat_pals <- dichromat::colorschemes

## DresdenColor ---------------------------------------------------------------

DresdenColor_pals <- c(lapply(
  DresdenColor::dresden_palettes[names(DresdenColor::dresden_palettes) != "paired"],
  function(x) x[1, ]
),
paired = list(DresdenColor::dresden_palettes$paired)
)

## dutchmasters ---------------------------------------------------------------
dutchmasters_pals <- lapply(dutchmasters::dutchmasters, unname)

## fishualize -----------------------------------------------------------------
fishualize_pals <- split(
  as.character(fishualize::fishcolors$hex),
  fishualize::fishcolors$option
)

## fishualize -----------------------------------------------------------------
futurevisions_names <- c(
  "venus", "earth", "mars", "jupiter", "ceres",
  "enceladus", "europa", "titan", "cancri", "hd",
  "kepler186", "kepler16b", "pegasi", "pso", "trappest",
  "grand_tour", "atomic_clock", "atomic_red",
  "atomic_blue", "atomic_orange"
)

names(futurevisions_names) <- futurevisions_names

futurevisions_pals <- lapply(futurevisions_names, futurevisions::futurevisions)

## ggpomological --------------------------------------------------------------
ggpomological_pals <- list(
  pomological_base = unname(unlist(ggpomological:::pomological_base)),
  pomological_palette = unname(unlist(ggpomological:::pomological_palette))
)

## ggsci ----------------------------------------------------------------------
ggsci_names <- mapply(
  function(x, y) {
    paste(names(x), y, sep = "_")
  },
  ggsci:::ggsci_db,
  names(ggsci:::ggsci_db)
) %>%
  unlist() %>%
  unname()
ggsci_pals <- lapply(purrr::flatten(ggsci:::ggsci_db), unname)
names(ggsci_pals) <- ggsci_names

## ggthemes -------------------------------------------------------------------

## ggthemes tableau
ggthemes_tableau_pals <- lapply(
  ggthemes::ggthemes_data$tableau$`color-palettes`$regular,
  function(x) x$value
)

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
ggthemes_stata_pals <- lapply(
  ggthemes::ggthemes_data$stata$colors$schemes,
  function(x) x$value
)
names(ggthemes_stata_pals) <- paste("stata", names(ggthemes_stata_pals), sep = "_")
names(ggthemes_stata_pals) <- gsub(" ", "_", names(ggthemes_stata_pals))

## ggthemes hc
ggthemes_hc_pals <- ggthemes::ggthemes_data$hc
names(ggthemes_hc_pals) <- paste("hc", names(ggthemes_hc_pals), sep = "_")
names(ggthemes_hc_pals) <- gsub(" ", "_", names(ggthemes_hc_pals))

## ggthemes economist
ggthemes_economist_pals <- lapply(
  ggthemes::ggthemes_data$economist,
  function(x) x$value
)
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

## ggthemr --------------------------------------------------------------------

ggthemr_pals <- lapply(ggthemr:::palettes, function(x) unclass(x$swatch))

## ghibli ---------------------------------------------------------------------
ghibli_pals <- ghibli::ghibli_palettes

## grDevices ------------------------------------------------------------------
grDevices_pals <- list(blues9 = grDevices::blues9)

## IslamicArt -----------------------------------------------------------------
IslamicArt_pals <- IslamicArt::islamic_palettes

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

## khroma ---------------------------------------------------------------------
khroma_pals <- lapply(khroma:::.schemes, function(x) unname(x$colours))

## LaCroixColoR ---------------------------------------------------------------
LaCroixColoR_pals <- c(
  lapply(LaCroixColoR::lacroix_palettes[1:20], function(x) {
    x[1, ]
  }),
  list(paired = LaCroixColoR::lacroix_palettes$paired)
)

## Lisa -----------------------------------------------------------------------
lisa_pals <- lisa::lisa

## Manu -----------------------------------------------------------------------
Manu_pals <- Manu::manu_palettes

## MapPalettes ----------------------------------------------------------------
MapPalettes_pals <- lapply(MapPalettes:::names, MapPalettes::map_palette)
names(MapPalettes_pals) <- MapPalettes:::names

## miscpalettes ---------------------------------------------------------------
miscpalettes_pals <- c(
  miscpalettes::artistic,
  miscpalettes::mschart
)

## nationalparkcolors ---------------------------------------------------------
nationalparkcolors_pals <- nationalparkcolors::park_palettes

## nbapalettes ----------------------------------------------------------------
nbapalettes_pals <- nbapalettes::nba_palettes

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

## palettesForR ---------------------------------------------------------------
library(palettesForR)
palettesForR_names <- ls(pos = "package:palettesForR", pattern = "_gpl")
palettesForR_pals <- lapply(palettesForR_names, get, pos = "package:palettesForR")
palettesForR_pals <- lapply(palettesForR_pals, unname)
names(palettesForR_pals) <- stringr::str_remove(palettesForR_names, "_gpl")

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

## PNWColors ------------------------------------------------------------------
PNWColors_pals <- lapply(PNWColors::pnw_palettes, function(x) x[1, ])

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

## rcartocolor ----------------------------------------------------------------
rcartocolors_pals <- lapply(
  rcartocolor::cartocolors$Name,
  function(x) rcartocolor::carto_pal(name = x)
)
names(rcartocolors_pals) <- rcartocolor::cartocolors$Name

## rcolorbrewer ---------------------------------------------------------------
RColorBrewer_name <- rownames(RColorBrewer::brewer.pal.info)
RColorBrewer_ncolor <- RColorBrewer::brewer.pal.info$maxcolors
rcolorbrewer_pals <- mapply(RColorBrewer::brewer.pal,
  n = RColorBrewer_ncolor,
  name = RColorBrewer_name
)
names(rcolorbrewer_pals) <- RColorBrewer_name

## redmonder ------------------------------------------------------------------
redmonder_name <- rownames(Redmonder::redmonder.pal.info)
redmonder_ncolor <- Redmonder::redmonder.pal.info$maxcolors
redmonder_pals <- mapply(Redmonder::redmonder.pal, n = redmonder_ncolor, name = redmonder_name)
names(redmonder_pals) <- redmonder_name

## rockthemes -----------------------------------------------------------------
rockthemes_pals <- rockthemes:::rock_palettes

## RSkittleBrewer -------------------------------------------------------------
RSkittleBrewer_name <- c("original", "tropical", "wildberry", "M&M", "smarties")
RSkittleBrewer_pals <- lapply(
  mapply(RSkittleBrewer::RSkittleBrewer,
    flavor = RSkittleBrewer_name
  ),
  unname
)

## rtist ----------------------------------------------------------------------
rtist_pals <- rtist::rtist_palettes

## soilpalettes ---------------------------------------------------------------
soilpalettes_pals <- lapply(soilpalettes::soil_palettes, function(x) x[1, ])

## suffrager ------------------------------------------------------------------
suffrager_pals <- suffrager::suf_palettes

## tidyquant ------------------------------------------------------------------
tidyquant_pals <- list(
  tq_light = tidyquant::palette_light(),
  tq_dark = tidyquant::palette_dark(),
  tq_green = tidyquant::palette_green()
)

## trekcolors -----------------------------------------------------------------
trekcolors_pals <- trekcolors::trekpals

## tvthemes ------------------------------------------------------------------
tvthemes_pals <- c(
  attackOnTitan = list(tvthemes:::attackOnTitan_palette),
  tvthemes:::theLastAirbender_palette,
  bigHero6 = list(tvthemes:::bigHero6_palette),
  tvthemes:::brooklyn99_palette,
  gravityFalls = list(tvthemes:::gravityFalls_palette),
  tvthemes:::hilda_palette,
  kimPossible = list(tvthemes:::kimPossible_palette),
  parksAndRec = list(tvthemes:::parksAndRec_palette),
  rickAndMorty = list(tvthemes:::rickAndMorty_palette),
  simpsons = list(tvthemes:::simpsons_palette),
  spongeBob = list(tvthemes:::spongeBob_palette),
  tvthemes:::westeros_palette
)

## unikn ----------------------------------------------------------------------
unikn_pals <- lapply(unikn:::all_palkn, function(x) unname(unlist(getFromNamespace(x, ns = "unikn"))))
names(unikn_pals) <- unikn:::all_palkn

## vapeplot ------------------------------------------------------------------
vapeplot_pals <- vapeplot::vapeplot_palettes

## vapoRwave -------------------------------------------------------------------
vapoRwave_pals <- list(
  avanti = vapoRwave:::avanti_palette,
  cool = vapoRwave:::cool_palette,
  crystalPepsi = vapoRwave:::crystalPepsi_palette,
  floralShoppe = vapoRwave:::floralShoppe_palette,
  hotlineBling = vapoRwave:::hotlineBling_palette,
  hyperBubble = vapoRwave:::hyperBubble_palette,
  jazzCup = vapoRwave:::jazzCup_palette,
  jwz = vapoRwave:::jwz_palette,
  macPlus = vapoRwave:::macPlus_palette,
  mallSoft = vapoRwave:::mallSoft_palette,
  newRetro = vapoRwave:::newRetro_palette,
  seaPunk = vapoRwave:::seaPunk_palette,
  sunSet = vapoRwave:::sunSet_palette,
  vapoRwave = vapoRwave:::vapoRwave_palette
)

## werpals --------------------------------------------------------------------
werpals_pals <- lapply(
  c(
    werpals::disney_palettes[names(werpals::disney_palettes) != "main"],
    werpals::nature_palettes[names(werpals::nature_palettes) != "main"]
  ),
  unname
)

## wesanderson ----------------------------------------------------------------
wesanderson_pals <- wesanderson::wes_palettes

## yarrr ----------------------------------------------------------------------
yarrr_names <- yarrr::piratepal("names")
yarrr_pals <- mapply(yarrr::piratepal, yarrr_names) %>%
  lapply(unname)

# discrete fixed number of colors ---------------------------------------------
palettes_d <- list(
  awtools = awtools_pals,
  basetheme = basetheme_pals,
  beyonce = beyonce_pals,
  calecopal = calecopal_pals,
  colorBlindness = colorBlindness_pals,
  colorblindr = colorblindr_pals,
  colRoz = colRoz_pals,
  dichromat = dichromat_pals,
  dutchmasters = dutchmasters_pals,
  DresdenColor = DresdenColor_pals,
  fishualize = fishualize_pals,
  futurevisions = futurevisions_pals,
  ggsci = ggsci_pals,
  ggpomological = ggpomological_pals,
  ggthemes = ggthemes_pals,
  ggthemr = ggthemr_pals,
  ghibli = ghibli_pals,
  grDevices = grDevices_pals,
  IslamicArt = IslamicArt_pals,
  khroma = khroma_pals,
  jcolors = jcolors_pals,
  LaCroixColoR = LaCroixColoR_pals,
  lisa = lisa_pals,
  nationalparkcolors = nationalparkcolors_pals,
  nbapalettes = nbapalettes_pals,
  NineteenEightyR = NineteenEightyR_pals,
  nord = nord_pals,
  ochRe = ochRe_pals,
  palettetown = palettetown_pals,
  pals = pals_pals,
  Polychrome = Polychrome_pals,
  Manu = Manu_pals,
  MapPalettes = MapPalettes_pals,
  miscpalettes = miscpalettes_pals,
  palettesForR = palettesForR_pals,
  PNWColors = PNWColors_pals,
  rcartocolor = rcartocolors_pals,
  RColorBrewer = rcolorbrewer_pals,
  Redmonder = redmonder_pals,
  rockthemes = rockthemes_pals,
  RSkittleBrewer = RSkittleBrewer_pals,
  rtist = rtist_pals,
  soilpalettes = soilpalettes_pals,
  suffrager = suffrager_pals,
  tidyquant = tidyquant_pals,
  trekcolors = trekcolors_pals,
  tvthemes = tvthemes_pals,
  unikn = unikn_pals,
  vapeplot = vapeplot_pals,
  vapoRwave = vapoRwave_pals,
  werpals = werpals_pals,
  wesanderson = wesanderson_pals,
  yarrr = yarrr_pals
)

remove_non_ascii_names <- function(x) {
  names(x) <- janitor::make_clean_names(names(x), case = "none")
  lapply(x, as.character)
}

palettes_d <- lapply(palettes_d, remove_non_ascii_names)

usethis::use_data(palettes_d, overwrite = TRUE)
