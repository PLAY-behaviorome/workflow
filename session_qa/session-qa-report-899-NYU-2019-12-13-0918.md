---
title: "PLAY Session Spreadsheet QA"
author: "Rick Gilmore"
date: "2019-12-13 09:18:17"
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
  only_show_included: TRUE
---



# PLAY Site NYU QA Report

Site data collection volume: <https://databrary.org/volume/899>

## Session name checks





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

<table class="table table-striped table-hover table-condensed" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> session_name </th>
   <th style="text-align:left;"> age_group_valid </th>
   <th style="text-align:left;"> gender_ok </th>
   <th style="text-align:left;"> race_ok </th>
   <th style="text-align:left;"> ethnicity_ok </th>
   <th style="text-align:left;"> not_excluded </th>
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
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
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
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#022 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#023 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#024 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#025 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#026 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#027 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#028 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#029 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#030 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#031 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#032 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
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

<table class="table table-striped table-hover table-condensed" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> session_name </th>
   <th style="text-align:left;"> disability_ok </th>
   <th style="text-align:left;"> language_ok </th>
   <th style="text-align:left;"> exclusion_ok </th>
   <th style="text-align:left;"> home_ok </th>
   <th style="text-align:left;"> country_ok </th>
   <th style="text-align:left;"> state_ok </th>
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
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_002-e9N1A7F2A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
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
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_004-e4N0S8E1A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
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
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_006-e1N9E7S0A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
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
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#021 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
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
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#023 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#024 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#025 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
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
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#027 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
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
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#029 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
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
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#031 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#032 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#033 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
</tbody>
</table>

## Video file-level checks





<table class="table table-striped table-hover table-condensed" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> session_name </th>
   <th style="text-align:left;"> url </th>
   <th style="text-align:left;"> NaturalPlay_exists </th>
   <th style="text-align:left;"> HouseWalkthrough_exists </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_001-e9N8O8B0A </td>
   <td style="text-align:left;"> https://databrary.org/volume/899/slot/41534/- </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_002-e9N1A7F2A </td>
   <td style="text-align:left;"> https://databrary.org/volume/899/slot/41800/- </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_003-e0N2N8S1A </td>
   <td style="text-align:left;"> https://databrary.org/volume/899/slot/41455/- </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_004-e4N0S8E1A </td>
   <td style="text-align:left;"> https://databrary.org/volume/899/slot/41535/- </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_005-e0N4H8O2A </td>
   <td style="text-align:left;"> https://databrary.org/volume/899/slot/41608/- </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_006-e1N9E7S0A </td>
   <td style="text-align:left;"> https://databrary.org/volume/899/slot/41808/- </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_007-e1N1S8M1A </td>
   <td style="text-align:left;"> https://databrary.org/volume/899/slot/41894/- </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#021 </td>
   <td style="text-align:left;"> https://databrary.org/volume/899/slot/38198/- </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#022 </td>
   <td style="text-align:left;"> https://databrary.org/volume/899/slot/36876/- </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#023 </td>
   <td style="text-align:left;"> https://databrary.org/volume/899/slot/37417/- </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#024 </td>
   <td style="text-align:left;"> https://databrary.org/volume/899/slot/37450/- </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#025 </td>
   <td style="text-align:left;"> https://databrary.org/volume/899/slot/37982/- </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#026 </td>
   <td style="text-align:left;"> https://databrary.org/volume/899/slot/38195/- </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#027 </td>
   <td style="text-align:left;"> https://databrary.org/volume/899/slot/38196/- </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#028 </td>
   <td style="text-align:left;"> https://databrary.org/volume/899/slot/38197/- </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#029 </td>
   <td style="text-align:left;"> https://databrary.org/volume/899/slot/38215/- </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#030 </td>
   <td style="text-align:left;"> https://databrary.org/volume/899/slot/38236/- </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#031 </td>
   <td style="text-align:left;"> https://databrary.org/volume/899/slot/38485/- </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#032 </td>
   <td style="text-align:left;"> https://databrary.org/volume/899/slot/41754/- </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#033 </td>
   <td style="text-align:left;"> https://databrary.org/volume/899/slot/42112/- </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
</tbody>
</table>

<table class="table table-striped table-hover table-condensed" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> session_name </th>
   <th style="text-align:left;"> StructuredPlay_exists </th>
   <th style="text-align:left;"> Questionnaires_exists </th>
   <th style="text-align:left;"> four_or_more_videos </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_001-e9N8O8B0A </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_002-e9N1A7F2A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_003-e0N2N8S1A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_004-e4N0S8E1A </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_005-e0N4H8O2A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_006-e1N9E7S0A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PLAY_NYU_007-e1N1S8M1A </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#021 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#022 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#023 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#024 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#025 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#026 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#027 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#028 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#029 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#030 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#031 </td>
   <td style="text-align:left;"> <span style="     color: red !important;">FALSE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#032 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PlayPilot_S#033 </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
   <td style="text-align:left;"> <span style="     color: green !important;">TRUE</span> </td>
  </tr>
</tbody>
</table>
