# gt

<details>

* Version: 0.10.1
* GitHub: https://github.com/rstudio/gt
* Source code: https://github.com/cran/gt
* Date/Publication: 2024-01-17 23:50:05 UTC
* Number of recursive dependencies: 109

Run `revdepcheck::revdep_details(, "gt")` for more info

</details>

## Newly broken

*   checking installed package size ... NOTE
    ```
      installed size is  5.9Mb
      sub-directories of 1Mb or more:
        R      2.4Mb
        help   1.8Mb
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 146 marked UTF-8 strings
    ```

# spatialLIBD

<details>

* Version: 1.14.1
* GitHub: https://github.com/LieberInstitute/spatialLIBD
* Source code: https://github.com/cran/spatialLIBD
* Date/Publication: 2023-11-30
* Number of recursive dependencies: 223

Run `revdepcheck::revdep_details(, "spatialLIBD")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘spatialLIBD-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add_images
    > ### Title: Add non-standard images with the same dimensions as current ones
    > ### Aliases: add_images
    > 
    > ### ** Examples
    > 
    > if (enough_ram()) {
    ...
    +     ## Add an image
    +     SpatialExperiment::imgData(add_images(
    +         spe,
    +         image_id_current = "lowres",
    +         image_id = "lowres_aws",
    +         image_paths = c("151507" = "https://spatial-dlpfc.s3.us-east-2.amazonaws.com/images/151507_tissue_lowres_image.png")
    +     ))
    + }
    Error: table metadata already exists
    Execution halted
    ```

## In both

*   checking whether package ‘spatialLIBD’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘SingleCellExperiment’ was built under R version 4.3.2
      Warning: package ‘SummarizedExperiment’ was built under R version 4.3.2
      Warning: package ‘S4Vectors’ was built under R version 4.3.2
      Warning: package ‘GenomeInfoDb’ was built under R version 4.3.2
    See ‘/Users/emilhvitfeldt/Github/paletteer/revdep/checks.noindex/spatialLIBD/new/spatialLIBD.Rcheck/00install.out’ for details.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 15.3Mb
      sub-directories of 1Mb or more:
        doc   10.9Mb
        help   3.7Mb
    ```

