---
title: "api-explorations-box"
author: "Rick Gilmore"
date: "2019-10-04 11:29:41"
output: 
  html_document:
    keep_md: true
    theme: lumen
    toc: true
    toc_depth: 4
    toc_float: true
    code_folding: show
---



## Purpose

This document explores the utility of using the Box.com API for file management.

## Set-up

The `boxr` package (https://github.com/r-box/boxr) provides the functionality we will be testing.

### Installing `boxr`


```r
if (!require("boxr")) {
  install.packages("boxr")
}
```

```
## Loading required package: boxr
```

```
## Welcome to boxr 0.3.4!
## Bug reports & Getting Help: https://github.com/brendan-R/boxr/issues
```

### Setting up Box for access by `boxr`

The instructions here--<https://r-box.github.io/boxr/>--are useful, especially those under the `Getting set up` section.

After creating the `PLAY-workflow` application, I entered the following code into an R console.


```r
boxr::box_auth()
```

```
## Reading client id from .Renviron
```

```
## Reading client secret from .Renviron
```

```
## boxr: Authenticated at box.com as Rick Gilmore (rog1@psu.edu)
```

After entering the credentials, I got a message that I am successfully logged in to Box.

## Testing `boxr` functions

### Creating a directory

Let's create a new directory to test the package's functions.


```r
play_dir_name <- "TEST-PLAY-workflow"
f <- boxr::box_dir_create(play_dir_name)
str(f)
```

```
## List of 22
##  $ type               : chr "folder"
##  $ id                 : chr "89160865905"
##  $ sequence_id        : chr "0"
##  $ etag               : chr "0"
##  $ name               : chr "TEST-PLAY-workflow"
##  $ created_at         : chr "2019-10-04T08:29:47-07:00"
##  $ modified_at        : chr "2019-10-04T08:29:47-07:00"
##  $ description        : chr ""
##  $ size               : int 0
##  $ path_collection    :List of 2
##   ..$ total_count: int 1
##   ..$ entries    :List of 1
##   .. ..$ :List of 5
##   .. .. ..$ type       : chr "folder"
##   .. .. ..$ id         : chr "0"
##   .. .. ..$ sequence_id: NULL
##   .. .. ..$ etag       : NULL
##   .. .. ..$ name       : chr "All Files"
##  $ created_by         :List of 4
##   ..$ type : chr "user"
##   ..$ id   : chr "196373178"
##   ..$ name : chr "Rick Gilmore"
##   ..$ login: chr "rog1@psu.edu"
##  $ modified_by        :List of 4
##   ..$ type : chr "user"
##   ..$ id   : chr "196373178"
##   ..$ name : chr "Rick Gilmore"
##   ..$ login: chr "rog1@psu.edu"
##  $ trashed_at         : NULL
##  $ purged_at          : NULL
##  $ content_created_at : chr "2019-10-04T08:29:47-07:00"
##  $ content_modified_at: chr "2019-10-04T08:29:47-07:00"
##  $ owned_by           :List of 4
##   ..$ type : chr "user"
##   ..$ id   : chr "196373178"
##   ..$ name : chr "Rick Gilmore"
##   ..$ login: chr "rog1@psu.edu"
##  $ shared_link        : NULL
##  $ folder_upload_email: NULL
##  $ parent             :List of 5
##   ..$ type       : chr "folder"
##   ..$ id         : chr "0"
##   ..$ sequence_id: NULL
##   ..$ etag       : NULL
##   ..$ name       : chr "All Files"
##  $ item_status        : chr "active"
##  $ item_collection    :List of 5
##   ..$ total_count: int 0
##   ..$ entries    : list()
##   ..$ offset     : int 0
##   ..$ limit      : int 100
##   ..$ order      :List of 2
##   .. ..$ :List of 2
##   .. .. ..$ by       : chr "type"
##   .. .. ..$ direction: chr "ASC"
##   .. ..$ :List of 2
##   .. .. ..$ by       : chr "name"
##   .. .. ..$ direction: chr "ASC"
##  - attr(*, "class")= chr "boxr_folder_reference"
```

That seemed to work.
We have stored the returned metadata in a variable `f`.
Now, let's create two subdirectories under that main directory.
First, we switch to the created directory and make it our temporary working directory.


```r
home_dir <- boxr::box_getwd()
boxr::box_setwd(f$id)
```

```
## box.com working directory changed to 'TEST-PLAY-workflow'
## 
##       id: 89160865905
##     tree: All Files/TEST-PLAY-workflow
##    owner: rog1@psu.edu
## contents: 0 files, 0 folders
```

Then we create two directories, `qa`, and `data_collection`.


```r
qa <- boxr::box_dir_create("qa")
data_collection <- boxr::box_dir_create("data_collection")
```

### Listing created directories

Let's retrieve a list of directories in our current working directory.
The default is the current working directory.
Note: We need to load the `tidyverse` package to have access to the pipe `%>%` operator.


```r
play_dirs <- boxr::box_ls()

play_dirs %>% knitr::kable()
```



name              type     id             size  description   owner          path                           modified_at           content_modified_at   sha1    version
----------------  -------  ------------  -----  ------------  -------------  -----------------------------  --------------------  --------------------  -----  --------
data_collection   folder   89161429081       0                rog1@psu.edu   All Files/TEST-PLAY-workflow   2019-10-04 11:29:49   2019-10-04 11:29:49   NA            1
qa                folder   89159949764       0                rog1@psu.edu   All Files/TEST-PLAY-workflow   2019-10-04 11:29:48   2019-10-04 11:29:48   NA            1

### Create a CSV data file and upload

Let's test the upload functionality by creating a CSV data frame and uploading it to one of the folders.


```r
df <- data.frame(name = c("Tom", "Dick", "Harriet"),
                 age = c(10, 15, 20),
                 alive = c(FALSE, TRUE, TRUE))
```

Let's create a Penn State `psu` and `nyu` subdirectory under `data_collection`.


```r
this_dir <- as.data.frame(play_dirs) %>%
  filter(name == "data_collection")
```


```r
psu <- boxr::box_dir_create(dir_name = "psu", parent_dir_id = this_dir$id)
nyu <- boxr::box_dir_create(dir_name = "nyu", parent_dir_id = this_dir$id)
nyu
```

```
## 
## box.com remote folder reference
## 
##  name        : nyu 
##  dir id      : 89159909000 
##  size        : 0 B 
##  modified at : 2019-10-04 08:29:50 
##  created at  : 2019-10-04 08:29:50 
##  uploaded by : rog1@psu.edu 
##  owned by    : rog1@psu.edu 
##  shared link : None 
## 
##  parent folder name :  data_collection 
##  parent folder id   :  89161429081
```
Now that we have an `nyu` subdirectory, we can add a file to it.

For now, I'm going to have to export this file, then use saved file.


```r
readr::write_csv(df, "tmp.csv")
boxr::box_ul(nyu$id, file = "tmp.csv")
```

```
##   |                                                                         |                                                                 |   0%  |                                                                         |=================================================================| 100%
```

```
## 
## box.com remote file reference
## 
##  name        : tmp.csv 
##  file id     : 534981046731 
##  version     : V1 
##  size        : 57 B 
##  modified at : 2019-10-04 08:29:52 
##  created at  : 2019-10-04 08:29:52 
##  uploaded by : rog1@psu.edu 
##  owned by    : rog1@psu.edu 
##  shared link : None 
## 
##  parent folder name :  nyu 
##  parent folder id   :  89159909000
```

### Downloading uploaded file

Let's list the files in the `nyu` subdirectory first.


```r
nyu_list <- boxr::box_ls(nyu$id)
nyu_list
```

```
## 
## box.com remote object list (1 objects)
## 
##   Summary of first 1:
## 
##      name type           id size        owner
## 1 tmp.csv file 534981046731 57 B rog1@psu.edu
## 
## 
## Use as.data.frame() to extract full results.
```

Now, we try to download it.


```r
boxr::box_dl(as.data.frame(nyu_list)$id, overwrite = FALSE, filename = "new_tmp.csv")
```

```
##   |                                                                         |                                                                 |   0%  |                                                                         |=================================================================| 100%
```

```
## [1] "/Users/rick/github/PLAY-behaviorome/workflow/new_tmp.csv"
```


```r
downloaded_f <- readr::read_csv("new_tmp.csv")
```

```
## Parsed with column specification:
## cols(
##   name = col_character(),
##   age = col_double(),
##   alive = col_logical()
## )
```

```r
str(downloaded_f)
```

```
## Classes 'spec_tbl_df', 'tbl_df', 'tbl' and 'data.frame':	3 obs. of  3 variables:
##  $ name : chr  "Tom" "Dick" "Harriet"
##  $ age  : num  10 15 20
##  $ alive: logi  FALSE TRUE TRUE
##  - attr(*, "spec")=
##   .. cols(
##   ..   name = col_character(),
##   ..   age = col_double(),
##   ..   alive = col_logical()
##   .. )
```

Ok. That seems to work so far.

## Clean-up

For this workflow to be useful to others for testing, I need to delete the local temporary files.


```r
tmp_list <- list.files(pattern = "tmp.csv$")
lapply(tmp_list, file.remove)
```

```
## [[1]]
## [1] TRUE
## 
## [[2]]
## [1] TRUE
```

I also need to delete the `TEST-PLAY-workflow` directory on Box.
That could be scripted, but for now, let's do that manually.
