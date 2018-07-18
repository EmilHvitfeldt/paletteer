library(tibble)
library(purrr)
library(dplyr)
library(paletteer)

single_qualitative <- c("Categorical.12", "nrc_npg", "default_aaas",
                        "default_nejm", "lanonc_lancet", "default_jama", "default_jco",
                        "default_ucscgb", "category10_d3", "category20_d3", "category20b_d3",
                        "category20c_d3", "default_igv", "alternating_igv", "default_locuszoom",
                        "default_uchicago", "light_uchicago", "dark_uchicago",
                        "springfield_simpsons", "planetexpress_futurama", "schwifty_rickandmorty",
                        "uniform_startrek", "legacy_tron", "calc", "colorblind", "economist_bg",
                        "economist_fg", "excel_line", "excel_fill", "excel_new", "few_light",
                        "few_medium", "few_dark", "fivethirtyeight", "gdocs", "hc_default",
                        "hc_darkunica", "solarized_accents", "stata_colors", "wsj_rgby",
                        "wsj_red_green", "wsj_black_green", "wsj_dem_rep", "wsj_colors6",
                        "tableau_tableau20", "tableau_tableau10medium", "tableau_gray5",
                        "tableau_colorblind10", "tableau_trafficlight", "tableau_purplegray12",
                        "tableau_bluered12", "tableau_greenorange12", "default", "pal2", "pal3",
                        "pal4", "pal5", "pal6", "pal7", "pal8", "pal9", "rainbow", "frost",
                        "aurora", "lumina", "mountain_forms", "lake_superior", "victory_bonds",
                        "moose_pond", "algoma_forest", "rocky_mountain", "red_mountain",
                        "baie_mounton", "afternoon_prarie", "dreaming", "jojo", "beach",
                        "waterfall", "sunset", "bright", "excel", "light", "pastel", "earthTones",
                        "semiTransparent", "berry", "chocolate", "fire", "seaGreen", "brightPastel",
                        "Vivid", "Safe", "Prism", "Pastel", "Bold", "Antique", "Accent", "Dark2",
                        "Paired", "Pastel1", "Pastel2", "Set1", "Set2", "Set3", "qMSOStd", "qMSO12",
                        "qMSO15", "qMSOBuWarm", "qMSOBu", "qMSOBu2", "qMSOBuGn", "qMSOGn", "qMSOGnYl",
                        "qMSOYl", "qMSOYlOr", "qMSOOr", "qMSOOrRd", "qMSORdOr", "qMSORd", "qMSORdPu",
                        "qMSOPu2", "qMSOMed", "qMSOPap", "qMSOMrq", "qMSOSlp", "qMSOAsp", "qPBI",
                        "qMSOPu")
single_divergent <- c("BrowntoBlue.10", "BrowntoBlue.12", "BluetoDarkOrange.12",
                      "BluetoDarkOrange.18", "DarkRedtoBlue.12", "DarkRedtoBlue.18",
                      "BluetoGreen.14", "BluetoGray.8", "BluetoOrangeRed.14",
                      "BluetoOrange.10", "BluetoOrange.12", "BluetoOrange.8",
                      "GreentoMagenta.16", "default_gsea", "Red-Blue", "Red-Green",
                      "Red-White-Green", "Red-Black", "Red-White-Black", "Green-Blue",
                      "Orange-Blue", "Orange-White-Blue", "Red-Green Light",
                      "Red-White-Green Light", "Red-White-Black Light",
                      "Orange-Blue Light", "Orange-White-Blue Light", "Orange-Blue",
                      "Light Red-Green", "Temperature", "cm.colors", "blueyellow",
                      "cyanyellow", "redgreen", "coolwarm", "warmcool", "Tropic",
                      "Temps", "TealRose", "Geyser", "Fall", "Earth", "ArmyRose",
                      "BrBG", "PiYG", "PRGn", "PuOr", "RdBu", "RdGy", "RdYlBu",
                      "RdYlGn", "Spectral", "dPBIYlBu", "dPBIYlPu", "dPBIPuGn",
                      "dPBIPuOr", "dPBIRdBu", "dPBIRdGy", "dPBIRdGn", "silver_mine",
                      "baie_mouton")

palettes_d_names <- purrr::imap_dfr(palettes_d,
                                           ~ data.frame(package = .y,
                                                        palette = names(.x),
                                                        length = sapply(.x, length),
                                                        stringsAsFactors = FALSE)) %>%
  tibble::remove_rownames() %>%
  dplyr::mutate(type = case_when(package %in% c("awtools", "dutchmasters",
                                                "ggpomological", "ghibli",
                                                "LaCroixColoR", "NineteenEightyR",
                                                "ochRe", "palettetown", "pals",
                                                "Polychrome", "RSkittleBrewer",
                                                "wesanderson", "yarrr") ~ "qualitative",
                                 package %in% c("grDevices") ~ "sequential",
                                 palette %in% single_qualitative ~ "qualitative",
                                 palette %in% single_divergent ~ "diverging",
                                 TRUE ~ "sequential"))

usethis::use_data(palettes_d_names, overwrite = TRUE)
