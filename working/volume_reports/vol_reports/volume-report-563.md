---
title: "volume-report"
author: "Rick Gilmore"
date: "2019-10-31 15:10:10"
output: 
  html_document:
    keep_md: true
    theme: lumen
    toc: true
    toc_depth: 4
    toc_float: true
    code_folding: hide
    self-contained: true
params:
  vol_id: 444
  databrary_login: account@email.com
---




```r
# Get volume info
vol_data <- databraryapi::list_volume_metadata(as.numeric(params$vol_id))
```


```r
# This report must be rendered from the R console
# Substitute your Databrary email (account ID) for account@email.com, run from console
rmarkdown::render("volume-report.Rmd", params = list(databrary_login = "account@email.com"))
```

# 563 : LEGO

## Summary data

### Owner(s)


```r
cat(stringr::str_replace_all(string = as.character(vol_data$owners), replacement = "/n", pattern ="; "))
```

```
## Adolph, Karen/nTamis-LeMonda, Catherine
```

### DOI


```r
if (as.character(vol_data$doi) == "NA") {
  cat(paste0("https://databrary.org/volume/", params$vol_id))
} else {
  cat(as.character(vol_data$doi))
}
```

```
## https://databrary.org/volume/563
```

## Materials & Data {.tabset}

### Materials


```r
these_sessions <- databraryapi::download_session_csv(as.numeric(params$vol_id))

materials <- these_sessions %>%
  dplyr::filter(session_date == "materials") %>%
  dplyr::mutate(url = paste0("https://databrary.org/volume/", 
                             params$vol_id, "/slot/", 
                             session_id, "/-")) %>%
  dplyr::select(session_name, url)

if (is.null(materials)) {
  cat("No materials files in volume.")
} else {
  materials %>%
    knitr::kable(.)    
}
```



|session_name |url |
|:------------|:---|

### Participant sessions


```r
these_sessions <- databraryapi::download_session_csv(as.numeric(params$vol_id))

sessions_filtered <- these_sessions %>%
  dplyr::filter(session_date != "materials") %>%
  dplyr::mutate(url = paste0("https://databrary.org/volume/", 
                             params$vol_id, "/slot/", session_id, "/-")) %>%
  dplyr::select(participant.ID, group.name, participant.gender, participant.race, participant.ethnicity, url) %>%
  dplyr::arrange(group.name, participant.gender)

sessions_filtered %>%
  knitr::kable(.)
```



 participant.ID  group.name       participant.gender   participant.race            participant.ethnicity    url                                           
