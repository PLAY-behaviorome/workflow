---
title: "api-explorations-kobotoolbox"
author: "Rick Gilmore"
date: "2019-10-03 14:30:27"
output: 
  html_document:
    keep_md: true
    theme: lumen
    toc: true
    toc_depth: 4
    toc_float: true
    code_folding: show
params:
  kobo_token: abcdefg
---



## Purpose

This document explores the utility of using the KoBoToolbox.org API for file management of the PLAY Project survey data.

## Set-up

I used the KoBoToolbox.org support site, especially this page -- <http://support.kobotoolbox.org/en/articles/1559346-pulling-your-data-into-excel-power-query> -- for insights here.

1. I set up a new account on the server to test functionality.
2. I created a silly project called "Rick's Excellent Survey" with a small survey.
  - Here is the URL I sent to my lab's Discord: <https://ee.kobotoolbox.org/x/#jTDIfW5t>.

3. While logged in, I followed the instructions on this page

<http://support.kobotoolbox.org/en/articles/592398-api-and-rest-services>

to get my access token.
Specifically, I entered ` https://kf.kobotooltoolbox.org/token/?format=json` into a browser.

4. Then, I tested the token using this command in Terminal.app:

```
curl -X GET https://[kpi-url]/assets/?format=json -H "Authorization: Token [your_token_goes_here]"
```

Since I get a 200 success code, I am ready to do substantive things with the API.

## Accessing data

Following the instructions in

<http://support.kobotoolbox.org/en/articles/1559346-pulling-your-data-into-excel-power-query>,

I decided to try to get the data my lab group had entered into the test survey.


```bash
curl -X GET https://kc.kobotoolbox.org/api/v1/data.csv -H "Authorization: Token MY_TOKEN_HERE"
```

That command (with the appropriate token) returns a CSV with data about the surveys that have data for me.

Let's do this in R.


```r
r <- httr::GET(url = "https://kc.kobotoolbox.org/api/v1/data.csv", httr::add_headers("Authorization" = paste0("Token ", params$kobo_token)))
#status(r)
content(r, as = "parsed") %>%
  knitr::kable(.)
```

```
## Parsed with column specification:
## cols(
##   description = col_character(),
##   id = col_double(),
##   id_string = col_character(),
##   title = col_character(),
##   url = col_character()
## )
```



description                    id  id_string                title                     url                                               
------------------------  -------  -----------------------  ------------------------  --------------------------------------------------
Rick's Excellent Survey    341165  a8JgAeekT8cqdExvHno4DF   Rick's Excellent Survey   https://kc.kobotoolbox.org/api/v1/data/341165.csv 

Note that to render this R Markdown document, I need to run the following command in the R console: `rmarkdown::render("api-explorations-kobotoolbox.Rmd", params=list(kobo_token="MY_TOKEN_HERE"))` substituting my actual token for `MY_TOKEN_HERE`.
The token is a string, so it needs to be surrounded by quotation marks, single or double.
This is messy, but it works, so we'll proceed.

### Getting specific individual-level responses

The prior set of commands gave us data about the survey data, but it didn't download the results.
Let's do that now.
First, I'm just going to copy and paste the `id` value for the file into the URL.
This should return JSON.


```r
r <- httr::GET(url = "https://kc.kobotoolbox.org/api/v1/data/341165", httr::add_headers("Authorization" = paste0("Token ", params$kobo_token)))
jsonlite::fromJSON(content(r, as = "text"))
```

```
## No encoding supplied: defaulting to UTF-8.
```

