---
title: "PLAY workflow planning"
author: "Rick Gilmore"
date: "2019-09-26 14:22:24"
output: 
  html_document:
    keep_md: true
    theme: lumen
    toc: true
    toc_depth: 4
    toc_float: true
    code_folding: hide
---



# Purpose

To describe in detailed terms the steps involved in the PLAY workflow, especially focusing on file management.

The original source of these ideas was this Google doc:

<https://docs.google.com/document/d/1t0vwlsN0rUdcNVjEx5VzEYa9KkLIdkxYh6cMrg3G-fU/edit>

The Google doc contains text from an unfunded NSF RIDIR proposal submitted in 2018 plus additional components added later.
At that time, we called the system we planned to use for PLAY a scientific process management (SPM) system with the working name `LabNanny`.

# Background

## NSF RIDIR 2018

These features are required for the PLAY project. 
They are described in narrative form in the (not funded) RIDIR 2018 NSF proposal. 
The narrative descriptions are provided below.

### Aim 1

**Improve the reproducibility, transparency, and scalability of video-based research via LabNanny, a web-based scientific process management (SPM) system.**

Video-based behavioral research involves a sequence of steps: multi-step workflows to collect and process multiple file types; iterative, looping steps to review, code, and conduct quality assurance on the data; tracking task assignments among various researchers/staff; and monitoring progress on project-wide recruitment, testing, coding, and analyses (Fig. 2). 
Single lab projects and large consortia face similar problems and implement similar workflows. 
But the unprecedented scale of PLAY and the commitment to openly share all data magnifies the challenges. 
Most video-based researchers depend on paper-and-pencil checklists or spreadsheets to manage files, people, processes, and tasks. In extensive piloting for PLAY, we determined that no free or open-source scientific process management (SPM) tool meets the needs of video-based research.

So we will develop “LabNanny,” a new web-based SPM. 
LabNanny will be thoroughly vetted by the 65-member PLAY Launch Group as it manages training across geographically dispersed sites, the flow of video and other data files collected across 30 sites, assignment and outcome of QA reviews, training and assignment of coding passes to 48 labs and outcome of reliability checks on coded files, cross-checking of participant metadata, and finally monitoring recruitment, coding, and data-sharing goals. 
In planning PLAY, PIs Gilmore and Adolph piloted and refined the basic workflow using ad hoc tools, thereby specifying the requirements for LabNanny. 
Moreover, although the number of participating labs in PLAY is many times larger than comparable projects, the sequence of operations required is identical to that used by single labs and smaller collaborative teams. 
Thus, in developing and deploying LabNanny, we will create, test, and refine infrastructure that will be immediately valuable to the entire community of video-using behavioral and social scientists when openly shared at the end of the grant period.

Preliminary work: 
The PIs interviewed colleagues and Project Advisory Board member Nilam Ram who have successfully conducted similar large-scale, geographically distributed research projects involving multiple data types, including video. 
We learned that most labs use a combination of checklists and spreadsheets, and sometimes a custom relational database with shared/cloud file storage. 
We evaluated whether existing project/process management tools (e.g., JIRA, Asana, Trello, ProcessStreet, ProcessMaker, ProcessMate, JBPM, Camunda, Flowable, Aquarium) might be adapted for our use. 
In so doing, we learned that none of the tools will work without substantial modification, most of the web-based tools lack the integration between tasks and files that we require, and the scale of PLAY pushes the project outside the bounds of what cloud services provide for free.

#### Project 1.1

**Workflow definition; task assignment and queuing**

We plan to fork an existing open source system—ProcessMaker is the leading candidate—and adapt and extend it to the needs of video-based research projects like PLAY. 
In forking, adapting, and extending an existing system, we must allow users to create multi-step workflows and assign tasks within workflows to people. 
We must also integrate the forked system into Databrary’s authentication/permission and user notification system. 
The result we will call LabNanny to highlight the central (and distinct) role that scientific process management and workflow management plays in robust and reproducible research. 
LabNanny will require interfaces that allow researchers to create workflows for training, data collection, QA, coding, inter-observer reliability, and data sharing (see Fig. 2). 
Should forking prove unworkable for some reason, our backup solution is to create our own SQL-style database using PostgreSQL, the core of Databrary’s current backend.

