---
title: "volume-report"
author: "Rick Gilmore"
date: "2019-10-04 16:21:22"
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

# 4 : Crawling and walking infants see the world differently

## Summary data

### Owners


```r
cat(stringr::str_replace_all(string = as.character(vol_data$owners), replacement = "/n", pattern ="; "))
```

```
## Adolph, Karen
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
## https://doi.org/10.17910/B7RP4H
```

## Materials & Data {.tabset}

### Materials


```r
these_sessions <- databraryapi::download_session_csv(as.numeric(params$vol_id))
materials <- these_sessions %>%
  dplyr::filter(session_date == "materials") %>%
  dplyr::mutate(url = paste0("https://databrary.org/volume/", 
                             params$vol_id, "/slot/", session_id, "/-")) %>%
  dplyr::select(session_name, url)

materials %>%
  knitr::kable(.)
```



session_name   url                                        
-------------  -------------------------------------------
NA             https://databrary.org/volume/4/slot/6249/- 
NA             https://databrary.org/volume/4/slot/6250/- 

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



 participant.ID  group.name   participant.gender   participant.race            participant.ethnicity     url                                      
---------------  -----------  -------------------  --------------------------  ------------------------  -----------------------------------------
              1  Crawler      Female               Asian                       Unknown or not reported   https://databrary.org/volume/4/slot/13/- 
              5  Crawler      Female               White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/17/- 
             10  Crawler      Female               Asian                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/22/- 
             11  Crawler      Female               White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/23/- 
             14  Crawler      Female               White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/26/- 
             15  Crawler      Female               White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/27/- 
             17  Crawler      Female               More than one               Not Hispanic or Latino    https://databrary.org/volume/4/slot/29/- 
             19  Crawler      Female               More than one               Unknown or not reported   https://databrary.org/volume/4/slot/30/- 
             14  Crawler      Female               More than one               Not Hispanic or Latino    https://databrary.org/volume/4/slot/45/- 
             24  Crawler      Female               Black or African American   Not Hispanic or Latino    https://databrary.org/volume/4/slot/55/- 
             34  Crawler      Female               Black or African American   Not Hispanic or Latino    https://databrary.org/volume/4/slot/65/- 
             38  Crawler      Female               Unknown or not reported     Hispanic or Latino        https://databrary.org/volume/4/slot/69/- 
             42  Crawler      Female               White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/73/- 
             43  Crawler      Female               White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/74/- 
             45  Crawler      Female               White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/76/- 
             48  Crawler      Female               White                       Hispanic or Latino        https://databrary.org/volume/4/slot/79/- 
              7  Crawler      Male                 White                       Hispanic or Latino        https://databrary.org/volume/4/slot/19/- 
              8  Crawler      Male                 White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/20/- 
              9  Crawler      Male                 White                       Hispanic or Latino        https://databrary.org/volume/4/slot/21/- 
             12  Crawler      Male                 White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/24/- 
             13  Crawler      Male                 Asian                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/25/- 
             16  Crawler      Male                 White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/28/- 
              1  Crawler      Male                 Asian                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/32/- 
              3  Crawler      Male                 White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/34/- 
              5  Crawler      Male                 White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/36/- 
             19  Crawler      Male                 White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/50/- 
             27  Crawler      Male                 White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/58/- 
             29  Crawler      Male                 White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/60/- 
             32  Crawler      Male                 Asian                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/63/- 
             36  Crawler      Male                 White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/67/- 
             37  Crawler      Male                 Asian                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/68/- 
             39  Crawler      Male                 White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/70/- 
             46  Crawler      Male                 White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/77/- 
             47  Crawler      Male                 More than one               Not Hispanic or Latino    https://databrary.org/volume/4/slot/78/- 
             49  Crawler      Male                 More than one               Hispanic or Latino        https://databrary.org/volume/4/slot/80/- 
              2  Walker       Female               More than one               Hispanic or Latino        https://databrary.org/volume/4/slot/14/- 
              4  Walker       Female               White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/35/- 
              6  Walker       Female               Unknown or not reported     Unknown or not reported   https://databrary.org/volume/4/slot/37/- 
             12  Walker       Female               White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/43/- 
             13  Walker       Female               White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/44/- 
             16  Walker       Female               White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/47/- 
             18  Walker       Female               White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/49/- 
             20  Walker       Female               White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/51/- 
             22  Walker       Female               White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/53/- 
             25  Walker       Female               White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/56/- 
             26  Walker       Female               More than one               Not Hispanic or Latino    https://databrary.org/volume/4/slot/57/- 
             40  Walker       Female               More than one               Hispanic or Latino        https://databrary.org/volume/4/slot/71/- 
             41  Walker       Female               White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/72/- 
             44  Walker       Female               White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/75/- 
              3  Walker       Male                 White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/15/- 
              4  Walker       Male                 White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/16/- 
              6  Walker       Male                 Unknown or not reported     Unknown or not reported   https://databrary.org/volume/4/slot/18/- 
              2  Walker       Male                 More than one               Not Hispanic or Latino    https://databrary.org/volume/4/slot/33/- 
              7  Walker       Male                 Unknown or not reported     Hispanic or Latino        https://databrary.org/volume/4/slot/38/- 
              8  Walker       Male                 White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/39/- 
              9  Walker       Male                 White                       Hispanic or Latino        https://databrary.org/volume/4/slot/40/- 
             10  Walker       Male                 Asian                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/41/- 
             11  Walker       Male                 More than one               Not Hispanic or Latino    https://databrary.org/volume/4/slot/42/- 
             15  Walker       Male                 White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/46/- 
             17  Walker       Male                 White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/48/- 
             21  Walker       Male                 Asian                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/52/- 
             23  Walker       Male                 Asian                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/54/- 
             28  Walker       Male                 Unknown or not reported     Unknown or not reported   https://databrary.org/volume/4/slot/59/- 
             30  Walker       Male                 White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/61/- 
             31  Walker       Male                 More than one               Hispanic or Latino        https://databrary.org/volume/4/slot/62/- 
             33  Walker       Male                 White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/64/- 
             35  Walker       Male                 White                       Not Hispanic or Latino    https://databrary.org/volume/4/slot/66/- 

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
--------  ---  -------  -----
            0        0      0