```
##   _notes                           meta/instanceID
## 1   NULL uuid:150c73fb-cf2f-4c45-be61-3fa87246ee32
## 2   NULL uuid:2ae294db-08a9-43f2-99c9-8f91d90b3a07
## 3   NULL uuid:38ebb91f-2039-4f81-9f71-e2049fd9cc2d
## 4   NULL uuid:3b8233c9-48a3-437d-bc31-757134691393
##                             end _attachments    _submission_time
## 1 2019-10-02T10:47:48.188-04:00         NULL 2019-10-02T14:47:53
## 2 2019-10-02T10:43:28.100-04:00         NULL 2019-10-02T14:43:33
## 3 2019-10-02T10:36:34.512-04:00         NULL 2019-10-02T14:36:40
## 4 2019-10-02T10:29:53.820-04:00         NULL 2019-10-02T14:29:59
##   What_is_your_name                                _uuid
## 1   Michelle Mendez 150c73fb-cf2f-4c45-be61-3fa87246ee32
## 2        Prince bob 2ae294db-08a9-43f2-99c9-8f91d90b3a07
## 3        Sir Arthur 38ebb91f-2039-4f81-9f71-e2049fd9cc2d
## 4            Rachel 3b8233c9-48a3-437d-bc31-757134691393
##   _bamboo_dataset_id _tags    What_is_the_time_right_now
## 1                     NULL 2019-10-02T10:47:00.000-04:00
## 2                     NULL 2019-10-02T10:45:00.000-04:00
## 3                     NULL 2019-10-02T10:45:00.000-04:00
## 4                     NULL                          <NA>
##                           start _submitted_by _geolocation
## 1 2019-10-02T10:46:30.255-04:00            NA       NA, NA
## 2 2019-10-02T10:42:25.707-04:00            NA       NA, NA
## 3 2019-10-02T10:26:47.351-04:00            NA       NA, NA
## 4 2019-10-02T10:29:15.351-04:00            NA       NA, NA
##   What_is_your_favorite_color       _xform_id_string           _status
## 1                         red a8JgAeekT8cqdExvHno4DF submitted_via_web
## 2                        blue a8JgAeekT8cqdExvHno4DF submitted_via_web
## 3                       green a8JgAeekT8cqdExvHno4DF submitted_via_web
## 4                        blue a8JgAeekT8cqdExvHno4DF submitted_via_web
##        _id      What_is_your_quest            __version__
## 1 38055407     To pursue adventure vKLcb7ieHpy5he6VRgFm4s
## 2 38055172 To get through the week vKLcb7ieHpy5he6VRgFm4s
## 3 38054432          The Holy Grail vKLcb7ieHpy5he6VRgFm4s
## 4 38053952                    <NA> vKLcb7ieHpy5he6VRgFm4s
##                       formhub/uuid
## 1 da71544da7c442e2bf360e4b5a6b1a43
## 2 da71544da7c442e2bf360e4b5a6b1a43
## 3 da71544da7c442e2bf360e4b5a6b1a43
## 4 da71544da7c442e2bf360e4b5a6b1a43
```

So, that seems to work.
Let's clean it up a bit.
First, we'll save the output as a data frame so we can pull the survey ID as a parameter.


```r
surveys_r <- httr::GET(url = "https://kc.kobotoolbox.org/api/v1/data.csv", httr::add_headers("Authorization" = paste0("Token ", params$kobo_token)))
surveys_df <- content(surveys_r, as = "parsed")
```

```
## Parsed with column specification:
## cols(
##   description = col_character(),
##   id = col_double(),
##   id_string = col_character(),
##   title = col_character(),
##   url = col_character()
## )
```

Then, we'll use the `id` for the survey we want to build the next API call.


```r
silly_survey <- surveys_df %>%
  dplyr::filter(title == "Rick's Excellent Survey")

results_url <- paste0("https://kc.kobotoolbox.org/api/v1/data/", silly_survey$id)

data_r <- httr::GET(url = results_url, httr::add_headers("Authorization" = paste0("Token ", params$kobo_token)))

if (httr::status_code(data_r) == 200) {
  jsonlite::fromJSON(content(data_r, as = "text"))
} else {
  message(paste0("Status code: ", httr::status_code(data_r)))
}
```

```
## No encoding supplied: defaulting to UTF-8.
```

