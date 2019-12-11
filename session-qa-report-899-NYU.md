---
title: "PLAY Session Spreadsheet QA"
author: "Rick Gilmore"
date: "2019-12-11 11:10:46"
output: 
  html_document:
    keep_md: true
    theme: lumen
    toc: true
    toc_depth: 4
    toc_float: true
    code_folding: hide
params:
  vol_id: 899
  databrary_login: account@email.com
  site_code: NYU
---



# PLAY Site NYU QA Report

Site data collection volume: <https://databrary.org/volume/899>

## Session name checks


```r
this_vol_df <- databraryapi::download_session_csv(params$vol_id)

this_vol_df <- this_vol_df %>%
  dplyr::arrange(., desc(session_date))

name_checks_l <- lapply(1:dim(this_vol_df)[1], check_session_name, this_vol_df, params$site_code)
name_checks <- Reduce(function(x,y) merge(x,y, all=TRUE), name_checks_l)
```


```r
name_checks_fmt <- name_checks %>%
  dplyr::mutate(., 
  has_PLAY = kableExtra::cell_spec(
    has_PLAY,
    "html",
    color = ifelse(has_PLAY == TRUE, "green", "red")),
  has_site_id = kableExtra::cell_spec(
    has_site_id,
    "html",
    color = ifelse(has_site_id == TRUE, "green", "red")),
  has_sub_id = kableExtra::cell_spec(
    has_sub_id,
    "html",
    color = ifelse(has_sub_id == TRUE, "green", "red")),
  has_corr_seps = kableExtra::cell_spec(
    has_corr_seps,
    "html",
    color = ifelse(has_corr_seps == TRUE, "green", "red")),
  play_id_valid = kableExtra::cell_spec(
    play_id_valid,
    "html",
    color = ifelse(play_id_valid == TRUE, "green", "red")),
  length_ok = kableExtra::cell_spec(
    length_ok,
    "html",
    color = ifelse(length_ok == TRUE, "green", "red"))
    )
```


```r
name_checks_fmt[,1:5] %>%
  knitr::kable(., format = "html", escape = FALSE) %>%
  kableExtra::kable_styling(bootstrap_options = c("striped", "hover", "condensed"))
```

<table class="table table-striped table-hover table-condensed" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> session_name </th>
   <th style="text-align:left;"> has_PLAY </th>
   <th style="text-align:left;"> has_site_id </th>
   <th style="text-align:left;"> has_sub_id </th>
   <th style="text-align:left;"> has_corr_seps </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_001-e9N8O8B0A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_002-e9N1A7F2A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_003-e0N2N8S1A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_004-e4N0S8E1A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_005-e0N4H8O2A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_006-e1N9E7S0A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_007-e1N1S8M1A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#021 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#022 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#023 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#024 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#025 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#026 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#027 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#028 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#029 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#030 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#031 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#032 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#033 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
</tbody>
</table>


```r
name_checks_fmt[,c(1, 6:dim(name_checks)[2])] %>%
   knitr::kable(., format = "html", escape = FALSE) %>%
   kableExtra::kable_styling(bootstrap_options = c("striped", "hover", "condensed"))
```

<table class="table table-striped table-hover table-condensed" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> session_name </th>
   <th style="text-align:left;"> play_id_valid </th>
   <th style="text-align:left;"> length_ok </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_001-e9N8O8B0A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_002-e9N1A7F2A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_003-e0N2N8S1A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_004-e4N0S8E1A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_005-e0N4H8O2A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_006-e1N9E7S0A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_007-e1N1S8M1A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#021 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#022 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#023 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#024 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#025 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#026 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#027 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#028 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#029 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#030 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#031 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#032 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#033 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
</tbody>
</table>

## Session spreadsheet variable checks


```r
ss_checks_l <- lapply(1:dim(this_vol_df)[1], check_session_ss, this_vol_df, params$site_code)
ss_checks <- Reduce(function(x,y) merge(x,y, all=TRUE), ss_checks_l)
```