Crawler     0       16     19
Walker      0       14     18

```r
age_gender_table %>%
  vcd::mosaic(.)
```

![](/Users/rick/github/PLAY-behaviorome/workflow/vol_reports/volume-report-4_files/figure-html/participant-summary-1.png)<!-- -->

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



 vol_id   session_id  name                  asset_id   duration  segment             
-------  -----------  -------------------  ---------  ---------  --------------------
      4           13  Intake                   11806     830897  c(555000, 1385897)  
      4           13  NA                          30     591124  c(1385900, 1977024) 
      4           14  NA                       25448     919426  c(101594, 1021020)  
      4           15  NA                          29     483483  c(0, 483483)        
      4           16  NA                       25449    1004269  c(133397, 1137666)  
      4           17  NA                       25450    1188439  c(33282, 1221721)   
      4           18  NA                       25451    1412354  c(66645, 1478999)   
      4           19  NA                       25452    1326914  c(125056, 1451970)  
      4           20  NA                          39     759259  c(0, 759259)        
      4           21  NA                          44     547074  c(0, 547074)        
      4           22  NA                       11801     974162  c(166000, 1140162)  
      4           23  NA                          47     848348  c(0, 848348)        
      4           25  Intake                   11802    1349882  c(35000, 1384882)   
      4           25  NA                          26     531543  c(1384890, 1916433) 
      4           26  Intake and warm-up          35    1114135  c(0, 1114135)       
      4           26  NA                          22     252759  c(1114150, 1366909) 
      4           27  Intake                   11803     492066  c(60000, 552066)    
      4           27  NA                          41     952471  c(552080, 1504551)  
      4           28  NA                       11804    1322855  c(30000, 1352855)   
      4           29  NA                          27    1092610  c(0, 1092610)       
      4           30  Intake part 1            11805    1225391  c(160000, 1385391)  
      4           30  Intake part 2               37     422956  c(1385390, 1808346) 
      4           30  NA                          50    1095106  c(2480510, 3575616) 
      4           32  NA                         102     306950  c(0, 306950)        
      4           34  NA                        9218     392902  c(0, 392902)        
      4           35  NA                        9220     807658  c(0, 807658)        
      4           36  NA                        9222     542251  c(0, 542251)        
      4           37  NA                        9224     356065  c(0, 356065)        
      4           39  NA                        9226     226736  c(0, 226736)        
      4           40  NA                        9228     181291  c(0, 181291)        
      4           42  NA                          61     754447  c(0, 754447)        
      4           43  NA                          65     244580  c(0, 244580)        
      4           44  NA                         107     301414  c(0, 301414)        
      4           45  NA                          63     205000  c(0, 205000)        
      4           47  NA                          69     388310  c(0, 388310)        
      4           48  NA                          91     400576  c(0, 400576)        
      4           49  NA                         100     235310  c(0, 235310)        
      4           52  NA                        9230     344487  c(0, 344487)        
      4           53  NA                        9232    1061270  c(0, 1061270)       
      4           55  NA                         101     409943  c(0, 409943)        
      4           56  NA                          62     365910  c(0, 365910)        
      4           58  NA                          88     342710  c(0, 342710)        
      4           60  NA                        9234     354834  c(0, 354834)        
      4           61  Scene                     9236     404523  c(0, 404523)        
      4           61  Eye                       9238     407296  c(404523, 811819)   
      4           62  NA                          83     392800  c(0, 392800)        
      4           63  NA                          86     316443  c(0, 316443)        
      4           64  NA                         104     385343  c(0, 385343)        
      4           65  NA                        9240     305276  c(0, 305276)        
      4           66  Side                      9246     252811  c(0, 252811)        
      4           66  Scene                     9242     402336  c(0, 402336)        
      4           66  Eye                       9244     402336  c(0, 402336)        
      4           67  NA                        9248     345643  c(0, 345643)        
      4           68  NA                         106     383876  c(0, 383876)        
      4           69  NA                        9250     283414  c(0, 283414)        
      4           70  Scene                     9252     146013  c(0, 146013)        
      4           70  Eye                       9254     153454  c(0, 153454)        
      4           70  Side                      9256     389963  c(0, 389963)        
      4           72  NA                        9258     209576  c(0, 209576)        
      4           73  Eye                       9262     152019  c(0, 152019)        
      4           73  Scene                     9260     152068  c(0, 152068)        
      4           73  Side                      9264     200234  c(0, 200234)        
      4           74  NA                        9266     336210  c(0, 336210)        
      4           75  NA                          59     336852  c(0, 336852)        
      4           76  NA                          95     305970  c(0, 305970)        
      4           77  Trials                    9269     308311  c(0, 308311)        
      4           77  Eye                       9273     334401  c(0, 334401)        
      4           77  Scene                     9271     334623  c(0, 334623)        
      4           78  Trials                    9275     459479  c(0, 459479)        
      4           78  Eye                       9279     521855  c(0, 521855)        
      4           78  Scene                     9277     522171  c(0, 522171)        
      4           79  NA                          81     320668  c(0, 320668)        
      4           80  NA                          80     269956  c(0, 269956)        

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



 vol_id   session_id  name                            asset_id   duration  segment 
