---
title: "site-report-template"
author: "Rick Gilmore"
date: "2019-10-01 17:21:53"
output: 
  html_document:
    keep_md: true
    theme: lumen
    toc: true
    toc_depth: 4
    toc_float: true
    code_folding: hide
params:
  vol_id: 881
  databrary_login: account@email.com
---



## Purpose

This document provides a template for how a site-specific progress report might be generated using the Databrary API and other sources.

## Set-up

### Log in to Databrary

Some of the functions require authentication to Databrary.
For this to work, you need to have entered your Databrary credentials into your own computer's credentials file.
On Mac OS, this is called Keychain.
If you have installed the `databraryapi` package, running `databraryapi::config_passwd()` will accept and store your credentials properly.

Once you have done that, you may render this file securely by executing the following code from the R consol
You will need to substitute your actual Databrary login ID for "myemail\@email.com".

```
rmarkdown::render("site-report-template.Rmd", params = list(databrary_login = "myemail@email.com")
```


```r
if (databraryapi::login_db(params$databrary_login)) {
  message("Authenticated to Databrary")
} else {
  message("Authentication failure.")
}
```

```
## Login successful.
```

```
## Authenticated to Databrary
```


### Get basic data about the volume


```r
vol_data <- databraryapi::list_volume_metadata(as.numeric(params$vol_id))

if (!is.null(vol_data)) {
  message(paste0("Progress report for volume ", as.character(vol_data$vol_id)))
  message(paste0("Volume name: ", vol_data$name))
  message(paste0("Investigators: ", vol_data$owners))
} else {
  message(paste0("Error in retrieving metadata from volume ", params$site_upload_vol_id))
}
```

```
## Progress report for volume 881
```

```
## Volume name: PLAY-collection-test
```

```
## Investigators: Gilmore, Rick O.; Jayaraman, Swapnaa
```

Note, we can also put these variables in headers, like this:

### Volume 881 : PLAY-collection-test

## Sessions created

If we have `read` privileges on the volume, we can see details about any sessions that have been created.


```r
these_sessions <- databraryapi::list_sessions(as.numeric(params$vol_id))
these_sessions %>%
  knitr::kable(.)
```

      session_id  top   date          release   vol_id
---  -----------  ----  -----------  --------  -------
2          35578  NA    2019-04-08          2      881
3          35579  NA    2019-03-31          2      881
4          35580  NA    2018-02-01         NA      881

## Spreadsheet data


```r
this_volume <- databraryapi::download_containers_records(as.numeric(params$vol_id))

this_ss <- this_volume$records$measures

this_ss <- this_ss %>%
  filter(`1` != 1) # Weird, I know but filtering drops var names

this_ss %>%
  knitr::kable(.)
```



1         4            5        6                           7                        11        12       
--------  -----------  -------  --------------------------  -----------------------  --------  ---------
001_003   2018-12-25   Female   Asian                       Not Hispanic or Latino   typical   Mandarin 
001_002   2005-04-10   Female   Black or African American   Not Hispanic or Latino   typical   Spanish  
001_001   1963-07-21   Male     White                       Not Hispanic or Latino   typical   English  

## Videos uploaded


```r
databraryapi::list_assets_by_type(as.numeric(params$vol_id))
```

```
## NULL
```

## All files uploaded


```r
files <- databraryapi::list_assets_in_volume(as.numeric(params$vol_id))

files %>%
  knitr::kable(.)
```



 asset_id   asset_type_id   classification  name                               permission     size   vol_id   session_id  mimetype          extension   asset_type                transcodable
---------  --------------  ---------------  --------------------------------  -----------  -------  -------  -----------  ----------------  ----------  -----------------------  -------------
   167716               6                3  gilmore-adolph-nat-hum-beh-2017             5   228806      881        35580  application/pdf   pdf         Portable document                   NA
   167715               2                0  2019-04-08                                  5      101      881        35580  text/csv          csv         Comma-separated values              NA