This will be available to 3 PIs…
This will be available ONLY to the databrary community ...
This will be a PLAY specific solution …
New York located PLAY staff will be using this… 
Consisting naming schemes / session IDs.
Queuing manager…
Part of volume creation … (adding people) … 
Volume Creation happens first … (Volume owner controls who has access)...
Project Volume : This virtual volume will be available to all …
Person logs on … Parent volume : child volume
Once volume / user information has been obtained… then PIs will give information on tagging… 
data collection / coding labs / consulting labs .. collaborators...

#### Project 1.2

**File management**

LabNanny must permit files to be attached to specific workflows. For example, once one of the 30 PLAY data collection labs has finished a testing session, that lab will have to upload the video, ambient sound, and questionnaire files to Databrary and assign the newly collected video for QA review by NYU-based PLAY staff (see Fig. 1A and Fig. 2). That assignment must trigger a notification to the PLAY project staff who must subsequently assign the video to a particular person for review. All files uploaded to Databrary get their own URIs (unique links) after they are transcoded into a common video format, and Databrary’s API checks file-level access permissions before showing a user a particular file. So, we will build the file management component of LabNanny alongside Databrary’s existing framework by attaching file-level URIs to specific workflow steps. This should eliminate the need to send files around like email attachments, a solution unworkable for multiple reasons (privacy, file sizes, etc.). Nevertheless, Databrary’s existing back-end is based on the constraint that a file uploaded to one dataset (project) and session (date + time + person) remains there. We will have to implement ways for the same files to progress through multiple, parallel workflows (e.g., multiple coding and review passes), while maintaining the integrity of Databrary’s project, session, and file permission structure. Our current plans involve extending Databrary’s “tagging” feature to include tags related to a given file’s status within the overall workflow (e.g., “Pending QA review”, "Transcription Completed", or “Ready to be Shared”). 

#### Project 1.3

**Progress monitoring dashboard and analytics**

For LabNanny to be an effective tool for video-centered research projects, PIs must be able to monitor progress in real time at every phase of the project, from participant recruitment, to data collection, to QA review, to coding, analysis, and ultimately data sharing. In testing LabNanny with PLAY, we will implement dashboards that will show real-time progress reports—in data collection across the 30 sites, in QA review across 900+ videos, in coding across 48+ sites, in achieving inter-observer reliability across 9000+ coding passes, and in transferring all videos, Datavyu coding spreadsheets, and related data files to the appropriate Databrary datasets for sharing. We will also implement dashboards for Launch Group PIs who collect data to monitor their own recruiting progress (including participant demographic targets), and for coding labs to monitor their lab’s progress in meeting coding goals. These monitoring and reporting tools will build on Databrary’s existing spreadsheet interfaces that capture participant characteristics (age, sex, race/ethnicity) and internal reporting functions that provide PIs with summary information about participants and sessions within a data volume.

##### Comments

participant recruitment, to data collection, to QA review, to coding, analysis, and ultimately data sharing


### Aim 2

**Accelerate data sharing by making self-curation of datasets more reliable, robust, and efficient**

To accelerate data sharing we will develop and deploy cloud-based project file sync services to enhance self-curation of video datasets. Currently, researchers must manually upload videos and associated data files to Databrary and must hand-enter participant and session-related metadata. This makes self-curation burdensome and error-prone—in the context of PLAY, 30 different labs will be collecting, uploading, and entering 30+ sessions each. Project 2 will make the ingestion and curation of research materials more reliable and efficient by creating a standard, machine-readable project structure and a local file syncing mechanism, thereby making data curation less burdensome and more reliable for all Databrary researchers.

#### Project 2.1

**Adapt BIDS to suit PLAY and video-centered research more broadly**

