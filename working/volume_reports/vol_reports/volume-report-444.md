---
title: "volume-report"
author: "Rick Gilmore"
date: "2019-10-04 16:07:29"
output: 
  html_document:
    keep_md: true
    theme: lumen
    toc: true
    toc_depth: 4
    toc_float: true
    code_folding: hide
    self-contained: false
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

# 444 : PLAY Project: Pilot Data Collections

## Summary data

### Owners


```r
cat(stringr::str_replace_all(string = as.character(vol_data$owners), replacement = "/n", pattern ="; "))
```

```
## Adolph, Karen/nTamis-LeMonda, Catherine/nGilmore, Rick O.
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
## https://databrary.org/volume/444
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



session_name             url                                           
-----------------------  ----------------------------------------------
Parent report data       https://databrary.org/volume/444/slot/26295/- 
Video exemplars          https://databrary.org/volume/444/slot/27087/- 
Supporting information   https://databrary.org/volume/444/slot/29558/- 

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



 participant.ID  group.name   participant.gender   participant.race          participant.ethnicity     url                                           
---------------  -----------  -------------------  ------------------------  ------------------------  ----------------------------------------------
             21               Male                 More than one             Hispanic or Latino        https://databrary.org/volume/444/slot/35609/- 
              8  12 mos       Female               White                     Hispanic or Latino        https://databrary.org/volume/444/slot/18811/- 
             13  12 mos       Female               White                     Not Hispanic or Latino    https://databrary.org/volume/444/slot/18818/- 
             15  12 mos       Female               Asian                     Not Hispanic or Latino    https://databrary.org/volume/444/slot/18821/- 
             20  12 mos       Male                 White                     Hispanic or Latino        https://databrary.org/volume/444/slot/18826/- 
              3  18 mos       Female               More than one             Hispanic or Latino        https://databrary.org/volume/444/slot/18805/- 
              6  18 mos       Female               White                     Not Hispanic or Latino    https://databrary.org/volume/444/slot/18808/- 
              7  18 mos       Female               White                     Not Hispanic or Latino    https://databrary.org/volume/444/slot/18810/- 
             11  18 mos       Female               Unknown or not reported   Hispanic or Latino        https://databrary.org/volume/444/slot/18815/- 
             14  18 mos       Female               White                     Not Hispanic or Latino    https://databrary.org/volume/444/slot/18819/- 
              1  18 mos       Male                 Unknown or not reported   Unknown or not reported   https://databrary.org/volume/444/slot/18801/- 
              2  18 mos       Male                 White                     Not Hispanic or Latino    https://databrary.org/volume/444/slot/18803/- 
              4  18 mos       Male                 White                     Not Hispanic or Latino    https://databrary.org/volume/444/slot/18806/- 
              9  18 mos       Male                 White                     Not Hispanic or Latino    https://databrary.org/volume/444/slot/18813/- 
             10  18 mos       Male                 White                     Not Hispanic or Latino    https://databrary.org/volume/444/slot/18814/- 
             16  18 mos       Male                 More than one             Hispanic or Latino        https://databrary.org/volume/444/slot/18822/- 
             18  18 mos       Male                 White                     Not Hispanic or Latino    https://databrary.org/volume/444/slot/18824/- 
              5  24 mos       Male                 White                     Not Hispanic or Latino    https://databrary.org/volume/444/slot/18807/- 
             12  24 mos       Male                 White                     Not Hispanic or Latino    https://databrary.org/volume/444/slot/18817/- 
             17  24 mos       Male                 White                     Not Hispanic or Latino    https://databrary.org/volume/444/slot/18823/- 
             19  24 mos       Male                 White                     Hispanic or Latino        https://databrary.org/volume/444/slot/18825/- 

### Participant summary


```r
gender_race <- sessions_filtered %>%
  select(group.name, participant.gender, participant.race)

levels(gender_race$participant.race) <- c(NA, "Asian", "Mult", "Unk", "Wht")
age_gender_table <- xtabs(formula = ~ group.name + participant.gender, data = sessions_filtered)

age_gender_table %>%
  knitr::kable(.)
```

               Female   Male
-------  ---  -------  -----
           0        0      1
12 mos     0        3      1
18 mos     0        5      7
24 mos     0        0      4

```r
age_gender_table %>%
  vcd::mosaic(.)
```

![](/Users/rick/github/PLAY-behaviorome/workflow/vol_reports/volume-report-444_files/figure-html/participant-summary-1.png)<!-- -->

## Videos uploaded


```r
videos <- databraryapi::list_assets_by_type(as.numeric(params$vol_id))

videos_filtered <- videos %>%
  dplyr::select(vol_id, session_id, name, asset_id, duration, segment)

videos_filtered %>%
  knitr::kable(.)