```
##   _notes                           meta/instanceID
## 1   NULL uuid:150c73fb-cf2f-4c45-be61-3fa87246ee32
## 2   NULL uuid:2ae294db-08a9-43f2-99c9-8f91d90b3a07
## 3   NULL uuid:38ebb91f-2039-4f81-9f71-e2049fd9cc2d
## 4   NULL uuid:3b8233c9-48a3-437d-bc31-757134691393
##                             end _attachments    _submission_time
## 1 2019-10-02T10:47:48.188-04:00         NULL 2019-10-02T14:47:53
## 2 2019-10-02T10:43:28.100-04:00         NULL 2019-10-02T14:43:33
## 3 2019-10-02T10:36:34.512-04:00         NULL 2019-10-02T14:36:40
## 4 2019-10-02T10:29:53.820-04:00         NULL 2019-10-02T14:29:59
##   What_is_your_name                                _uuid
## 1   Michelle Mendez 150c73fb-cf2f-4c45-be61-3fa87246ee32
## 2        Prince bob 2ae294db-08a9-43f2-99c9-8f91d90b3a07
## 3        Sir Arthur 38ebb91f-2039-4f81-9f71-e2049fd9cc2d
## 4            Rachel 3b8233c9-48a3-437d-bc31-757134691393
##   _bamboo_dataset_id _tags    What_is_the_time_right_now
## 1                     NULL 2019-10-02T10:47:00.000-04:00
## 2                     NULL 2019-10-02T10:45:00.000-04:00
## 3                     NULL 2019-10-02T10:45:00.000-04:00
## 4                     NULL                          <NA>
##                           start _submitted_by _geolocation
## 1 2019-10-02T10:46:30.255-04:00            NA       NA, NA
## 2 2019-10-02T10:42:25.707-04:00            NA       NA, NA
## 3 2019-10-02T10:26:47.351-04:00            NA       NA, NA
## 4 2019-10-02T10:29:15.351-04:00            NA       NA, NA
##   What_is_your_favorite_color       _xform_id_string           _status
## 1                         red a8JgAeekT8cqdExvHno4DF submitted_via_web
## 2                        blue a8JgAeekT8cqdExvHno4DF submitted_via_web
## 3                       green a8JgAeekT8cqdExvHno4DF submitted_via_web
## 4                        blue a8JgAeekT8cqdExvHno4DF submitted_via_web
##        _id      What_is_your_quest            __version__
## 1 38055407     To pursue adventure vKLcb7ieHpy5he6VRgFm4s
## 2 38055172 To get through the week vKLcb7ieHpy5he6VRgFm4s
## 3 38054432          The Holy Grail vKLcb7ieHpy5he6VRgFm4s
## 4 38053952                    <NA> vKLcb7ieHpy5he6VRgFm4s
##                       formhub/uuid
## 1 da71544da7c442e2bf360e4b5a6b1a43
## 2 da71544da7c442e2bf360e4b5a6b1a43
## 3 da71544da7c442e2bf360e4b5a6b1a43
## 4 da71544da7c442e2bf360e4b5a6b1a43
```

Better, but let's see if grabbing a CSV reduces the post-download data-munging.


```r
results_url <- paste0("https://kc.kobotoolbox.org/api/v1/data/", silly_survey$id, ".csv")

data_r <- httr::GET(url = results_url, httr::add_headers("Authorization" = paste0("Token ", params$kobo_token)))

if (httr::status_code(data_r) == 200) {
  (responses_df <- readr::read_csv(content(data_r, as = "text")))
} else {
  message(paste0("Status code: ", httr::status_code(data_r)))
}
```

```
## No encoding supplied: defaulting to UTF-8.
```

```
## # A tibble: 4 x 14
##   start               end                 What_is_your_na… What_is_your_qu…
##   <dttm>              <dttm>              <chr>            <chr>           
## 1 2019-10-02 14:46:30 2019-10-02 14:47:48 Michelle Mendez  To pursue adven…
## 2 2019-10-02 14:42:25 2019-10-02 14:43:28 Prince bob       To get through …
## 3 2019-10-02 14:26:47 2019-10-02 14:36:34 Sir Arthur       The Holy Grail  
## 4 2019-10-02 14:29:15 2019-10-02 14:29:53 Rachel           n/a             
## # … with 10 more variables: `What_is_your_favorite_color/blue` <lgl>,
## #   `What_is_your_favorite_color/green` <lgl>,
## #   `What_is_your_favorite_color/red` <lgl>,
## #   What_is_the_time_right_now <chr>, `__version__` <chr>,
## #   `meta/instanceID` <chr>, `_uuid` <chr>, `_submission_time` <dttm>,
## #   `_tags` <lgl>, `_notes` <lgl>
```

Ok, that's workable.
Let's extract the respondent's names.


```r
responses_df$What_is_your_name
```

```
## [1] "Michelle Mendez" "Prince bob"      "Sir Arthur"      "Rachel"
```

This is going to work.

## Next steps

1. We should try extracting/exporting the PLAY survey data.
2. We could consider scripting/automating the generation of the PLAY surveys.
3. We'll need to think carefully about what post-download processing we need to do on the surveys.