Preliminary work: We have consulted with Russell Poldrack, founder of the Stanford Center for Reproducible Neuroscience45,46 and Databrary Board member, and with Chris Gorgolewski, leader of the community-developed Brain Imaging Data Structure47. BIDS is an emerging standard for representing the task and analysis structure of brain imaging studies, including studies that involve measures of human behavior that have a dense temporal structure similar to video. Indeed, BIDS allows researchers to store participant, task, and measurement data in a format that is easily readable by many brain imaging data repositories. BIDS uses standard, open formats (tab-separated text files, JSON), and our consultations confirmed that the BIDS format can be readily adapted for use by Databrary. Moreover, increasing numbers of cognitive neuroscientists use video as display materials or as behavioral data streams, so cooperating on the creation of an open standard for video-centered behavioral research will pave the way for further integration among research communities and open science repositories (Project 5).

##### Comments

…. Already working on DV json format.. BIDS seems like an overkill but will still be looked at.

#### Project 2.2

**Develop a desktop extension of LabNanny for uploading video data and related metadata into Databrary**

Rather than require researchers to upload videos and enter metadata by hand, we will develop a desktop extension of LabNanny to manage file synchronization to and from Databrary. LabNanny will link specific desktop file directories or folders to a particular Databrary volume. This will keep responsibility for the control of local video files and related metadata with individual PIs to reflect the reality that security requirements may differ from institution to institution as may ethics board or IRB policies. LabNanny will verify that files stored in the target desktop directory are readable and formatted properly, then copy and enter those files into the Databrary system. Uploads can occur immediately or be scheduled for off hours when network bandwidth demands are lower. Most researchers collect participant metadata electronically using a desktop spreadsheet—PLAY will do so using a custom tablet app that will export participant metadata into a BIDS-compatible format. LabNanny will require researchers to map their individual metadata field names for a particular project to the standard Databrary schema. These stored mappings will allow LabNanny to create new data collection sessions on Databrary and populate them with videos and other data files. 

After we have file uploads working well, we will enable LabNanny to pull files from Databrary and save them locally. For example, when PLAY project staff assign a particular video to a specific lab for a particular coding pass (e.g., locomotion and physical activity), LabNanny (on Databrary) will generate a template Datavyu coding file with all the appropriate codes and links to code definitions (Project 4). The video and coding file template will be tagged for the assigned lab’s use, and LabNanny can then manage manual or automatic syncing to the assigned researcher’s designated local “download/coding” directory.

##### Comments

 … A prototype has been created that allows for browsing public assets and downloading them. We are also looking at this feature to replace/augment the ZIPPING on db since it is CPU intensive.

## User stories

### Workflow creation

As a volume owner, I want to create a workflow for a project. 
A workflow is a sequence of operations consisting of people, tasks or sub-tasks, and files. 
A workflow also consists of conditions which determine how information flows within the sequence of operations. 
For example, if a file passes Quality Assurance review it is assigned to the Coding Queue. 
If the file fails Quality Assurance review, it is assigned to a Curate Other Data queue.

As a volume owner creating a workflow, I want to create queues or ordered lists of files of a specific type that are awaiting human action in a workflow. 
Queues have a first-in-first out structure unless there is a priority override associated with a given file. 

As a volume owner or task manager, I want to create a priority override for a given file or files in a workflow. 
The priority override puts the designated files at the top of the queue, overriding the normal first-in-first out ordering of files/tasks in a queue.

As a volume owner creating a workflow, I want to create a list of tasks (analogous to epics in Agile methodology) that are linked to one another in an orderly sequence. 
For example, the figure above shows that Data Collection (e.g., by one of the 30 PLAY collection sites) is a task that is followed by Quality Assurance. 
Quality Assurance is followed by either Assignment to Coding or to Transfer to PLAY-other data volume on Databrary.

As a volume owner creating a workflow, I want to assign ownership over a task to a task manager. 
For example, a volume owner can designate a Quality Assurance manager for that particular task.

As a volume owner creating tasks or task manager, I want to create sequences of sub-tasks. 

For example, the Quality Assurance task might consist of the following sub-tasks: Assign video X to QA Analyst for review, Assign metadata X to QA analyst for review, Review QA Analyst report on video X, Review QA Analyst report on metadata X, Assign video X to coding queue, Assign video X to Curate other data queue.