```r
ss_checks_fmt <- ss_checks %>%
  dplyr::mutate(.,
                release_level_ok = kableExtra::cell_spec(
                  release_level_ok,
                  "html",
                  color = ifelse(release_level_ok == TRUE, "green", "red")
                )) %>%
  dplyr::mutate(.,
                release_level_public = kableExtra::cell_spec(
                  release_level_public,
                  "html",
                  color = ifelse(release_level_public == TRUE, "red", "green")
                )) %>%
  dplyr::mutate(.,
                birth_before_test = kableExtra::cell_spec(
                  birth_before_test,
                  "html",
                  color = ifelse(birth_before_test == TRUE, "green", "red")
                )) %>%
  dplyr::mutate(.,
                test_after_start = kableExtra::cell_spec(
                  test_after_start,
                  "html",
                  color = ifelse(test_after_start == TRUE, "green", "red")
                )) %>%
  dplyr::mutate(.,
                age_group_valid = kableExtra::cell_spec(
                  age_group_valid,
                  "html",
                  color = ifelse(age_group_valid == TRUE, "green", "red")
                )) %>%
  dplyr::mutate(.,   gender_ok = kableExtra::cell_spec(gender_ok,
                                                       "html",
                                                       color = ifelse(gender_ok == TRUE, "green", "red"))) %>%
  dplyr::mutate(., race_ok = kableExtra::cell_spec(race_ok,
                                                   "html",
                                                   color = ifelse(race_ok == TRUE, "green", "red"))) %>%
  dplyr::mutate(.,
                ethnicity_ok = kableExtra::cell_spec(
                  ethnicity_ok,
                  "html",
                  color = ifelse(ethnicity_ok == TRUE, "green", "red")
                )) %>%
  dplyr::mutate(.,
                disability_ok = kableExtra::cell_spec(
                  disability_ok,
                  "html",
                  color = ifelse(disability_ok == TRUE, "green", "red")
                )) %>%
  dplyr::mutate(.,
                language_ok = kableExtra::cell_spec(
                  language_ok,
                                                    "html",
                                                    color = ifelse(language_ok == TRUE, "green", "red"))) %>%
  dplyr::mutate(.,
                exclusion_ok = kableExtra::cell_spec(
                  exclusion_ok,
                  "html",
                  color = ifelse(exclusion_ok == TRUE, "green", "red")
                )) %>%
  dplyr::mutate(., home_ok = kableExtra::cell_spec(home_ok,
                                                   "html",
                                                   color = ifelse(home_ok == TRUE, "green", "red"))) %>%
  dplyr::mutate(., country_ok = kableExtra::cell_spec(country_ok,
                                                      "html",
                                                      color = ifelse(country_ok == TRUE, "green", "red"))) %>%
  dplyr::mutate(., state_ok = kableExtra::cell_spec(state_ok,
                                                    "html",
                                                    color = ifelse(state_ok == TRUE, "green", "red")))
```


```r
ss_checks_fmt[,1:5] %>%
  knitr::kable(., format = "html", escape = FALSE) %>%
  kableExtra::kable_styling(bootstrap_options = c("striped", "hover", "condensed"))
```

<table class="table table-striped table-hover table-condensed" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> session_name </th>
   <th style="text-align:left;"> release_level_ok </th>
   <th style="text-align:left;"> release_level_public </th>
   <th style="text-align:left;"> birth_before_test </th>
   <th style="text-align:left;"> test_after_start </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_001-e9N8O8B0A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_002-e9N1A7F2A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_003-e0N2N8S1A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_004-e4N0S8E1A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_005-e0N4H8O2A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_006-e1N9E7S0A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_007-e1N1S8M1A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#021 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#022 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#023 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#024 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#025 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#026 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#027 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#028 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#029 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#030 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#031 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#032 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#033 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
</tbody>
</table>


```r
ss_checks_fmt[,c(1, 6:10)] %>%
  knitr::kable(., format = "html", escape = FALSE) %>%
  kableExtra::kable_styling(bootstrap_options = c("striped", "hover", "condensed"))
```

<table class="table table-striped table-hover table-condensed" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> session_name </th>
   <th style="text-align:left;"> age_group_valid </th>
   <th style="text-align:left;"> gender_ok </th>
   <th style="text-align:left;"> race_ok </th>
   <th style="text-align:left;"> ethnicity_ok </th>
   <th style="text-align:left;"> disability_ok </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_001-e9N8O8B0A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_002-e9N1A7F2A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_003-e0N2N8S1A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_004-e4N0S8E1A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_005-e0N4H8O2A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_006-e1N9E7S0A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_007-e1N1S8M1A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#021 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#022 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#023 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#024 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#025 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#026 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#027 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#028 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#029 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#030 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#031 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#032 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#033 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
