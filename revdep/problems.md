# spatialLIBD

<details>

* Version: 1.22.0
* GitHub: https://github.com/LieberInstitute/spatialLIBD
* Source code: https://github.com/cran/spatialLIBD
* Date/Publication: 2025-11-04
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
    +         spe,
    +         image_id_current = "lowres",
    +         image_id = "lowres_aws",
    +         image_paths = c("151507" = "https://spatial-dlpfc.s3.us-east-2.amazonaws.com/images/151507_tissue_lowres_image.png")
    +     ))
    + }
    2026-01-07 11:11:12.444503 loading file /Users/emilhvitfeldt/Library/Caches/org.R-project.R/R/BiocFileCache/b4b51b7c4828_Human_DLPFC_Visium_processedData_sce_scran_spatialLIBD.Rdata%3Fdl%3D1
    Error in load(file_path, verbose = FALSE) : error reading from connection
    Calls: fetch_data ... sce_to_spe -> check_sce -> stopifnot -> is -> fetch_data -> load
    Execution halted
    ```

*   checking running R code from vignettes ...
    ```
      ‘TenX_data_download.Rmd’ using ‘UTF-8’... failed
      ‘guide_to_spatial_registration.Rmd’ using ‘UTF-8’... OK
      ‘multi_gene_plots.Rmd’ using ‘UTF-8’... OK
      ‘spatialLIBD.Rmd’ using ‘UTF-8’... OK
     ERROR
    Errors in running code in vignettes:
    when running code in ‘TenX_data_download.Rmd’
      ...
      rid: BFC19
      fpath: ‘ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_32/gencode.v32.annotation.gtf.gz’
      reason: download failed
    Warning in value[[3L]](cond) : 
    trying to add rname 'ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_32/gencode.v32.annotation.gtf.gz' produced error:
      bfcadd() failed; see warnings()
    
      When sourcing ‘TenX_data_download.R’:
    Error: not all 'rnames' found or unique.
    Execution halted
    ```