---------------  ---------------  -------------------  --------------------------  -----------------------  ----------------------------------------------
              8  13 mos Crawler   Female               White                       Hispanic or Latino       https://databrary.org/volume/563/slot/25105/- 
              8  13 mos Crawler   Female               White                       Hispanic or Latino       https://databrary.org/volume/563/slot/25245/- 
             13  13 mos Crawler   Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/25711/- 
             13  13 mos Crawler   Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/25945/- 
             18  13 mos Crawler   Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/26890/- 
             18  13 mos Crawler   Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/27109/- 
             38  13 mos Crawler   Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/33008/- 
             38  13 mos Crawler   Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/34961/- 
              9  13 mos Crawler   Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/25106/- 
              9  13 mos Crawler   Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/25346/- 
             10  13 mos Crawler   Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/25541/- 
             10  13 mos Crawler   Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/25624/- 
             20  13 mos Crawler   Male                 More than one               Hispanic or Latino       https://databrary.org/volume/563/slot/27457/- 
             20  13 mos Crawler   Male                 More than one               Hispanic or Latino       https://databrary.org/volume/563/slot/30524/- 
             52  13 mos Crawler   Male                 More than one               Hispanic or Latino       https://databrary.org/volume/563/slot/39882/- 
             52  13 mos Crawler   Male                 More than one               Hispanic or Latino       https://databrary.org/volume/563/slot/39939/- 
              5  13 mos Walkers   Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/24362/- 
              5  13 mos Walkers   Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/24643/- 
              4  13 mos Walkers   Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/24967/- 
              4  13 mos Walkers   Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/24968/- 
             28  13 mos Walkers   Female               More than one               Not Hispanic or Latino   https://databrary.org/volume/563/slot/30242/- 
             28  13 mos Walkers   Female               More than one               Not Hispanic or Latino   https://databrary.org/volume/563/slot/30290/- 
             42  13 mos Walkers   Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/34870/- 
             42  13 mos Walkers   Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/35063/- 
             51  13 mos Walkers   Female               More than one               Hispanic or Latino       https://databrary.org/volume/563/slot/39646/- 
             51  13 mos Walkers   Female               More than one               Hispanic or Latino       https://databrary.org/volume/563/slot/39890/- 
              2  13 mos Walkers   Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/24098/- 
              2  13 mos Walkers   Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/24099/- 
             17  13 mos Walkers   Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/26343/- 
             17  13 mos Walkers   Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/26344/- 
             26  13 mos Walkers   Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/29971/- 
             26  13 mos Walkers   Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/30240/- 
             35  13 mos Walkers   Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/32807/- 
             36  13 mos Walkers   Male                 More than one               Not Hispanic or Latino   https://databrary.org/volume/563/slot/32827/- 
             35  13 mos Walkers   Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/32866/- 
             36  13 mos Walkers   Male                 More than one               Not Hispanic or Latino   https://databrary.org/volume/563/slot/33000/- 
             43  13 mos Walkers   Male                 Black or African American   Not Hispanic or Latino   https://databrary.org/volume/563/slot/35095/- 
             43  13 mos Walkers   Male                 Black or African American   Not Hispanic or Latino   https://databrary.org/volume/563/slot/35172/- 
             44  13 mos Walkers   Male                 Asian                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/36221/- 
             50  13 mos Walkers   Male                 More than one               Hispanic or Latino       https://databrary.org/volume/563/slot/39554/- 
             50  13 mos Walkers   Male                 More than one               Hispanic or Latino       https://databrary.org/volume/563/slot/39597/- 
             55  13 mos Walkers   Male                 More than one               Hispanic or Latino       https://databrary.org/volume/563/slot/40817/- 
             55  13 mos Walkers   Male                 More than one               Hispanic or Latino       https://databrary.org/volume/563/slot/41637/- 
             14  18 mos           Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/25817/- 
             14  18 mos           Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/25818/- 
             15  18 mos           Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/25973/- 
             15  18 mos           Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/25974/- 
             21  18 mos           Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/27920/- 
             21  18 mos           Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/28159/- 
             30  18 mos           Female               More than one               Not Hispanic or Latino   https://databrary.org/volume/563/slot/30487/- 
             30  18 mos           Female               More than one               Not Hispanic or Latino   https://databrary.org/volume/563/slot/30511/- 
             33  18 mos           Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/31895/- 
             33  18 mos           Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/32142/- 
             48  18 mos           Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/39246/- 
             48  18 mos           Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/39375/- 
             49  18 mos           Female               Black or African American   Not Hispanic or Latino   https://databrary.org/volume/563/slot/39474/- 
             54  18 mos           Female               More than one               Hispanic or Latino       https://databrary.org/volume/563/slot/40456/- 
             54  18 mos           Female               More than one               Hispanic or Latino       https://databrary.org/volume/563/slot/40518/- 
             22  18 mos           Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/28959/- 
             22  18 mos           Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/29302/- 
             24  18 mos           Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/29464/- 
             24  18 mos           Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/29543/- 
             25  18 mos           Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/29895/- 
             25  18 mos           Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/29906/- 
             29  18 mos           Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/30453/- 
             29  18 mos           Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/30494/- 
             40  18 mos           Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/33459/- 
             46  18 mos           Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/38271/- 
             46  18 mos           Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/38306/- 
             53  18 mos           Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/40267/- 
             53  18 mos           Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/40428/- 
             56  18 mos           Male                 Asian                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/41504/- 
             56  18 mos           Male                 Asian                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/41554/- 
              6  23 mos           Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/24658/- 
              6  23 mos           Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/25655/- 
             16  23 mos           Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/26340/- 
             27  23 mos           Female               White                       Hispanic or Latino       https://databrary.org/volume/563/slot/30156/- 
             16  23 mos           Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/30525/- 
             31  23 mos           Female               More than one               Hispanic or Latino       https://databrary.org/volume/563/slot/31726/- 
             31  23 mos           Female               More than one               Hispanic or Latino       https://databrary.org/volume/563/slot/31801/- 
             37  23 mos           Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/32974/- 
             37  23 mos           Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/32990/- 
             41  23 mos           Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/34133/- 
             41  23 mos           Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/34439/- 
             45  23 mos           Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/36745/- 
             45  23 mos           Female               White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/36926/- 
              3  23 mos           Male                 More than one               Not Hispanic or Latino   https://databrary.org/volume/563/slot/24192/- 
              7  23 mos           Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/24861/- 
              7  23 mos           Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/24964/- 
             11  23 mos           Male                 More than one               Not Hispanic or Latino   https://databrary.org/volume/563/slot/25568/- 
             12  23 mos           Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/25627/- 
             12  23 mos           Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/25654/- 
             11  23 mos           Male                 More than one               Not Hispanic or Latino   https://databrary.org/volume/563/slot/25661/- 
             19  23 mos           Male                 More than one               Hispanic or Latino       https://databrary.org/volume/563/slot/27064/- 
             23  23 mos           Male                 Other                       Hispanic or Latino       https://databrary.org/volume/563/slot/29347/- 
             23  23 mos           Male                 Other                       Hispanic or Latino       https://databrary.org/volume/563/slot/29595/- 
             19  23 mos           Male                 More than one               Hispanic or Latino       https://databrary.org/volume/563/slot/30526/- 
             32  23 mos           Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/31749/- 
             32  23 mos           Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/31805/- 
             34  23 mos           Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/32454/- 
             34  23 mos           Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/32463/- 
             47  23 mos           Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/38934/- 
             47  23 mos           Male                 White                       Not Hispanic or Latino   https://databrary.org/volume/563/slot/39478/- 

### Participant summary


```r
gender_race <- sessions_filtered %>%
  select(group.name, participant.gender, participant.race)

#levels(gender_race$participant.race) <- c(NA, "Asian", "Mult", "Unk", "Wht")
age_gender_table <- xtabs(formula = ~ group.name + participant.gender, data = sessions_filtered)

age_gender_table %>%
  knitr::kable(.)
```

                  Female   Male
---------------  -------  -----
13 mos Crawler         8      8
13 mos Walkers        10     17
18 mos                15     15
23 mos                13     17

```r
age_gender_table %>%
  vcd::mosaic(.)
```

![](/Users/rick/github/PLAY-behaviorome/workflow/vol_reports/volume-report-563_files/figure-html/participant-summary-1.png)<!-- -->

## Files by type {.tabset}

### Videos


```r
video_files <- databraryapi::list_assets_by_type(as.numeric(params$vol_id))

if (is.null(video_files)) {
  cat("No video files in volume.")
} else {
  opf_filtered <- video_files %>%
    dplyr::select(vol_id, session_id, name, 
                  asset_id, duration, segment)
  
  opf_filtered %>%
    knitr::kable(.)  
}
```



 vol_id   session_id  name                                                           asset_id   duration  segment               
