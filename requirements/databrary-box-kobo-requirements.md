---
title: "PLAY workflow requirements & specs"
author: "Rick Gilmore"
date: "2019-10-08 09:08:11"
output: 
  html_document:
    keep_md: true
    theme: lumen
    toc: true
    toc_depth: 4
    toc_float: true
    code_folding: hide
    
---

## Background

This document provides information about the requirements and specifications for parts of the PLAY workflow that involve integration among Databrary, KoBoToolbox, and Box.

## User stories

### Data collection site status reports

1. As a *PLAY staff member*, I want to be able to generate *data collection site status reports* that summarize progress in data recruiting, participant demographics, and file uploads to Databrary.

2. As a *PLAY staff member*, I want the *data collection site status reports* to be available on the web so that other *PLAY staff members* or *PLAY PIs* can review them. I may also want the reports to be available to *data collection site staff*.

### Gather and process survey data from KoBoToolbox

1. As a *PLAY staff member*, I want to be able to download completed surveys from completed data collection sessions from the KoBoToolbox server. 

2. As a *PLAY staff member*, I want to separate the survey files into distinct CSV files by survey and participant, and I want to upload the CSV files to participant's Databrary volume and session.

3. As a *PLAY staff member*, I want to compare the data from KoBoToolbox with that hand-entered by *data collection site staff* and flag inconsistencies for correction.

4. As a *PLAY staff member*, I want to generate aggregate CSV data files combining survey data across participants in a site with other relevant subject-specific metadata. The aggregate (grouped across participants) survey-specific data files should be uploaded to the data collection site's Databrary volume in a separate materials session/folder.

5. As a *PLAY staff member*, I want to generate machine and human readable *survey code book (variable) summaries*.

### Gather and process video and audio data from Databrary

1. As a *PLAY staff member*, I want to be able to create a specific set of directories to manage the QA, coding assignment, coding reliability, and final curation back to Databrary of PLAY project video, audio, and survey data files.

2. As a *PLAY staff member*, I want to be able to transfer uploaded videos and audio files from data collection site volumes and sessions to associated video and audio QA folders on Box.

3. As a *PLAY staff member*, I want to be able to query the QA, coding assignment, coding reliability, and final curation directories on Box to determine statistics about which videos need to be assigned to QA review, which have passed QA review, which have been assigned to what coding passes, which have been assigned to what coding reliability passes, and so forth.