-------  -----------  -----------------------------  ---------  ---------  --------
      4           34  Coding spreadsheet                  9632         NA  0       
      4           36  Coding spreadsheet                  9633         NA  0       
      4           37  Coding spreadsheet                  9634         NA  0       
      4           39  Coding spreadsheet                  9635         NA  0       
      4           40  Coding spreadsheet                  9636         NA  0       
      4           42  Coding spreadsheet                  9637         NA  0       
      4           44  Coding spreadsheet                  9638         NA  0       
      4           45  Coding spreadsheet                  9639         NA  0       
      4           47  Coding spreadsheet                  9640         NA  0       
      4           48  Coding spreadsheet                  9641         NA  0       
      4           49  Coding spreadsheet                  9642         NA  0       
      4           52  Coding spreadsheet                  9643         NA  0       
      4           53  Coding spreadsheet                  9644         NA  0       
      4           55  Coding spreadsheet                  9645         NA  0       
      4           56  Coding spreadsheet                  9646         NA  0       
      4           58  Coding spreadsheet                  9647         NA  0       
      4           60  Coding spreadsheet                  9648         NA  0       
      4           62  Coding spreadsheet                  9649         NA  0       
      4           63  Coding spreadsheet                  9650         NA  0       
      4           64  Coding spreadsheet                  9651         NA  0       
      4           65  Coding spreadsheet                  9652         NA  0       
      4           67  Coding spreadsheet                  9653         NA  0       
      4           68  Coding spreadsheet                  9654         NA  0       
      4           69  Coding spreadsheet                  9655         NA  0       
      4           72  Coding spreadsheet                  9656         NA  0       
      4           74  Coding spreadsheet                  9657         NA  0       
      4           75  Coding spreadsheet                  9658         NA  0       
      4           76  Coding spreadsheet                  9659         NA  0       
      4           79  Coding spreadsheet                  9660         NA  0       
      4           80  Coding spreadsheet                  9661         NA  0       
      4         6250  Datavyu spreadsheet template          55         NA  NULL    

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