Sub-tasks consist of the task description, an assigned person, status information, and the file names/identifiers, e.g., video file X or metadata file X.

As a volume owner or task manager, I want to be able to create volumes co-owned with specific coding lab PIs. 
The volumes will be linked to my workflows.

### Training

As a member of the PLAY staff, I need to assign specific data collection labs and data coding labs to general training tasks (use of LabNanny, use of Databrary), collection training tasks (scheduling & intake, video & survey data collection, cleanup & data entry), and coding training tasks (use of Datavyu, specific coding pass)

### Data Collection

As a volume owner or task manager, I want to be able to assign a data collection session to a data collection lab queue. 
The data collection session includes a participant code in the form of <site-id>-<participant-id> and may also include recommendations about the race/ethnicity, gender, or other demographic characteristics of the participant. 
For example, site and participant ID’s will be 4 digit numbers, making 0001-0001 a valid participant code. 

We should probably include the Databrary volume/session (slot) IDs in the metadata, perhaps in the file names themselves. 
This will make it easier to map project related info (sites and participant IDs) with the Databrary backend.

As a volume owner or task manager, I want to be able to create sessions in a volume for each data collection session assigned to a data collection lab queue. 
The volume I create will be co-owned with the data collection lab PI. The session will be populated with the site and participant IDs generated by Databrary. 
A new field will be added to the volume spreadsheet indicating the session’s data collection status.

As a data collection lab PI, I want to be to view my data collection queue; I want to be able to assign a data collection session in that queue to my lab scheduler.

As a data collection lab PI, once I have confirmed a participant family’s data collection session I want to enter in participant information that can be propagated across all of files, workflows, and coding for this participant family. 
This information includes sensitive contact information, demographics, age, disability status/eligibility to participate. Assign an anonymized participant ID that follows everything related to this participant. 
Some information (participant contact information, specifics of names) will only be visible to that data collection lab PI; all non-contact information is visible to all other labs.

As a data collection lab PI, once I have entered participant information and assigned a participant ID, when I am ready to go on a data collection session, I want to be able to automatically populate pdf forms that will be taken on the data collection and fill them with all of the information related to participant information.

### Data Uploading

As a data collection lab PI or my designated lab manager, I want to be able to upload video files, questionnaire data files, and other files to a specific data collection session. 
If the data collection session is 

### Quality Assurance (QA) review

As a data collection lab PI, I want to be able to upload video and other files to a data collection session on Databrary.

If/when we adopt a standard directory format for data collection sessions like BIDS we can modify this so that data collection lab PIs put their video and other files in the specified directory structure. For example: 0001-0001/0001-0001.mp4 and 0001-0001.questionnaires.mp4, etc. 
Then, the desktop sync can do the uploading to the centrally-generated volume & spreadsheet.

As a member of the PLAY staff I want to be able to prioritize that a data collection session from a new data collection lab, needs to be vetted for quality assurance before other files that need to be vetted for QA. 
(Details of which data collection lab have been vetted for quality data collection, need to be tracked and viewable separately in a list of trained/reliable data collection labs.)

### Coding passes

As a volume owner or task manager, I want to add a video for a specific coding pass to a specific coding lab queue. 
Adding a video to a coding lab queue for a coding pass generates a Datavyu coding template file customized for the video and pass. 
The Datavyu coding template file is added to the coding lab queue along with the video.

The Datavyu coding file template is a Datavyu file with a file name assigned by Databrary in the format of <site-id>-<video-id>-<pass-id>, an initial <id> spreadsheet column with <participant-id> and <age-group> variables only, and a column specific to the type of coding pass, e.g., transcription, language, gesture, emotional expression, locomotion, or object interaction.

As a coding lab PI, I want to assign a video assigned to my coding lab queue to a specific coder.

As a coding lab PI, want to be able to view a coding lab dashboard for my lab. 
The coding lab dashboard shows me the status of all videos in my coding lab queue, including those that have not yet been assigned to a coder, those that have been assigned to a coder and are in-process, those that have been coded, those that have been added to the interobserver reliability queue, those that have passed interobserver reliability review, and those that have been returned for recoding.

