# Adding discrete package

In `data-raw/palettes_d.R` add a function (ordered alphabetically) in the format:  

```
## <package>
<package>_pals <- …
```

Where <package>_pals should be a single level named list of palettes. Add the list to the `palettes_d` list in the end of the document and run the full script.  

run script `data-raw/palettes_d_names.R`.

In the file `R/data.R` update the format for `palettes_d` and `palettes_d_names` with 
`length(palettes_d)` and `nrow(palettes_d_names)` respectively.  

run `devtools::document()`.  

Include license reference in `LICENSE` file

Include reference in the end of README.Rmd and knit to finish.