</tbody>
</table>


```r
ss_checks_fmt[,c(1,dim(ss_checks_fmt)[2])] %>%
  knitr::kable(., format = "html", escape = FALSE) %>%
  kableExtra::kable_styling(bootstrap_options = c("striped", "hover", "condensed"))
```

<table class="table table-striped table-hover table-condensed" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> session_name </th>
   <th style="text-align:left;"> state_ok </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_001-e9N8O8B0A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_002-e9N1A7F2A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_003-e0N2N8S1A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_004-e4N0S8E1A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_005-e0N4H8O2A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_006-e1N9E7S0A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_007-e1N1S8M1A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#021 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#022 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#023 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#024 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#025 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#026 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#027 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#028 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#029 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#030 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#031 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#032 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#033 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
</tbody>
</table>

## Video file-level checks


```r
check_videos_l <- lapply(1:dim(this_vol_df)[1], check_videos_in_session, this_vol_df, params$vol_id)
check_videos_df <- Reduce(function(x,y) merge(x,y, all=TRUE), check_videos_l)
```


```r
check_videos_fmt <- check_videos_df %>%
  dplyr::mutate(NaturalPlay_exists = kableExtra::cell_spec(
    NaturalPlay_exists,
    "html",
    color = ifelse(NaturalPlay_exists == TRUE, "green", "red")
  ),
  HouseWalkthrough_exists = kableExtra::cell_spec(
    HouseWalkthrough_exists,
    "html",
    color = ifelse(HouseWalkthrough_exists == TRUE, "green", "red")
  ),
  StructuredPlay_exists = kableExtra::cell_spec(
    StructuredPlay_exists,
    "html",
    color = ifelse(StructuredPlay_exists == TRUE, "green", "red")
  ),
  Questionnaires_exists = kableExtra::cell_spec(
    Questionnaires_exists,
    "html",
    color = ifelse(Questionnaires_exists == TRUE, "green", "red")
  ),
  four_or_more_videos = kableExtra::cell_spec(
    four_or_more_videos,
    "html",
    color = ifelse(four_or_more_videos == TRUE, "green", "red")
  ))
```


```r
check_videos_fmt %>%
  knitr::kable(., format = "html", escape = FALSE) %>%
  kableExtra::kable_styling(bootstrap_options = c("striped", "hover", "condensed"))
```

<table class="table table-striped table-hover table-condensed" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> session_name </th>
   <th style="text-align:right;"> session_id </th>
   <th style="text-align:left;"> NaturalPlay_exists </th>
   <th style="text-align:left;"> HouseWalkthrough_exists </th>
   <th style="text-align:left;"> StructuredPlay_exists </th>
   <th style="text-align:left;"> Questionnaires_exists </th>
   <th style="text-align:left;"> four_or_more_videos </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_001-e9N8O8B0A </td>
   <td style="text-align:right;"> 41534 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_002-e9N1A7F2A </td>
   <td style="text-align:right;"> 41800 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_003-e0N2N8S1A </td>
   <td style="text-align:right;"> 41455 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_004-e4N0S8E1A </td>
   <td style="text-align:right;"> 41535 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_005-e0N4H8O2A </td>
   <td style="text-align:right;"> 41608 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_006-e1N9E7S0A </td>
   <td style="text-align:right;"> 41808 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_007-e1N1S8M1A </td>
   <td style="text-align:right;"> 41894 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#021 </td>
   <td style="text-align:right;"> 38198 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#022 </td>
   <td style="text-align:right;"> 36876 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#023 </td>
   <td style="text-align:right;"> 37417 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#024 </td>
   <td style="text-align:right;"> 37450 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#025 </td>
   <td style="text-align:right;"> 37982 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#026 </td>
   <td style="text-align:right;"> 38195 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#027 </td>
   <td style="text-align:right;"> 38196 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#028 </td>
   <td style="text-align:right;"> 38197 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#029 </td>
   <td style="text-align:right;"> 38215 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#030 </td>
   <td style="text-align:right;"> 38236 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#031 </td>
   <td style="text-align:right;"> 38485 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#032 </td>
   <td style="text-align:right;"> 41754 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#033 </td>
   <td style="text-align:right;"> 42112 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
</tbody>
</table>