As a member of the PLAY staff I want to be able to prioritize that a coding pass from a new coder or new coding lab, needs to be vetted for interobserver reliability before other files that need to be vetted for reliability. 
(Details of which coding lab and coders have been vetted for reliable coding, need to be tracked and viewable separately in a list of trained/reliable coding labs/coders.)

### Data Sharing

As a volume owner or task manager, I want to assign data packages for sharing QA review to the sharing QA queue.

### Analytics/Viewing/Monitoring

As a volume owner or task manager I want to monitor progress in my workflow via analytics.

As a member of the PLAY staff, I want to view all participant IDs (participant-associated files) that are within a certain phase (ready for data collection, data collection complete, QA complete, data coding needs to be assigned, data coding in progress, data coding complete, data reliability needs to be assigned, data reliability in progress, fully coded and reliable, did not pass QA, did not pass reliability). 
The level of detail of viewing, needs to be about what needs to be done across all participants, NOT which individual person has been assigned what tasks.

As a member of the PLAY staff, I want to view what aspects of training/reliability need explicit attention within a data collection lab or data coding lab. 
I need to be able to view which labs are “good to go” for each aspect of collection or coding, and which need to revetted and need to be retrained. 
Aspects of training/vetting for data collection include: identifying eligible participants, scheduling/confirming, video collection, survey collection, data entry. 
Aspects of training/vetting for data coding include: initial training.

# PLAY 1.0 Workflow

The following figure depicts the PLAY project workflow as of 2019-09-26.


```r
knitr::include_graphics("https://www.play-project.org/img/overview-project.png")
```

<div class="figure">
<img src="https://www.play-project.org/img/overview-project.png" alt="Source: https://www.play-project.org/overview.html" width="600px" />
<p class="caption">Source: https://www.play-project.org/overview.html</p>
</div>

## Pre-collection training

### Overview (1.5 hrs)

### Training 2

### Training 3

### Training 4

## Data collection

See steps described in <https://www.play-project.org/collection.html>

### Upload data

1. *Designated Site RA* creates a session within the site-specific volume and completes Databrary spreadsheet data.
1. *Designated Site RA* uploads video to the site-specific Databrary volume.
1. *Designated Site RA* uploads ambient sound recording to data session on site-specific Databrary volume.
1. *Kobotoolbox application* uploads data file to Kobotoolbox server.
1. *PLAY staff* download Kobotoolbox file from Kobotoolbox server.
1. *PLAY staff* generate NDAR GUID using NYU server.
1. *PLAY staff* add NDAR GUID to appropriate session and volume.

#### Discussion

- *Launch Group PIs* will 'co-own' data with PLAY PIs, so uploading to site-specific Databrary volumes makes sense for initial upload.
This also ensures that session-specific metadata is entered in a consistent fashion and makes it possible to create automated workflows down the line.
- *How does Kobotoolbox questionnaire data get from Kobotoolbox server to the proper volume and session?*

## Quality Assurance (QA)

### Discussion

- *PLAY staff* must retrieve video and audio files from site-specific volumes and sessions. 
  - *How do PLAY staff know when there are files for them to process?*
  - *Can Databrary's notifications feature provide information about uploaded files that are ready for QA?*
- *PLAY staff* must download video files from site-specific volumes to i) play videos and ii) generate QA Datavyu file.
  - *What is the QA coding protocol?*
  - *What is an example QA Datavyu file?*
  - *Could we use Box as working file server for QA and coding assignments?*
    - Box would be more flexible than creating new Databrary volumes.
    - Box has an API that we might be able to access via scripts.
- *Do audio files undergo QA?*
- *How does questionnaire data undergo QA?*

## Coding

### Pre-coding training

1. *PLAY staff* ship coding equipment to coding labs.
1. *PLAY staff* conduct training.

### Assigning videos to coding labs

### Coding labs acquire videos

### Coding

Coding protocols for each pass are described in <https://www.play-project.org/coding.html>

### Coding files get returned

## Coding Quality Assurance (QA)

### Coding QA

### Reliability

## Merge coded data

## Clean and upload