-------  -----------  ------------------------------------------------------------  ---------  ---------  ----------------------
    563        24098  LEGO_S#002_Visit1 Housemap.mov                                   139947     625216  c(0, 625216)          
    563        24098  LEGO_S#002_Visit1 Intake, locomotor & MCDI (first part).mov      139949    1451115  c(626216, 2077331)    
    563        24098  LEGO_S#002_Visit1 MCDI (second part).mov                         139951    2879979  c(2078331, 4958310)   
    563        24098  LEGO_S#002_Visit1 2-Hour.mov                                     139959    7201128  c(4959310, 12160438)  
    563        24099  LEGO_S#002_Visit2 2-Hour                                         106322    7119190  c(0, 7119190)         
    563        24099  LEGO_S#002_Visit2 Questionnaire 1                                139953     757398  c(7120190, 7877588)   
    563        24099  LEGO_S#002_Visit2 Questionnaire 2                                139955     746368  c(7878479, 8624847)   
    563        24192  LEGO_S#003_Visit1 2-hour (part)                                  106314    1502123  c(0, 1502123)         
    563        24192  LEGO_S#003_Visit1 Consent                                        106316     287915  c(1503033, 1790948)   
    563        24192  LEGO_S#003_Visit1 Housemap                                       106318     480640  c(1791853, 2272493)   
    563        24192  LEGO_S#003_Visit1 Questionnaires LOC - MCDI                      106320    2742379  c(2273406, 5015785)   
    563        24362  LEGO_S#005_Visit1 2-Hour                                         106891    7205824  c(0, 7205824)         
    563        24362  LEGO_S#005_Visit1 Questionnaires                                 106893    3047702  c(7206731, 10254433)  
    563        24643  S#005(2) 2-Hour                                                  108181    6867499  c(0, 6867499)         
    563        24643  LEGO_S#005_Visit2 Housemap                                       108183     423552  c(6868393, 7291945)   
    563        24643  LEGO_S#005_Visit2 Questionnaires                                 108185    1446080  c(7292849, 8738929)   
    563        24658  LEGO_S#006_Visit1 Questionnaires                                 109041    1968598  c(0, 1968598)         
    563        24658  LEGO_S#006_Visit1 Housemap.mov                                   139967     401024  c(1969598, 2370622)   
    563        24658  LEGO_S#006_Visit1 2-Hour.mov                                     139979    7291478  c(2371622, 9663100)   
    563        24658  LEGO_S#006_Visit1 Experimenter view.mov                          139983    5155776  c(9664100, 14819876)  
    563        24861  LEGO_S#007_Visit1 Introduction                                   110391     122262  c(2588618, 2710880)   
    563        24861  LEGO_S#007_Visit1 Questionnaires                                 110429    2690112  c(2711880, 5401992)   
    563        24861  LEGO_S#007_Visit1 2-hour                                         110431    7203862  c(5402900, 12606762)  
    563        24964  LEGO_S#007_Visit2 2-hour                                         111026    7201628  c(0, 7201628)         
    563        24964  LEGO_S#007_Visit2 Housemap                                       139975     430571  c(7202628, 7633199)   
    563        24964  LEGO_S#007_Visit2 Questionnaires                                 139977    1041195  c(7634124, 8675319)   
    563        24967  LEGO_S#004_Visit1 2-Hour                                         111036    6201920  c(0, 6201920)         
    563        24967  LEGO_S#004_Visit1 Housemap                                       139963     384640  c(6202920, 6587560)   
    563        24967  LEGO_S#004_Visit1 Questionnaires                                 139965    2022656  c(6588365, 8611021)   
    563        24967  LEGO_S#004_Visit1 Experimenter Housemap                          139969     397056  c(8611918, 9008974)   
    563        24967  LEGO_S#004_Visit1 Experimenter 2-hour                            139971    6189888  c(8611918, 14801806)  
    563        24968  S#004(2) 2-Hour                                                  111038    4563602  c(0, 4563602)         
    563        24968  LEGO_S#004_Visit2 Questionnaire                                  111040    1205803  c(4564559, 5770362)   
    563        25105  LEGO_S#008_Visit1 2-hour                                         112762    6863595  c(0, 6863595)         
    563        25105  LEGO_S#008_Visit1 Questionnaires                                 112766    2786923  c(6864423, 9651346)   
    563        25106  LEGO_S#009_Visit1 Housemap                                       111405     301440  c(0, 301440)          
    563        25106  LEGO_S#009_Visit1 2-Hour                                         111407    7203328  c(0, 7203328)         
    563        25106  LEGO_S#009_Visit1 Questionnaires                                 111409    2104235  c(7204229, 9308464)   
    563        25245  LEGO_S#008_Visit2 2-hour                                         112002    7210880  c(0, 7210880)         
    563        25245  LEGO_S#008_Visit2 Databrary                                      112006     148779  c(7211670, 7360449)   
    563        25245  LEGO_S#008_Visit2 Housemap                                       112008     557078  c(7361351, 7918429)   
    563        25346  LEGO_S#009_Visit2 2-Hour                                         112675    5911531  c(0, 5911531)         
    563        25346  LEGO_S#009_Visit2 Questionnaires                                 112677     822443  c(5912438, 6734881)   
    563        25541  LEGO_S#010_Visit1 2-Hour                                         113783    6290006  c(0, 6290006)         
    563        25541  LEGO_S#010_Visit1 Questionnaires                                 113785    2034155  c(6290883, 8325038)   
    563        25568  LEGO_S#011_Visit1 2-Hour                                         113963    7199638  c(0, 7199638)         
    563        25568  LEGO_S#011_Visit1 Questionnaires                                 113965    4666795  c(7200531, 11867326)  
    563        25624  LEGO_S#010_Visit2 Questionnaires                                 114657    1044758  c(0, 1044758)         
    563        25624  LEGO_S#010_Visit2 Housemap                                       114659     402027  c(1045610, 1447637)   
    563        25624  LEGO_S#010_Visit2 2-Hour                                         114661    7201323  c(1448544, 8649867)   
    563        25627  LEGO_S#012_Visit1 Housemap                                       114701     301931  c(0, 301931)          
    563        25627  LEGO_S#012_Visit1 Questionnaires                                 114703    1951083  c(302834, 2253917)    
    563        25627  LEGO_S#012_Visit1 2-Hour                                         114709    7202326  c(2254816, 9457142)   
    563        25654  LEGO_S#012_Visit2 Questionnaires                                 114786     894016  c(0, 894016)          
    563        25654  LEGO_S#012_Visit2 2-Hour                                         116051    7361054  c(895016, 8256070)    
    563        25655  LEGO_S#006_Visit2 Questionnaires.mov                             139987    1968598  c(0, 1968598)         
    563        25661  LEGO_S#011_Visit2 2-Hour                                         114846    7201835  c(0, 7201835)         
    563        25661  LEGO_S#011_Visit2 Housemap                                       114848     909846  c(7202727, 8112573)   
    563        25661  LEGO_S#011_Visit2 Questionnaires                                 116634    1464192  c(8113573, 9577765)   
    563        25711  LEGO_S#013_Visit1 Databrary                                      115106     218347  c(7205261, 7423608)   
    563        25711  LEGO_S#013_Visit1 Questionnaires                                 115108    2770902  c(7424512, 10195414)  
    563        25711  LEGO_S#013_Visit1 2-Hour                                         115112    7203414  c(10196313, 17399727) 
    563        25817  LEGO_S#014_Visit1 Housemap                                       115359     397035  c(0, 397035)          
    563        25817  LEGO_S#014_Visit1 Questionnaires                                 115363    3048768  c(397929, 3446697)    
    563        25817  LEGO_S#014_Visit1 2-Hour                                         115404    7241963  c(3447574, 10689537)  
    563        25818  LEGO_S#014_Visit2 Questionnaires                                 115394    1838464  c(0, 1838464)         
    563        25818  LEGO_S#014_Visit2 2-Hour                                         115418    6947606  c(1839464, 8787070)   
    563        25945  LEGO_S#013_Visit2 Housemap                                       115654     405526  c(0, 405526)          
    563        25945  LEGO_S#013_Visit2 Questionnaires                                 115656      60694  c(406438, 467132)     
    563        25945  LEGO_S#013_Visit2 2-Hour                                         115658    7201835  c(468132, 7669967)    
    563        25973  LEGO_S#015_Visit1 2-Hour.mov                                     115923    7203819  c(0, 7203819)         
    563        25973  LEGO_S#015_Visit1 Housemap                                       115925     459584  c(7204729, 7664313)   
    563        25973  LEGO_S#015_Visit1 Questionnaires                                 115927    2200832  c(7665221, 9866053)   
    563        25974  LEGO_S#015_Visit2 2-Hour                                         115929    7202816  c(0, 7202816)         
    563        25974  LEGO_S#015_Visit2 Questionnaires                                 115931    1402027  c(7203728, 8605755)   
    563        26340  LEGO_S#016_Visit1 2-Hour                                         117096    7108224  c(0, 7108224)         
    563        26340  LEGO_S#016_Visit1 Housemap                                       117098     302934  c(7109134, 7412068)   
    563        26340  LEGO_S#016_Visit1 Intro and Consent                              117100     203328  c(7412870, 7616198)   
    563        26340  LEGO_S#016_Visit1 Questionnaires                                 117102    2713344  c(7617198, 10330542)  
    563        26343  LEGO_S#017_Visit1 2-Hour                                         118347    7201835  c(0, 7201835)         
    563        26343  LEGO_S#017_Visit1 Questionnaires                                 118355    1865494  c(7202727, 9068221)   
    563        26344  LEGO_S#017_Visit2 Questionnaires                                 118343     922048  c(7867923, 8789971)   
    563        26344  LEGO_S#017_Visit2 Housemap                                       140001     732950  c(8790971, 9523921)   
    563        26344  LEGO_S#017_Visit1 2-Hour.mov                                     140015    7207830  c(9524769, 16732599)  
    563        26890  LEGO_S#018_Visit1 2-Hour.mov                                     120738    7126251  c(0, 7126251)         
    563        26890  LEGO_S#018_Visit1 Questionnaires.mov                             121241     295510  c(7127251, 7422761)   
    563        27064  LEGO_S#019_Visit1 2-Hour                                         119817    7201323  c(0, 7201323)         
    563        27064  LEGO_S#019_Visit1 Housemap                                       119819     496128  c(7202227, 7698355)   
    563        27064  LEGO_S#019_Visit1 Questionnaires                                 119829    1256384  c(7699255, 8955639)   
    563        27109  LEGO_S#018_Visit2 Questionnaires                                 120038     662294  c(0, 662294)          
    563        27109  LEGO_S#018_Visit2 2-Hour                                         120046    7201323  c(663194, 7864517)    
    563        27109  LEGO_S#018_Visit2 Databrary                                      120151     340480  c(7865421, 8205901)   
    563        27109  LEGO_S#018_Visit2 Housemap                                       120528     365504  c(8206794, 8572298)   
    563        27457  LEGO_S#020_Visit1 2-Hour                                         122063    7201323  c(0, 7201323)         
    563        27457  LEGO_S#020_Visit1 Questionnaires                                 122093    2567702  c(7202227, 9769929)   
    563        27920  LEGO_S#021_Visit1 Questionnaires II                              126761    1935062  c(0, 1935062)         
    563        27920  LEGO_S#021_Visit1 Questionnaires I- Locomotor                    126767     325952  c(1935966, 2261918)   
    563        27920  LEGO_S#021_Visit1 2-Hour                                         126775    7216832  c(2262824, 9479656)   
    563        28159  LEGO_S#021_Visit2 2-Hour                                         127624    7211840  c(0, 7211840)         
    563        28159  LEGO_S#021_Visit2 Housemap                                       127626     574208  c(7212737, 7786945)   
    563        28159  LEGO_S#021_Visit2 Questionnaires 2 & Databrary                   127628     865003  c(7787843, 8652846)   
    563        28159  LEGO_S#021_Visit2 Questionnaires                                 127631    1171307  c(8653740, 9825047)   
    563        28959  LEGO_S#022_Visit1 2-Hour                                         130244    7201835  c(0, 7201835)         
    563        28959  LEGO_S#022_Visit1 Questionnaires                                 130246    2803926  c(7202727, 10006653)  
    563        28959  LEGO_S#022_Visit1 Housemap                                       139993     537750  c(10007653, 10545403) 
    563        29302  LEGO_S#022_Visit2 2-Hour                                         132592    7207830  c(0, 7207830)         
    563        29302  LEGO_S#022_Visit2 Questionnaires                                 132594    2646784  c(7208733, 9855517)   
    563        29347  LEGO_S#023_Visit1 2-Hour                                         132915    7208342  c(0, 7208342)         
    563        29347  LEGO_S#023_Visit1 Questionnaires                                 132917    2178816  c(7209234, 9388050)   
    563        29464  LEGO_S#024_Visit1 2-Hour                                         133781    7211840  c(0, 7211840)         
    563        29464  LEGO_S#024_Visit1 Questionnaires                                 133791    1793920  c(7212737, 9006657)   
    563        29543  LEGO_S#024_Visit2 Questionnaires                                 139985    1047680  c(0, 1047680)         
    563        29543  LEGO_S#024_Visit2 Housemap                                       139989     430571  c(1048579, 1479150)   
    563        29543  LEGO_S#024_Visit2 Questionnaires.mov                             139991    1047680  c(1480042, 2527722)   
    563        29595  LEGO_S#023_Visit2 2-Hour                                         134600    6210326  c(0, 6210326)         
    563        29595  LEGO_S#023_Visit2 Housemap                                       134606     491115  c(6211237, 6702352)   
    563        29595  LEGO_S#023_Visit2 Questionnaires                                 134612    1106731  c(6703260, 7809991)   
    563        29895  LEGO_S#025_Visit1 2-Hour                                         136644    7204822  c(0, 7204822)         
    563        29895  LEGO_S#025_Visit1 Questionnaires                                 136646    1785408  c(7205730, 8991138)   
    563        29906  LEGO_S#025_Visit2 Questionnaires                                 136673     998635  c(0, 998635)          
    563        29906  LEGO_S#025_Visit2 2-Hour                                         136677    7312960  c(999530, 8312490)    
    563        29906  LEGO_S#025_Visit2 Housemap                                       136679     466603  c(8313435, 8780038)   
    563        29906  LEGO_S#025_Visit2 Decibel meter location                         136681       7147  c(8780934, 8788081)   
    563        29971  LEGO_S#026_Visit1 2-Hour                                         137012    7205824  c(0, 7205824)         
    563        29971  LEGO_S#026_Visit1 Housemap                                       137014     431552  c(7206731, 7638283)   
    563        29971  LEGO_S#026_Visit1 Questionnaires                                 137016    1868502  c(7639195, 9507697)   
    563        30156  LEGO_S#027_Visit1 2-Hour                                         137406    6884011  c(0, 6884011)         
    563        30156  LEGO_S#027_Visit1 Questionnaires                                 139981    2565782  c(6885011, 9450793)   
    563        30240  LEGO_S#026_Visit2 2-Hour                                         137935    7035158  c(0, 7035158)         
    563        30240  LEGO_S#026_Visit2 Questionnaires                                 137937    1174806  c(7036061, 8210867)   
    563        30240  LEGO_S#026_Visit2 Solitary Play                                  137939     130752  c(8211767, 8342519)   
    563        30242  LEGO_S#028_Visit1 2-Hour                                         137563    7204331  c(0, 7204331)         
    563        30242  LEGO_S#028_Visit1 Questionnaires                                 137565    2221355  c(7205230, 9426585)   
    563        30290  LEGO_S#028_Visit2 Dyadic Play                                    138042     361984  c(0, 361984)          
    563        30290  LEGO_S#028_Visit2 Solitary Play                                  138044     125760  c(362894, 488654)     
    563        30290  LEGO_S#028_Visit2 Housemap                                       138050     592214  c(7716835, 8309049)   
    563        30290  LEGO_S#028_Visit2 Questionnaires                                 138052    1220352  c(8309959, 9530311)   
    563        30290  LEGO_S#028_Visit2 2-Hour                                         139973    7225430  c(9531311, 16756741)  
    563        30453  LEGO_S#029_Visit1 2-Hour                                         138945    7201323  c(0, 7201323)         
    563        30453  LEGO_S#029_Visit1 Questionnaires                                 138947    1809942  c(7202227, 9012169)   
    563        30453  LEGO_S#029_Visit1 Tablet Location                                139961      95723  c(9013169, 9108892)   
    563        30487  LEGO_S#030_Visit1 2-Hour                                         139631    7256982  c(0, 7256982)         
    563        30487  LEGO_S#030_Visit1 Questionnaires                                 139633    2186816  c(7257816, 9444632)   
    563        30487  LEGO_S#030_Visit1 Tablet location                                139957       7638  c(9445632, 9453270)   
    563        30494  LEGO_S#029_Visit2 Databrary                                      139659     146283  c(0, 146283)          
    563        30494  LEGO_S#029_Visit2 Housemap                                       139661     511638  c(147179, 658817)     
    563        30494  LEGO_S#029_Visit2 Tablet location                                139669       5142  c(659723, 664865)     
    563        30494  LEGO_S#029_Visit2 Solitary Play                                  139673     240875  c(659723, 900598)     
    563        30494  LEGO_S#029_Visit2 Questionnaires                                 139671    1106731  c(659723, 1766454)    
    563        30494  LEGO_S#029_Visit2 2-Hour                                         139677    7210838  c(1767361, 8978199)   
    563        30511  LEGO_S#030_Visit2 Housemap                                       139855     597824  c(0, 597824)          
    563        30511  LEGO_S#030_Visit2 Questionnaires                                 139857    1270891  c(598663, 1869554)    
    563        30511  LEGO_S#030_Visit2 Solitary Play                                  139859     241878  c(1870465, 2112343)   
    563        30524  LEGO_S#020_Visit2 Housemap.mov                                   140005     461590  c(0, 461590)          
    563        30524  LEGO_S#020_Visit2 2-Hour.mov                                     140009    7203328  c(0, 7203328)         
    563        30524  LEGO_S#020_Visit2 Questionnaires.mov                             140007     957078  c(462590, 1419668)    
    563        30525  LEGO_S#016_Visit2 Databrary                                      139995     122262  c(0, 122262)          
    563        30525  LEGO_S#016_Visit2 Questionnaires.mov                             139997     784491  c(123155, 907646)     
    563        30525  LEGO_S#016_Visit2 2-Hour.mov                                     140013    7202326  c(908646, 8110972)    
    563        30526  LEGO_S#019_Visit2 2-Hour.mov                                     140003    1177302  c(0, 1177302)         
    563        30526  LEGO_S#019_Visit2 Questionnaires.mov                             140011    1052672  c(1178302, 2230974)   
    563        31726  LEGO_S#031_Visit1 Housemap                                       146628     645355  c(0, 645355)          
    563        31726  LEGO_S#031_Visit1 Quesitonnaires                                 146630    3843478  c(646244, 4489722)    
    563        31726  LEGO_S#031_Visit1 2-Hour                                         146632    7318443  c(4490616, 11809059)  
    563        31749  LEGO_S#032_Visit1 Housemap                                       146778     509142  c(0, 509142)          
    563        31749  LEGO_S#032_Visit1 Questionnaires                                 146780    1801942  c(510041, 2311983)    
    563        31749  LEGO_S#032_Visit1 2-Hour                                         146782    7233856  c(2312874, 9546730)   
    563        31801  LEGO_S#031_Visit2 2-Hour                                         147013    7221355  c(0, 7221355)         
    563        31801  LEGO_S#031_Visit2 Questionnaires                                 147015    2353472  c(7222247, 9575719)   
    563        31805  LEGO_S#032_Visit2 2-Hour                                         147111    7218347  c(0, 7218347)         
    563        31805  LEGO_S#032_Visit2 Databrary                                      147113     208832  c(7219244, 7428076)   
    563        31805  LEGO_S#032_Visit2 Dyadic Play                                    147115     346475  c(7428985, 7775460)   
    563        31805  LEGO_S#032_Visit2 Solitary Play                                  147117     300928  c(7776364, 8077292)   
    563        31895  LEGO_S#033_Visit1 Housemap                                       147497     741867  c(0, 741867)          
    563        31895  LEGO_S#033_Visit1 Questionnaires                                 147499    1319446  c(742774, 2062220)    
    563        31895  LEGO_S#033_Visit1  2-Hour                                        147507    7297430  c(2063125, 9360555)   
    563        32142  LEGO_S#032_Visit2 Outfit                                         148318      20160  c(0, 20160)           
    563        32142  LEGO_S#033_Visit2  2-Hour                                        148320    7281579  c(21160, 7302739)     
    563        32142  LEGO_S#033_Visit2 Databrary                                      148322     206827  c(7303567, 7510394)   
    563        32142  LEGO_S#033_Visit2 Questionnaires                                 148324     246379  c(7511306, 7757685)   
    563        32454  LEGO_S#034_Visit1 Housemap                                       149348     492630  c(0, 492630)          
    563        32454  LEGO_S#034_Visit1  2-Hour                                        149351    7241366  c(0, 7241366)         
    563        32454  LEGO_S#034_Visit1 Questionnaires                                 149384    2970091  c(7242267, 10212358)  
    563        32463  LEGO_S#034_Visit2 Dyadic Play                                    149516     330966  c(0, 330966)          
    563        32463  LEGO_S#034_Visit2 Questionnaires                                 149518     925859  c(331863, 1257722)    
    563        32463  LEGO_S#034_Visit2 Solitary Play                                  149520     336000  c(1258344, 1594344)   
    563        32463  LEGO_S#034_Visit2 2-Hour                                         149594    7377024  c(1595344, 8972368)   
    563        32807  LEGO_S#035_Visit1 Databrary                                      151194     136768  c(0, 136768)          
    563        32807  LEGO_S#035_Visit1 Questionnaires                                 151200    2692822  c(137768, 2830590)    
    563        32807  LEGO_S#035_Visit1 2-Hour                                         151206    6640234  c(2831491, 9471725)   
    563        32827  LEGO_S#036_Visit 1 2-Hour                                        151323    7158315  c(0, 7158315)         
    563        32827  LEGO_S#036_Visit1 Questionnaires                                 151966    3668288  c(7159315, 10827603)  
    563        32866  LEGO_S#035_Visit2 House map                                      151673     563776  c(0, 563776)          
    563        32866  LEGO_S#035_Visit2 2-Hour                                         151675    7256960  c(0, 7256960)         
    563        32866  LEGO_S#035_Visit2 Questionnaires                                 151677     733867  c(7257849, 7991716)   
    563        32974  LEGO_S#037_Visit1 Questionnaires                                 151916    1808427  c(0, 1808427)         
    563        32974  LEGO_S#037_Visit1 2-Hours                                        151918    7211840  c(1809339, 9021179)   
    563        32990  LEGO_S#037_Visit2 Dyadic Play                                    151956     302443  c(0, 302443)          
    563        32990  LEGO_S#037_Visit2 Outfit                                         151958      11136  c(303335, 314471)     
    563        32990  LEGO_S#037_Visit2 House map                                      151960     485611  c(303335, 788946)     
    563        32990  LEGO_S#037_Visit2 Questionnaires                                 151962    3512150  c(789853, 4302003)    
    563        32990  LEGO_S#037_Visit2 2-Hour                                         151964    7215830  c(4302894, 11518724)  
    563        33000  LEGO_S#036_Visit2 DyadicPlay                                     151980     242880  c(0, 242880)          
    563        33000  LEGO_S#036_Visit2 Outfit                                         151982      21142  c(243775, 264917)     
    563        33000  LEGO_S#036_Visit2 Questionnaires                                 151984    1051734  c(265829, 1317563)    
    563        33000  LEGO_S#036_Visit2 SolitaryPlay                                   151986     268502  c(1318412, 1586914)   
    563        33000  LEGO_S#036_Visit2 2-hour                                         151988    7255062  c(1587746, 8842808)   
    563        33008  LEGO_S#038_Visit1 2-Hour                                         152006    7210838  c(0, 7210838)         
    563        33008  LEGO_S#038_Visit1 Questionnaires                                 152017    2413035  c(7211736, 9624771)   
    563        33459  LEGO_S#040_Visit1 Housemap                                       154689     505643  c(0, 505643)          
    563        33459  LEGO_S#040_Visit1 2-Hour                                         154691    7213334  c(0, 7213334)         
    563        33459  LEGO_S#040_Visit1 Questionnaires                                 154693    1943062  c(7214239, 9157301)   
    563        34133  LEGO_S#041_Visit1 Housemap                                       159199     714838  c(0, 714838)          
    563        34133  LEGO_S#041_Visit1 2-Hour                                         159201    7265899  c(0, 7265899)         
    563        34133  LEGO_S#041_Visit1 Questionnaires1                                159203    2116246  c(7266791, 9383037)   
    563        34133  LEGO_S#041_Visit1 Questionnaires2                                159205    1356992  c(9383938, 10740930)  
    563        34439  LEGO_S#041_Visit2 Questionnaires                                 160292    1010134  c(0, 1010134)         
    563        34439  LEGO_S#041 2-Hour                                                160294    7221355  c(0, 7221355)         
    563        34870  LEGO_S#042_Visit1 Questionnaires                                 161566    1899520  c(413945, 2313465)    
    563        34870  LEGO_S#042_Visit1 2-Hour                                         161572    7221355  c(2314375, 9535730)   
    563        34870  LEGO_S#042_Visit1 Housemap                                       162143     479680  c(9536730, 10016410)  
    563        34961  LEGO_S#038_Visit2 Shoes                                          161816      27648  c(0, 27648)           
    563        34961  LEGO_S#038_Visit2 Housemap                                       161818     397611  c(28560, 426171)      
    563        34961  LEGO_S#038_Visit2 Questionnaires                                 161822    1340480  c(427023, 1767503)    
    563        34961  LEGO_S#038_Visit2 2-hour                                         161824    7231360  c(1768395, 8999755)   
    563        35063  LEGO_S#042_Visit2 Questionnaires                                 162139    1213334  c(0, 1213334)         
    563        35063  LEGO_S#042_Visit2 Dyadic Play.mov                                162141     317440  c(1214245, 1531685)   
    563        35095  LEGO_S#043_Visit1 2-Hour                                         162270    7218838  c(0, 7218838)         
    563        35095  LEGO_S#043_Visit1 Housemap                                       162272     333056  c(7219744, 7552800)   
    563        35095  LEGO_S#043_Visit1 Questionnaires                                 162276    1723862  c(7553643, 9277505)   
    563        35172  LEGO_S#043_Visit2 Questionnaires                                 190825    1300928  c(0, 1300928)         
    563        35172  LEGO_S#043_Visit2 2-Hour                                         190823    7261888  c(0, 7261888)         
    563        36221  LEGO_S#044_Visit1 2-hrs                                          170461    7374336  c(0, 7374336)         
    563        36221  LEGO_S#044_Visit1 Questionnaires                                 170463    1931363  c(7375200, 9306563)   
    563        36745  LEGO_S#045_Visit1 Housemap                                       190819     446080  c(0, 446080)          
    563        36745  LEGO_S#045_Visit1 2-Hour                                         190821    7206827  c(0, 7206827)         
    563        36926  LEGO_S#045_Visit2 2-hour                                         174982    7231851  c(0, 7231851)         
    563        36926  LEGO_S#045_Visit2 Questionnaires                                 174984    1318443  c(7232757, 8551200)   
    563        38271  LEGO_S#046_Visit1 2-hour                                         183459    7201323  c(0, 7201323)         
    563        38271  LEGO_S#046_Visit 1 Questionnaires                                183469    1781419  c(7202227, 8983646)   
    563        38271  LEGO_S#046_Visit1 Housemap                                       183471    1309035  c(8984539, 10293574)  
    563        38306  LEGO_S#046_Visit 2 Questionnaires                                183559    1866496  c(0, 1866496)         
    563        38306  LEGO_S#046_Visit2 2-hour                                         183561    7260886  c(1867397, 9128283)   
    563        38934  LEGO_S#047_Visit1 Questionnaire                                  188712     745366  c(0, 745366)          
    563        38934  LEGO_S#047_Visit1 Questionnaires_2                               188715    1111744  c(746277, 1858021)    
    563        38934  LEGO_S#047_Visit1 Housemap_1                                     188723     189312  c(1858920, 2048232)   
    563        38934  LEGO_S#047_Visit1 2-hour                                         188729    7231851  c(1858920, 9090771)   
    563        38934  LEGO_S#047_Visit1 Housemap_2                                     188735    1388523  c(9091677, 10480200)  
    563        39246  LEGO_S#048_Visit1 2-Hour                                         189770    7231851  c(0, 7231851)         
    563        39246  LEGO_S#048_Visit1 Questionnaires                                 189772    2514134  c(7232757, 9746891)   
    563        39375  LEGO_S#048_Visit2 2-hour                                         190335    7231360  c(0, 7231360)         
    563        39375  LEGO_S#048_Visit2 Housemap                                       190337     733867  c(7232257, 7966124)   
    563        39375  LEGO_S#048_Visit2 Questionnaires                                 190339    1153792  c(7967023, 9120815)   
    563        39474  LEGO_S#049_Visit1 Housemap                                       190782     200342  c(0, 200342)          
    563        39474  LEGO_S#049_Visit1 2-Hour_1                                       190784    5967595  c(201233, 6168828)    
    563        39474  LEGO_S#049_Visit1 2-Hour_2                                       190788    1321451  c(6169727, 7491178)   
    563        39478  LEGO_S#047_Visit2 2-Hour                                         190815    7220843  c(0, 7220843)         
    563        39478  LEGO_S#047_Visit2 Questionnaires                                 190817    1733867  c(7221746, 8955613)   
    563        39554  LEGO_S#050_Visit1 2-Hour                                         192500    7211840  c(0, 7211840)         
    563        39554  LEGO_S#050_Visit1 Questionnaires                                 192502    2039659  c(7212737, 9252396)   
    563        39597  LEGO_S#050_Visit2 Housemap                                       192789     769899  c(0, 769899)          
    563        39597  LEGO_S#050_Visit2 2-Hour                                         192791    7246379  c(0, 7246379)         
    563        39597  LEGO_S#050_Visit2 Questionnaires                                 192793    1586710  c(7247272, 8833982)   
    563        39646  LEGO_S#051_Visit1 2-Hour                                         193287    7201323  c(0, 7201323)         
    563        39646  LEGO_S#051_Visit1 Questionnaires                                 193289    4365995  c(7202227, 11568222)  
    563        39882  LEGO_S#052_Visit1 Housemap                                       193755    1051691  c(0, 1051691)         
    563        39882  LEGO_S#052_Visit1 2-Hour                                         193757    7192320  c(0, 7192320)         
    563        39882  LEGO_S#052_Visit1 Questionnaires                                 193759    4007638  c(7193218, 11200856)  
    563        39890  LEGO_S#051_Visit2 2-Hour                                         193974    7212843  c(0, 7212843)         
    563        39890  LEGO_S#051_Visit2 Housemap                                       193976    1838976  c(7213738, 9052714)   
    563        39890  LEGO_S#051_Visit2 Questionnaires                                 193980    2882518  c(9053608, 11936126)  
    563        39939  LEGO_S#052_Visit2 2-Hour                                         194157    7203819  c(0, 7203819)         
    563        39939  LEGO_S#052_Visit2 Questionnaires                                 194159    1742870  c(7204729, 8947599)   
    563        40267  LEGO_S#053_Visit1 Housemap                                       194691     493632  c(0, 493632)          
    563        40267  LEGO_S#053_Visit1 2-Hour                                         194693    7231360  c(494526, 7725886)    
    563        40267  LEGO_S#053_Visit1 Questionnaires                                 194695    2338966  c(7726783, 10065749)  
    563        40267  LEGO_S#053_Visit1 Questionnaires (part 2)                        194697     277910  c(10066652, 10344562) 
    563        40428  LEGO_S#053_Visit2 Questionnaire                                  199466    1405526  c(0, 1405526)         
    563        40428  LEGO_S#053_Visit2 2-Hour                                         199468    7221355  c(1406437, 8627792)   
    563        40456  LEGO_S#054_Visit1 2-Hour                                         199738    7201323  c(0, 7201323)         
    563        40456  LEGO_S#054_Visit1 Questionnaires                                 199740    1281408  c(7202227, 8483635)   
    563        40518  LEGO_S#054_Visit2 Housemap                                       200265    1048171  c(0, 1048171)         
    563        40518  LEGO_S#054_Visit1 2-Hour                                         200267    7221355  c(0, 7221355)         
    563        40518  LEGO_S#054_Visit2 Questionnaires                                 200269    1534656  c(7222247, 8756903)   
    563        40817  LEGO_S#055_Visit1 2-Hour                                         201388    7262379  c(0, 7262379)         
    563        40817  LEGO_S#055_Visit1 Questionnaires                                 201390    2046166  c(7263288, 9309454)   
    563        41504  LEGO_S#056_Visit1 Housemap                                       205398     381014  c(0, 381014)          
    563        41504  LEGO_S#056_Visit1 2-Hour                                         205400    7205824  c(0, 7205824)         
    563        41504  LEGO_S#056_Visit1 Questionnaires                                 205402     821462  c(381913, 1203375)    
    563        41554  LEGO_S#056_Visit2 Questionnaires                                 205983    1488619  c(0, 1488619)         
    563        41554  LEGO_S#056_Visit2 2-Hour                                         205987    7241856  c(1489520, 8731376)   
    563        41637  LEGO_S#055_Visit2 Housemap1                                      206372      50688  c(0, 50688)           
    563        41637  LEGO_S#055_Visit2 2-Hour                                         206374    5953088  c(0, 5953088)         
    563        41637  LEGO_S#055_Visit2 Housemap2                                      206376    1237867  c(5953980, 7191847)   
    563        41637  LEGO_S#055_Visit2 Questionnaires                                 206378    1691819  c(7192749, 8884568)   

### Datavyu (.opf)


```r
opf_files <- databraryapi::list_assets_by_type(as.numeric(params$vol_id), type = "datavyu")

if (is.null(opf_files)) {
  cat("No Datavyu (.opf) files in volume.")
} else {
  opf_filtered <- opf_files %>%
    dplyr::select(vol_id, session_id, name, 
                  asset_id, duration, segment)
  
  opf_filtered %>%
    knitr::kable(.)  
}
```



 vol_id   session_id  name                                           asset_id   duration  segment 
-------  -----------  --------------------------------------------  ---------  ---------  --------
    563        32807  LEGO_S#035_Visit1_Transcription (Temporary)      205389         NA  NULL    

### Text


```r
text_files <- databraryapi::list_assets_by_type(as.numeric(params$vol_id), type = "text")

if (is.null(text_files)) {
  cat("No text files in volume.")
} else {
  text_filtered <- text_files %>%
    dplyr::select(vol_id, session_id, name, 
                  asset_id, duration, segment)
  
  opf_filtered %>%
    knitr::kable(.)  
}
```

```
## No text files in volume.
```