```



 vol_id   session_id  name                                            asset_id   duration  segment                 
-------  -----------  ---------------------------------------------  ---------  ---------  ------------------------
    444        18801  S#1_1-hour.mov                                     84604    3904000  c(0, 3904000)           
    444        18803  S#2_HouseMap.mov                                   84638     642496  c(0, 642496)            
    444        18803  S#2_1-Hour.mov                                     84640    3724843  c(0, 3724843)           
    444        18803  S#2_HouseMapNEW.mov                                84642    1250368  c(3725843, 4976211)     
    444        18803  S#2_HouseMapNEW_Unedited                           84644    1278912  c(4977211, 6256123)     
    444        18803  S#2_Questionnaires.mov                             84656    4344470  c(6257021, 10601491)    
    444        18803  S#2_QuestionnairesNEW.mov                          84658    2672003  c(10602491, 13274494)   
    444        18803  Bathroom1                                          86020       4630  c(13275494, 13280124)   
    444        18803  DownstairsHall                                     86022       8150  c(13275494, 13283644)   
    444        18803  FamilyRoom                                         86024       2624  c(13284535, 13287159)   
    444        18803  1_2Bath                                            86026       6340  c(13284535, 13290875)   
    444        18803  ParentBath                                         86028       3627  c(13291375, 13295002)   
    444        18803  NannyBed                                           86030       8150  c(13291375, 13299525)   
    444        18803  ParentBed                                          86032      18646  c(13300416, 13319062)   
    444        18803  TargetCBed                                         86034       4139  c(13319967, 13324106)   
    444        18803  ParentBedHall                                      86038       6144  c(13319967, 13326111)   
    444        18803  Sibling Bed                                        86036       6144  c(13319967, 13326111)   
    444        18803  UpstairsHall                                       86040       4139  c(13327006, 13331145)   
    444        18805  S#3_Books&Toys                                     84662      43243  c(0, 43243)             
    444        18805  S#3_1-Hour play.mov                                84668    3702336  c(0, 3702336)           
    444        18805  S#3_ObjPlayTasks.mov                               84666     250411  c(44162, 294573)        
    444        18805  S#3_HouseMap.mov                                   84664     521643  c(44162, 565805)        
    444        18805  Measure2                                           86002       8150  c(3703336, 3711486)     
    444        18805  Measure1                                           86004       8640  c(3712377, 3721017)     
    444        18805  Measure4                                           86006       6144  c(3721918, 3728062)     
    444        18805  Measure5                                           86008       8640  c(3728957, 3737597)     
    444        18805  Measure6                                           86010      10646  c(3728957, 3739603)     
    444        18805  Measure9                                           86016       3627  c(3740500, 3744127)     
    444        18805  Measure7                                           86013       5632  c(3740500, 3746132)     
    444        18805  Measure3                                           86014       6635  c(3740500, 3747135)     
    444        18805  Measure8                                           86018       9643  c(3748039, 3757682)     
    444        18806  S#4_1-Hour play.mov                                84672    3682304  c(60797000, 64479304)   
    444        18806  S#4_Solitary Play.mov                              84678     286422  c(60917000, 61203422)   
    444        18806  S#4_1-Hour_Intro&Experimenter.mov                  84670      35970  c(62051000, 62086970)   
    444        18806  S#4_Solitary Play_Experimenter.mov                 84684    3039659  c(63364000, 66403659)   
    444        18806  S#4_Solitary Play_Intro.mov                        84682      37972  c(63954000, 63991972)   
    444        18806  S#4_Questionnaires.mov                             84680    2631062  c(67544000, 70175062)   
    444        18806  S#4_HouseMap.mov                                   84674     919552  c(69039000, 69958552)   
    444        18806  S#4_PhoneQuestionnaire.mov                         84676     279403  c(71237000, 71516403)   
    444        18807  S#5_Phone Questionnaire.mov                        84697     237867  c(-12687000, -12449133) 
    444        18807  homemap-last piece                                 84687      10134  c(0, 10134)             
    444        18807  S#5_1-hour_Experimenter.mov                        84689     318443  c(11134, 329577)        
    444        18807  S#5_1-Hour.mov                                     84691    2817451  c(11134, 2828585)       
    444        18807  S#5_HomeMap.mov                                    84693    1172310  c(2829585, 4001895)     
    444        18807  S#5_HomeMap_Experimenter.mov                       84695     458091  c(4002895, 4460986)     
    444        18807  S#5_Solitary.mov                                   84699     280918  c(4461986, 4742904)     
    444        18807  S#5_Questionnaires.mov                             84703    3507627  c(4461986, 7969613)     
    444        18807  S#5_Solitary_Experimenter.mov                      84701     125760  c(4743799, 4869559)     
    444        18807  S#5_Body Dimensions.mov                            86042       8150  c(7970613, 7978763)     
    444        18808  S#6_Phone Questionnaire (Video).mov                85481     487330  c(-19806000, -19318670) 
    444        18808  S#6_ Home Map Instructions.mov                     85121      29072  c(0, 29072)             
    444        18808  S#6_ Questionnaires_NEW.mp4                        85167    3462059  c(30072, 3492131)       
    444        18808  S#6_1-Hour Instructions.mov                        85193      29272  c(3493131, 3522403)     
    444        18808  S#6_1-Hour Play.mov                                85195    3910528  c(3523403, 7433931)     
    444        18808  S#6_Home Map.mp4                                   85199     788779  c(7434931, 8223710)     
    444        18808  S#6_1-Hour Play_old                                85477    3910483  c(8224710, 12135193)    
    444        18808  S#6_Scheduling                                     85479     380822  c(12136150, 12516972)   
    444        18808  S#6_Solitary Play.mov                              85483     301378  c(12517863, 12819241)   
    444        18808  S#6_BodyDimensions.mov                             86044       2624  c(12820241, 12822865)   
    444        18810  S#7_1-Hour Play.mov                                85241    3608726  c(59212000, 62820726)   
    444        18810  S#7_Solitary Play.mov                              85251     295936  c(59957000, 60252936)   
    444        18810  S#7_Home Map.mov                                   85243     982102  c(60087000, 61069102)   
    444        18810  S#7_Phone Questionnaire (Video).mov                85247     415849  c(60894000, 61309849)   
    444        18810  S#7_1-Hour Instructions.mov                        85207      14749  c(61855000, 61869749)   
    444        18810  S#7_1-Hour_Experimenter Video.mov                  85239     637760  c(62025000, 62662760)   
    444        18810  S#7_Solitary Play Instructions.mov                 85249      17280  c(62205000, 62222280)   
    444        18810  S#7_Solitary Play- Experimenter.mov                85253      54678  c(62341000, 62395678)   
    444        18810  S#7_ Questionnaires.mov                            85213    2583702  c(62482000, 65065702)   
    444        18810  S#7_Home Map-Experimenter Video.mov                85245    1021454  c(63130000, 64151454)   
    444        18811  S#8_1-Hour.mov                                     85451    3639275  c(0, 3639275)           
    444        18811  S#8_1-Hour (experimenter)                          85453    3738859  c(3640275, 7379134)     
    444        18811  S#8_House Map.mov                                  85455     559190  c(7380043, 7939233)     
    444        18811  S#8_1-Hour (experimenter).mp4                      85459    3771755  c(7380043, 11151798)    
    444        18811  S#8_Phone Questionnaire.mov                        85457     690624  c(7940233, 8630857)     
    444        18811  S#8_Solitary.mov                                   85461     287424  c(11152798, 11440222)   
    444        18811  S#8_Questionnaires.mp4                             85465    2174464  c(11152798, 13327262)   
    444        18811  S#8_Solitary (experimenter).mov                    85463     425046  c(11441222, 11866268)   
    444        18811  S#6_BodyDimensions.mov                             86048       2624  c(13328262, 13330886)   
    444        18813  S#09_House Map.mov                                 85467     594027  c(0, 594027)            
    444        18813  S#09_1-Hour.mov                                    85471    3612736  c(0, 3612736)           
    444        18813  S#09_Phone Questionnaire.mov                       85469     463595  c(595027, 1058622)      
    444        18813  S#09_Solitary.mov                                  85473     344470  c(3613736, 3958206)     
    444        18813  S#09_Questionnaires.mov                            85475    1601033  c(3613736, 5214769)     
    444        18814  S#10_Solitary (Experimenter).MOV                   85641     396063  c(64730000, 65126063)   
    444        18814  S#10_House Map (Experimenter).MOV                  85633     624153  c(67566000, 68190153)   
    444        18814  S#10_1-Hour (Experimenter).mov                     85631    3822702  c(87711000, 91533702)   
    444        18814  S#10_Solitary.mov                                  85637     301931  c(90173000, 90474931)   
    444        18814  S#10_Questionnaires.mov                            85639    1921558  c(90309000, 92230558)   
    444        18814  S#10_House Map.mov                                 85627     621248  c(90640000, 91261248)   
    444        18814  S#10_1-hour.mov                                    85617    3780907  c(91421000, 95201907)   
    444        18815  S#11_Phone Questionnaire.mov                       85653     474112  c(4478000, 4952112)     
    444        18815  S#11_1-Hour (experimenter).mov                     85649    3757376  c(77018000, 80775376)   
    444        18815  S#11_Solitary (experimenter).mov                   85661     499627  c(77092000, 77591627)   
    444        18815  S#11_Questionnaires.mov                            85655    1819947  c(77149000, 78968947)   
    444        18815  S#11_House Map (experimenter).mov                  85651     519659  c(77201000, 77720659)   
    444        18815  S#11_1-Hour.mov                                    85643    3721344  c(78479000, 82200344)   
    444        18815  S#11_Solitary.mov                                  85657     399019  c(78496000, 78895019)   
    444        18815  S#11_House Map.mov                                 85647     507648  c(78521000, 79028648)   
    444        18817  S#12_1-Hour.mov                                    85669    3492630  c(0, 3492630)           
    444        18817  S#12_HomeMap_Experimenter.mov                      85673     654294  c(3493630, 4147924)     
    444        18817  S#12_1-hour_Experimenter.mov                       85675    3531158  c(3493630, 7024788)     
    444        18817  S#12_Mother-Child Play.mov                         85679     189824  c(7025788, 7215612)     
    444        18817  S#12_House Map.mov                                 85677     588224  c(7025788, 7614012)     
    444        18817  S#12_Phone Questionnaire.mov                       85683     385024  c(7615012, 8000036)     
    444        18817  S#12_Solitary Play.mov                             85689     124246  c(8001036, 8125282)     
    444        18817  S#12_Questionnaires.mov                            85695    3325462  c(8001036, 11326498)    
    444        18817  S#12_Solitary&DyadPlay_Experimenter.mov            85691     487126  c(8126282, 8613408)     
    444        18818  S#13_Phone Questionnaire.mov                       85721     381504  c(-2616000, -2234496)   
    444        18818  S#13_Solitary Play.mov                             85723     129771  c(101800000, 101929771) 
    444        18818  S#13_Dyadic Play.mov                               85711     199830  c(101846000, 102045830) 
    444        18818  S#13_Questionnaires.mov                            85725    2181113  c(102110000, 104291113) 
    444        18818  S#13_House Map.mov                                 85715     541163  c(102237000, 102778163) 
    444        18818  S#13_1-Hour.mov                                    85705    4222358  c(104244000, 108466358) 
    444        18818  S#13_House Map (Experimenter).mov                  85719     544683  c(107682000, 108226683) 
    444        18818  S#13_Solitary&Dyadic Play (Experimenter).mov       85727     504640  c(107776000, 108280640) 
    444        18818  S#13_1-Hour (Experimenter).mov                     85717    4260395  c(108884000, 113144395) 
    444        18819  S#14_1-Hour.mov                                    85730    3977110  c(0, 3977110)           
    444        18819  S#14_Dyadic Play.mov                               85746     211840  c(3978110, 4189950)     
    444        18819  S#14_1-Hour (Experimenter).mp4                     85750    4116246  c(3978110, 8094356)     
    444        18819  S#14_House Map.mov                                 85748     648278  c(4190950, 4839228)     
    444        18819  S#14_House Map (Experimenter).mp4                  85752     663787  c(8095255, 8759042)     
    444        18819  S#14_Phone Questionnaire.mov                       85754     510444  c(16918000, 17428444)   
    444        18819  S#14_Solitary & Dyadic (Experimenter).mp4          85756     331968  c(17429444, 17761412)   
    444        18819  S#14_Questionnaires.mp4                            85760    3740075  c(17429444, 21169519)   
    444        18819  S#14_Solitary Play.mp4                             85758     128022  c(17762308, 17890330)   
    444        18821  S#15_1-Hour (Experimenter).mov                     85770    3677846  c(0, 3677846)           
    444        18821  S#15_House Map (Experimenter).mov                  85774     425558  c(3678846, 4104404)     
    444        18821  S#15_1-Hour.mp4                                    85778    3605227  c(3678846, 7284073)     
    444        18821  S#15_House Map.mp4                                 85776     416043  c(4105404, 4521447)     
    444        18821  S#15_Phone Questionnaire.mov                       85780     466603  c(7285073, 7751676)     
    444        18821  S#15_Shoes                                         85782       4096  c(7752676, 7756772)     
    444        18821  S#15_Questionnaires.mp4                            85788    3169707  c(7752676, 10922383)    
    444        18821  S#15_Shoe Video.mov                                85784      16640  c(7757680, 7774320)     
    444        18821  S#15_Solitary&DyadicPlay (Experimenter).mp4        85786     472000  c(7775320, 8247320)     
    444        18821  S#15_Solitary&DyadicPlay.mp4                       85790     392534  c(8248320, 8640854)     
    444        18822  S#16_1-Hour.mov                                    85792    3612736  c(0, 3612736)           
    444        18822  S#16_Dyadic Play.mov                               85794     195328  c(3613736, 3809064)     
    444        18822  S#16_1-Hour (Experimenter).mov                     85798    3670806  c(3613736, 7284542)     
    444        18822  S#16_Dyadic Play (Experimenter).mov                85796     219350  c(3810064, 4029414)     
    444        18822  S#16_House Map.mov                                 85800     602240  c(4030414, 4632654)     
    444        18822  S#16_House Map (Experimenter).mov                  85802     615744  c(7285542, 7901286)     
    444        18822  S#16_Solitary Play.mov                             85804     124758  c(7902286, 8027044)     
    444        18822  S#16_Questionnaires.mp4                            85808    1762198  c(7902286, 9664484)     
    444        18822  S#16_Solitary Play (Experimenter).mov              85806     164288  c(8028044, 8192332)     
    444        18823  S#17_1-Hour.mov                                    85812    3606742  c(0, 3606742)           
    444        18823  S#17_Dyadic Play.mov                               85814     204331  c(3607742, 3812073)     
    444        18823  S#17_1-Hour (Experimenter)                         85816    3672768  c(3607742, 7280510)     
    444        18823  S#17_House Map (Experimenter).mov                  85818    1172800  c(7281411, 8454211)     
    444        18823  S#17_House Map_1.mov                               85820     782422  c(8455211, 9237633)     
    444        18823  S#17_House Map_2.mov                               85822     356480  c(9238633, 9595113)     
    444        18823  S#17_Solitary Play.mov                             85824     136768  c(9596113, 9732881)     
    444        18823  S#17_Questionnaires.mov                            85826    2222358  c(9596113, 11818471)    
    444        18823  S#17_Solitary&DyadicPlay (Experimenter).mov        85828     496619  c(9733881, 10230500)    
    444        18824  S#18_1-Hour.mov                                    85830    3879360  c(0, 3879360)           
    444        18824  S#18_Dyadic Play.mov                               85832     196822  c(3880360, 4077182)     
    444        18824  S#18_1-Hour (Experimenter).mp4                     85837    4129750  c(3880360, 8010110)     
    444        18824  S#18_House Map.mov                                 85834     603243  c(4078182, 4681425)     
    444        18824  S#18_House Map (Experimenter).mov                  85839     610240  c(4682425, 5292665)     
    444        18824  S#18_Phone Questionnaire.mov                       85841     409046  c(8011110, 8420156)     
    444        18824  S#18_Solitary Play.mov                             85843     137259  c(8421156, 8558415)     
    444        18824  S#18_Questionnaires.mov                            85845    1538539  c(8421156, 9959695)     
    444        18824  S#18_Solitary&Dyadic Play (Experimenter).mov       85847     476096  c(9960695, 10436791)    
    444        18825  S#19_House Map.mov                                 85853     523136  c(69908000, 70431136)   
    444        18825  S#19_Dyadic Play.mov                               85851     208267  c(70027000, 70235267)   
    444        18825  S#19_Solitary Play.mov                             85863     129259  c(70041000, 70170259)   
    444        18825  S#19_1-Hour.mov                                    85849    3668800  c(78777000, 82445800)   
    444        18825  S#19_Questionnaires.mp4                            85867    3012864  c(82179000, 85191864)   
    444        18825  S#19_Solitary&Dyadic Play (Experimenter).mov       85865     461590  c(85767000, 86228590)   
    444        18825  S#19_1-Hour (Experimenter).mov                     85855    3715840  c(86009000, 89724840)   
    444        18825  S#19_House Map (Experimenter).mov                  85857     506646  c(86069000, 86575646)   
    444        18825  S#19_Phone Questionnaire.mov                       85861     432064  c(89725840, 90157904)   
    444        18826  S#20_House Map.mov                                 85885     769408  c(63820000, 64589408)   
    444        18826  S#20_Questionnaires.mov                            85895    2541163  c(64026000, 66567163)   
    444        18826  S#20_1-Hour.mov                                    85875    3788907  c(64129000, 67917907)   
    444        18826  S#20_Solitary Play.mov                             85893     136278  c(64151000, 64287278)   
    444        18826  S#20_Dyadic Play.mov                               85881     194816  c(64171000, 64365816)   
    444        18826  S#20_1-Hour (Experimenter).mov                     85883    3830955  c(64517000, 68347955)   
    444        18826  S#20_House Map (Experimenter).mov                  85887     595222  c(64538000, 65133222)   
    444        18826  S#20_Solitary&Dyadic Play (Experimenter).mov       85897     488128  c(64582000, 65070128)   
    444        18826  S#20_Phone Questionnaire.mov                       85891     440064  c(68348955, 68789019)   
    444        27087  video-as-data                                     119877     372193  c(0, 372193)            
    444        35609  PlayPilotS#021_1-Hour                             167792    3653782  c(0, 3653782)           
    444        35609  PlayPilotS#021 House Map                          167794     646272  c(3654683, 4300955)     
    444        35609  PlayPilotS#021 Dyadic Play                        167796     307947  c(4301861, 4609808)     
    444        35609  PlayPilotS#021 Questionnaires                     167798    3549184  c(4610701, 8159885)     

## All uploaded files


```r
all_files <- databraryapi::list_assets_in_volume(as.numeric(params$vol_id))

