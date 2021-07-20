Start by running `data-raw/install_packages.R` to install all needed packages.

# Adding discrete palettes

In `data-raw/palettes_d.R` add a function (ordered alphabetically) in the format:  

```
## <package>
<package>_pals <- …
```

Where <package>_pals should be a single level named list of palettes. Add the list to the `palettes_d` list in the end of the document and run the full script.  

run script `data-raw/palettes_d_names.R`.

run `devtools::document()`.  

Include license reference in `LICENSE` file.

Include package information in `data-raw/package`.

reknit readme.

add instalation information to `data-raw/install_packages.R`.

Include bullet in `NEWS.md` file.

## Github issue template

- [ ] Modify `data-raw/palettes_d.R`
- [ ] run `data-raw/palettes_d_names.R` script
- [ ] run `devtools::document()`
- [ ] Include license reference in `LICENSE` file.
- [ ] Include package information in `data-raw/packages` and run.
- [ ] reknit readme.
- [ ] Include bullet in `NEWS.md` file.
- [ ] run `data-raw/palette_names.R` 

# Adding continuous palettes

Make sure to only 

In `paletteer_c_wrappers.R` include a wrapper function in the format

```
paletteer_c_<package name> <- function(name, n) {
  ... your code goes here

  pal_gen(n = n)
}
```

with the input variables `name` and `n` and the output that number of colors of the target color palette.  

In the same file, add the wrapper to the list in the end of the file.

In the file `data-raw/palettes_c_names.R` create a data.frame with 3 variables. `package` which should be the name of the package, `palette` which should be the name of the palette` and type` which should be "sequential" or "diverging".  

Open the `data.R` file and update the documentation for `palettes_c_names`. Packages are listed alphabetical. Remember to modify the number of total palettes.  

Add the package to Imports in the `DESCRIPTION` file.  

Include license reference in `LICENSE` file  

Include package information in `data-raw/package`.

reknit readme.

add instalation information to `data-raw/install_packages.R`.

Include bullet in `NEWS.md` file.