all_files_filtered <- all_files %>%
  dplyr::select(vol_id, session_id, name, asset_id, asset_type) %>%
  dplyr::arrange(session_id, asset_type, name)

all_files_filtered %>%
  knitr::kable(.)
```



 vol_id   session_id  name                                            asset_id  asset_type                
-------  -----------  ---------------------------------------------  ---------  --------------------------
    444        18801  S#1_1-hour.mov                                     84604  MPEG-4 video              
    444        18803  1_2Bath                                            86026  MPEG-4 video              
    444        18803  Bathroom1                                          86020  MPEG-4 video              
    444        18803  DownstairsHall                                     86022  MPEG-4 video              
    444        18803  FamilyRoom                                         86024  MPEG-4 video              
    444        18803  NannyBed                                           86030  MPEG-4 video              
    444        18803  ParentBath                                         86028  MPEG-4 video              
    444        18803  ParentBed                                          86032  MPEG-4 video              
    444        18803  ParentBedHall                                      86038  MPEG-4 video              
    444        18803  S#2_1-Hour.mov                                     84640  MPEG-4 video              
    444        18803  S#2_HouseMap.mov                                   84638  MPEG-4 video              
    444        18803  S#2_HouseMapNEW_Unedited                           84644  MPEG-4 video              
    444        18803  S#2_HouseMapNEW.mov                                84642  MPEG-4 video              
    444        18803  S#2_Questionnaires.mov                             84656  MPEG-4 video              
    444        18803  S#2_QuestionnairesNEW.mov                          84658  MPEG-4 video              
    444        18803  Sibling Bed                                        86036  MPEG-4 video              
    444        18803  TargetCBed                                         86034  MPEG-4 video              
    444        18803  UpstairsHall                                       86040  MPEG-4 video              
    444        18805  Measure1                                           86004  MPEG-4 video              
    444        18805  Measure2                                           86002  MPEG-4 video              
    444        18805  Measure3                                           86014  MPEG-4 video              
    444        18805  Measure4                                           86006  MPEG-4 video              
    444        18805  Measure5                                           86008  MPEG-4 video              
    444        18805  Measure6                                           86010  MPEG-4 video              
    444        18805  Measure7                                           86013  MPEG-4 video              
    444        18805  Measure8                                           86018  MPEG-4 video              
    444        18805  Measure9                                           86016  MPEG-4 video              
    444        18805  S#3_1-Hour play.mov                                84668  MPEG-4 video              
    444        18805  S#3_Books&Toys                                     84662  MPEG-4 video              
    444        18805  S#3_HouseMap.mov                                   84664  MPEG-4 video              
    444        18805  S#3_ObjPlayTasks.mov                               84666  MPEG-4 video              
    444        18806  S#4_1-Hour play.mov                                84672  MPEG-4 video              
    444        18806  S#4_1-Hour_Intro&Experimenter.mov                  84670  MPEG-4 video              
    444        18806  S#4_HouseMap.mov                                   84674  MPEG-4 video              
    444        18806  S#4_PhoneQuestionnaire.mov                         84676  MPEG-4 video              
    444        18806  S#4_Questionnaires.mov                             84680  MPEG-4 video              
    444        18806  S#4_Solitary Play_Experimenter.mov                 84684  MPEG-4 video              
    444        18806  S#4_Solitary Play_Intro.mov                        84682  MPEG-4 video              
    444        18806  S#4_Solitary Play.mov                              84678  MPEG-4 video              
    444        18806  S#4_DecibelData                                   106655  Comma-separated values    
    444        18807  homemap-last piece                                 84687  MPEG-4 video              
    444        18807  S#5_1-hour_Experimenter.mov                        84689  MPEG-4 video              
    444        18807  S#5_1-Hour.mov                                     84691  MPEG-4 video              
    444        18807  S#5_Body Dimensions.mov                            86042  MPEG-4 video              
    444        18807  S#5_HomeMap_Experimenter.mov                       84695  MPEG-4 video              
    444        18807  S#5_HomeMap.mov                                    84693  MPEG-4 video              
    444        18807  S#5_Phone Questionnaire.mov                        84697  MPEG-4 video              
    444        18807  S#5_Questionnaires.mov                             84703  MPEG-4 video              
    444        18807  S#5_Solitary_Experimenter.mov                      84701  MPEG-4 video              
    444        18807  S#5_Solitary.mov                                   84699  MPEG-4 video              
    444        18807  S#5_DecibelData                                   106656  Comma-separated values    
    444        18808  S#6_ Home Map Instructions.mov                     85121  MPEG-4 video              
    444        18808  S#6_ Questionnaires_NEW.mp4                        85167  MPEG-4 video              
    444        18808  S#6_1-Hour Instructions.mov                        85193  MPEG-4 video              
    444        18808  S#6_1-Hour Play_old                                85477  MPEG-4 video              
    444        18808  S#6_1-Hour Play.mov                                85195  MPEG-4 video              
    444        18808  S#6_BodyDimensions.mov                             86044  MPEG-4 video              
    444        18808  S#6_Home Map.mp4                                   85199  MPEG-4 video              
    444        18808  S#6_Phone Questionnaire (Video).mov                85481  MPEG-4 video              
    444        18808  S#6_Scheduling                                     85479  MPEG-4 video              
    444        18808  S#6_Solitary Play.mov                              85483  MPEG-4 video              
    444        18808  S#6_DecibelData                                    86046  Comma-separated values    
    444        18810  S#7_ Questionnaires.mov                            85213  MPEG-4 video              
    444        18810  S#7_1-Hour Instructions.mov                        85207  MPEG-4 video              
    444        18810  S#7_1-Hour Play.mov                                85241  MPEG-4 video              
    444        18810  S#7_1-Hour_Experimenter Video.mov                  85239  MPEG-4 video              
    444        18810  S#7_Home Map-Experimenter Video.mov                85245  MPEG-4 video              
    444        18810  S#7_Home Map.mov                                   85243  MPEG-4 video              
    444        18810  S#7_Phone Questionnaire (Video).mov                85247  MPEG-4 video              
    444        18810  S#7_Solitary Play Instructions.mov                 85249  MPEG-4 video              
    444        18810  S#7_Solitary Play- Experimenter.mov                85253  MPEG-4 video              
    444        18810  S#7_Solitary Play.mov                              85251  MPEG-4 video              
    444        18810  S#7_DecibelData                                    86045  Comma-separated values    
    444        18811  S#6_BodyDimensions.mov                             86048  MPEG-4 video              
    444        18811  S#8_1-Hour (experimenter)                          85453  MPEG-4 video              
    444        18811  S#8_1-Hour (experimenter).mp4                      85459  MPEG-4 video              
    444        18811  S#8_1-Hour.mov                                     85451  MPEG-4 video              
    444        18811  S#8_House Map.mov                                  85455  MPEG-4 video              
    444        18811  S#8_Phone Questionnaire.mov                        85457  MPEG-4 video              
    444        18811  S#8_Questionnaires.mp4                             85465  MPEG-4 video              
    444        18811  S#8_Solitary (experimenter).mov                    85463  MPEG-4 video              
    444        18811  S#8_Solitary.mov                                   85461  MPEG-4 video              
    444        18811  S#8_DecibelData                                    86052  Comma-separated values    
    444        18813  S#09_1-Hour.mov                                    85471  MPEG-4 video              
    444        18813  S#09_House Map.mov                                 85467  MPEG-4 video              
    444        18813  S#09_Phone Questionnaire.mov                       85469  MPEG-4 video              
    444        18813  S#09_Questionnaires.mov                            85475  MPEG-4 video              
    444        18813  S#09_Solitary.mov                                  85473  MPEG-4 video              
    444        18813  S#9_DecibelData                                    86053  Comma-separated values    
    444        18814  S#10_1-Hour (Experimenter).mov                     85631  MPEG-4 video              
    444        18814  S#10_1-hour.mov                                    85617  MPEG-4 video              
    444        18814  S#10_House Map (Experimenter).MOV                  85633  MPEG-4 video              
    444        18814  S#10_House Map.mov                                 85627  MPEG-4 video              
    444        18814  S#10_Questionnaires.mov                            85639  MPEG-4 video              
    444        18814  S#10_Solitary (Experimenter).MOV                   85641  MPEG-4 video              
    444        18814  S#10_Solitary.mov                                  85637  MPEG-4 video              
    444        18814  S#10_DecibelData                                   86054  Comma-separated values    
    444        18815  S#11_1-Hour (experimenter).mov                     85649  MPEG-4 video              
    444        18815  S#11_1-Hour.mov                                    85643  MPEG-4 video              
    444        18815  S#11_House Map (experimenter).mov                  85651  MPEG-4 video              
    444        18815  S#11_House Map.mov                                 85647  MPEG-4 video              
    444        18815  S#11_Phone Questionnaire.mov                       85653  MPEG-4 video              
    444        18815  S#11_Questionnaires.mov                            85655  MPEG-4 video              
    444        18815  S#11_Solitary (experimenter).mov                   85661  MPEG-4 video              
    444        18815  S#11_Solitary.mov                                  85657  MPEG-4 video              
    444        18815  S#11_DecibelData                                   86055  Comma-separated values    
    444        18817  S#12_1-hour_Experimenter.mov                       85675  MPEG-4 video              
    444        18817  S#12_1-Hour.mov                                    85669  MPEG-4 video              
    444        18817  S#12_HomeMap_Experimenter.mov                      85673  MPEG-4 video              
    444        18817  S#12_House Map.mov                                 85677  MPEG-4 video              
    444        18817  S#12_Mother-Child Play.mov                         85679  MPEG-4 video              
    444        18817  S#12_Phone Questionnaire.mov                       85683  MPEG-4 video              
    444        18817  S#12_Questionnaires.mov                            85695  MPEG-4 video              
    444        18817  S#12_Solitary Play.mov                             85689  MPEG-4 video              
    444        18817  S#12_Solitary&DyadPlay_Experimenter.mov            85691  MPEG-4 video              
    444        18817  DecibelData                                        86056  Comma-separated values    
    444        18817  NYU-012-survey-demog                               88115  Comma-separated values    
    444        18818  S#13_1-Hour (Experimenter).mov                     85717  MPEG-4 video              
    444        18818  S#13_1-Hour.mov                                    85705  MPEG-4 video              
    444        18818  S#13_Dyadic Play.mov                               85711  MPEG-4 video              
    444        18818  S#13_House Map (Experimenter).mov                  85719  MPEG-4 video              
    444        18818  S#13_House Map.mov                                 85715  MPEG-4 video              
    444        18818  S#13_Phone Questionnaire.mov                       85721  MPEG-4 video              
    444        18818  S#13_Questionnaires.mov                            85725  MPEG-4 video              
    444        18818  S#13_Solitary Play.mov                             85723  MPEG-4 video              
    444        18818  S#13_Solitary&Dyadic Play (Experimenter).mov       85727  MPEG-4 video              
    444        18818  NYU-013-survey-demog                               88116  Comma-separated values    
    444        18818  S#13_Decibel Data                                  86057  Comma-separated values    
    444        18819  S#14_1-Hour (Experimenter).mp4                     85750  MPEG-4 video              
    444        18819  S#14_1-Hour.mov                                    85730  MPEG-4 video              
    444        18819  S#14_Dyadic Play.mov                               85746  MPEG-4 video              
    444        18819  S#14_House Map (Experimenter).mp4                  85752  MPEG-4 video              
    444        18819  S#14_House Map.mov                                 85748  MPEG-4 video              
    444        18819  S#14_Phone Questionnaire.mov                       85754  MPEG-4 video              
    444        18819  S#14_Questionnaires.mp4                            85760  MPEG-4 video              
    444        18819  S#14_Solitary & Dyadic (Experimenter).mp4          85756  MPEG-4 video              
    444        18819  S#14_Solitary Play.mp4                             85758  MPEG-4 video              
    444        18819  NYU-014-survey-demo                                88117  Comma-separated values    
    444        18819  S#14_Decibel Data                                  86058  Comma-separated values    
    444        18821  S#15_1-Hour (Experimenter).mov                     85770  MPEG-4 video              
    444        18821  S#15_1-Hour.mp4                                    85778  MPEG-4 video              
    444        18821  S#15_House Map (Experimenter).mov                  85774  MPEG-4 video              
    444        18821  S#15_House Map.mp4                                 85776  MPEG-4 video              
    444        18821  S#15_Phone Questionnaire.mov                       85780  MPEG-4 video              
    444        18821  S#15_Questionnaires.mp4                            85788  MPEG-4 video              
    444        18821  S#15_Shoe Video.mov                                85784  MPEG-4 video              
    444        18821  S#15_Shoes                                         85782  MPEG-4 video              
    444        18821  S#15_Solitary&DyadicPlay (Experimenter).mp4        85786  MPEG-4 video              
    444        18821  S#15_Solitary&DyadicPlay.mp4                       85790  MPEG-4 video              
    444        18821  NYU-015-survey-demo                                88118  Comma-separated values    
    444        18821  S#15_DecibelData                                   86059  Comma-separated values    
    444        18822  S#16_1-Hour (Experimenter).mov                     85798  MPEG-4 video              
    444        18822  S#16_1-Hour.mov                                    85792  MPEG-4 video              
    444        18822  S#16_Dyadic Play (Experimenter).mov                85796  MPEG-4 video              
    444        18822  S#16_Dyadic Play.mov                               85794  MPEG-4 video              
    444        18822  S#16_House Map (Experimenter).mov                  85802  MPEG-4 video              
    444        18822  S#16_House Map.mov                                 85800  MPEG-4 video              
    444        18822  S#16_Questionnaires.mp4                            85808  MPEG-4 video              
    444        18822  S#16_Solitary Play (Experimenter).mov              85806  MPEG-4 video              
    444        18822  S#16_Solitary Play.mov                             85804  MPEG-4 video              
    444        18822  S#16_DecibelData                                   86060  Comma-separated values    
    444        18823  S#17_1-Hour (Experimenter)                         85816  MPEG-4 video              
    444        18823  S#17_1-Hour.mov                                    85812  MPEG-4 video              
    444        18823  S#17_Dyadic Play.mov                               85814  MPEG-4 video              
    444        18823  S#17_House Map (Experimenter).mov                  85818  MPEG-4 video              
    444        18823  S#17_House Map_1.mov                               85820  MPEG-4 video              
    444        18823  S#17_House Map_2.mov                               85822  MPEG-4 video              
    444        18823  S#17_Questionnaires.mov                            85826  MPEG-4 video              
    444        18823  S#17_Solitary Play.mov                             85824  MPEG-4 video              
    444        18823  S#17_Solitary&DyadicPlay (Experimenter).mov        85828  MPEG-4 video              
    444        18823  NYU-017-survey-demog                               88119  Comma-separated values    
    444        18823  S#17_DecibelData                                   86061  Comma-separated values    
    444        18824  S#18_1-Hour (Experimenter).mp4                     85837  MPEG-4 video              
    444        18824  S#18_1-Hour.mov                                    85830  MPEG-4 video              
    444        18824  S#18_Dyadic Play.mov                               85832  MPEG-4 video              
    444        18824  S#18_House Map (Experimenter).mov                  85839  MPEG-4 video              
    444        18824  S#18_House Map.mov                                 85834  MPEG-4 video              
    444        18824  S#18_Phone Questionnaire.mov                       85841  MPEG-4 video              
    444        18824  S#18_Questionnaires.mov                            85845  MPEG-4 video              
    444        18824  S#18_Solitary Play.mov                             85843  MPEG-4 video              
    444        18824  S#18_Solitary&Dyadic Play (Experimenter).mov       85847  MPEG-4 video              
    444        18824  NYU-018-survey-demog                              108088  Comma-separated values    
    444        18824  S#18_DecibelData                                   86062  Comma-separated values    
    444        18825  S#19_1-Hour (Experimenter).mov                     85855  MPEG-4 video              
    444        18825  S#19_1-Hour.mov                                    85849  MPEG-4 video              
    444        18825  S#19_Dyadic Play.mov                               85851  MPEG-4 video              
    444        18825  S#19_House Map (Experimenter).mov                  85857  MPEG-4 video              
    444        18825  S#19_House Map.mov                                 85853  MPEG-4 video              
    444        18825  S#19_Phone Questionnaire.mov                       85861  MPEG-4 video              
    444        18825  S#19_Questionnaires.mp4                            85867  MPEG-4 video              
    444        18825  S#19_Solitary Play.mov                             85863  MPEG-4 video              
    444        18825  S#19_Solitary&Dyadic Play (Experimenter).mov       85865  MPEG-4 video              
    444        18825  NYU-019-survey-demog                               88121  Comma-separated values    
    444        18825  S#19_DecibelData                                   86063  Comma-separated values    
    444        18826  S#20_1-Hour (Experimenter).mov                     85883  MPEG-4 video              
    444        18826  S#20_1-Hour.mov                                    85875  MPEG-4 video              
    444        18826  S#20_Dyadic Play.mov                               85881  MPEG-4 video              
    444        18826  S#20_House Map (Experimenter).mov                  85887  MPEG-4 video              
    444        18826  S#20_House Map.mov                                 85885  MPEG-4 video              
    444        18826  S#20_Phone Questionnaire.mov                       85891  MPEG-4 video              
    444        18826  S#20_Questionnaires.mov                            85895  MPEG-4 video              
    444        18826  S#20_Solitary Play.mov                             85893  MPEG-4 video              
    444        18826  S#20_Solitary&Dyadic Play (Experimenter).mov       85897  MPEG-4 video              
    444        18826  NYU-020-survey-demog                               88122  Comma-separated values    
    444        18826  S#20_DecibelData                                   86064  Comma-separated values    
    444        26295  child-birth                                       116791  Comma-separated values    
    444        26295  childcare                                         159177  Comma-separated values    
    444        26295  family                                            116790  Comma-separated values    
    444        26295  language-exposure                                 116787  Comma-separated values    
    444        26295  locomotion                                        117092  Comma-separated values    
    444        26295  sleep                                             116789  Comma-separated values    
    444        27087  video-as-data                                     119877  MPEG-4 video              
    444        29558  PLAY logo                                         134427  Portable network graphics 
    444        35609  PlayPilotS#021 Dyadic Play                        167796  MPEG-4 video              
    444        35609  PlayPilotS#021 House Map                          167794  MPEG-4 video              
    444        35609  PlayPilotS#021 Questionnaires                     167798  MPEG-4 video              
    444        35609  PlayPilotS#021_1-Hour                             167792  MPEG-4 video              
