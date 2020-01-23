# qa_report_helpers.R
#
# Helper functions for the PLAY QA report

# Package installations

if (!require(tidyverse)) {
  install.packages("tidyverse")
}
if (!require(kableExtra)) {
  install.packages("kableExtra")
}
if (!require(lubridate)) {
  install.packages("lubridate")
}
if (!require(devtools)) {
  install.packages("devtools")
}
if (!require(databraryapi)) {
  devtools::install_github("PLAY-behaviorome/databraryapi")
}
if (!require(assertthat)) {
  install.packages("assertthat")
}

# Session name checks
session_name_has_PLAY <- function(df) {
  assertthat::noNA(df)
  assertthat::is.string(df$session_name)
  
  stringr::str_detect(df$session_name, "PLAY")
}

session_name_starts_with_PLAY <- function(df) {
  assertthat::noNA(df)
  assertthat::is.string(df$session_name)
  
  first_four <- stringr::str_sub(df$session_name, 1, 4)
  stringr::str_detect(first_four, "PLAY")
}

participant_ID_assigned <- function(df) {
  !is.na(df$participant.ID)
}

session_name_has_site_id <- function(df, site_id) {
  assertthat::is.string(site_id)
  stringr::str_detect(df$session_name, site_id)
}

detect_ID_in_name <- function(df) {
  stringr::str_detect(df$session_name, stringr::str_pad(df$participant.ID, 3, pad = "0"))
}

session_name_has_sub_id <- function(df) {
  # Initialize
  out <- participant_ID_assigned(df) & detect_ID_in_name(df)
  
  if (sum(out) < dim(df)[1]) {
    return(out)
  } else {
    sub_id_from_name <- stringr::str_sub(df$session_name, -3)
    sub_id_from_participant.id <-
      stringr::str_pad(df$participant.ID, 3, pad = "0")
    (sub_id_from_name == sub_id_from_participant.id) && out
  }
}

session_name_has_correct_separators <- function(df) {
  has_first_underscore <-
    stringr::str_sub(df$session_name, 5, 5) == "_"
  has_second_underscore <-
    stringr::str_sub(df$session_name, 11, 11) == "_"
  has_first_underscore & has_second_underscore
}

session_name_play_id_valid <- function(df) {
  play_id <- stringr::str_sub(df$session_name, 14, 22)
  stringr::str_detect(play_id, "[:alnum:]+")
}

session_name_length_ok <- function(df, name_length = 14) {
  stringr::str_length(df$session_name) == name_length
}

check_session_name <- function(df, site_id) {
  out_df <- df
  out_df <- dplyr::mutate(out_df,
    has_PLAY = session_name_has_PLAY(df),
    starts_w_PLAY = session_name_starts_with_PLAY(df),
    has_site_id = session_name_has_site_id(df, site_id),
    part_id_assigned = participant_ID_assigned(df),
    has_sub_id = session_name_has_sub_id(df),
    has_corr_seps = session_name_has_correct_separators(df),
    play_id_valid = session_name_play_id_valid(df),
    length_ok = session_name_length_ok(df),
    qa_pending = qa_pending(df)
  )
  
  out_df
}

# Spreadsheet checks
release_level_ok <- function(df, 
                             ok_levels = c("SHARED", "EXCERPTS", "PUBLIC")) {
  df$session_release %in% ok_levels 
}

release_level_public <- function(df) {
  df$session_release == "PUBLIC"
}

birthdate_not_NA <- function(df) {
  !is.na(df$participant.birthdate)
}

testdate_not_NA <- function(df) {
  !is.na(df$session_date)
}

birthdate_not_blank <- function(df) {
  df$participant.birthdate != ""
}

testdate_not_blank <- function(df) {
  df$session_date != ""
}

birthdate_is.Date <- function(df) {
  # Screen blanks and NAs
  out <- birthdate_not_blank(df) & birthdate_not_NA(df)
  
  # If 1 bad apple...
  if (sum(out) < dim(df)[1]) {
    return(out)
  } else {
    bd_is.Date <- lubridate::is.Date(lubridate::as_date(df$participant.birthdate))
    bd_is.Date & out
  }
}

testdate_is.Date <- function(df) {
  out <- testdate_not_NA(df) & testdate_not_blank(df)
  
  # If 1 bad apple...
  if (sum(out) < dim(df)[1]) {
    return(out)
  } else {
    td_is.Date <- lubridate::is.Date(lubridate::as_date(df$session_date))
    td_is.Date & out
  }
}

birth_before_test <- function(df) {
  bd_is.Date <- birthdate_is.Date(df)
  td_is.Date <- testdate_is.Date(df)
  
  out <- bd_is.Date & td_is.Date
  
  if (sum(out) < dim(df)[1]) {
    return(out)
  } else {
    bdate <- lubridate::as_date(df$participant.birthdate)
    tdate <- lubridate::as_date(df$session_date)
    (bdate < tdate) & out
  }
}

test_after_start <- function(df, start_date = "2018-12-15") {
  td_notNA <- testdate_not_NA(df)
  td_is.Date <- testdate_is.Date(df)
  
  out <- td_notNA & td_is.Date
  if (sum(out) < dim(df)[1]) {
    return(out)
  } else {
    tdate <- lubridate::as_date(df$session_date)
    start_date <- lubridate::as_date(start_date)
    
    (tdate > start_date) & out
  }
}

age_in_mos <- function(df) {
  out <- rep(NA, dim(df)[1])
  
  valid <- birthdate_is.Date(df) & testdate_is.Date(df)
  bdate <- lubridate::as_date(df$participant.birthdate[valid])
  tdate <- lubridate::as_date(df$session_date[valid])
  out[valid] <- as.numeric(lubridate::as.duration(tdate - bdate), "months")
  
  out
}

age_valid <- function(age, min_age, max_age) {
  gte_min_age <- age >= min_age
  lte_max_age <- age <= max_age
  gte_min_age & lte_max_age & !is.na(age)
}

mos_12 <- function(age) {
  age_valid(age, 11.75, 12.25)
}

mos_18 <- function(age) {
  age_valid(age, 17.75, 18.25)
}

mos_24 <- function(age) {
  age_valid(age, 23.75, 24.25)
}

age_group_valid <- function(df) {
  this_age <- age_in_mos(df)
  mos_12(this_age) | mos_18(this_age) | mos_24(this_age)
}

gender_ok <- function(df) {
  df$participant.gender %in% c("Male", "Female")
}

race_ok <- function(df) {
  race_categories <- c(
    "American Indian or Alaskan Native",
    "Asian",
    "Native Hawaiian or other Pacific Islander",
    "Black or African American",
    "White",
    "More than one",
    "Other",
    "Refused"
  )
  df$participant.race %in% race_categories
}

ethnicity_ok <- function(df) {
  ethnicity_categories <- c("Hispanic or Latino",
                            "Not Hispanic or Latino",
                            "Refused")
  
  df$participant.ethnicity %in% ethnicity_categories
}

disability_ok <- function(df) {
  df$participant.disability != "Typical"
}

language_ok <- function(df) {
  language_categories <- c("English",
                           "Spanish",
                           "English, Spanish",
                           "Spanish, English")
  
  df$participant.language %in% language_categories
}

not_excluded <- function(df) {
  if ("exclusion.reason" %in% names(df)) {
    df$exclusion.reason == ""    
  } else {
    rep(FALSE, dim(df)[1])
  }
}

exclusion_ok <- function(df,
    accepted_vals = c("pilot", "other", 
                      "language not English or Spanish", "")) {
    if ("exclusion.reason" %in% names(df)) {
      df$exclusion.reason %in% accepted_vals
    } else {
      rep(FALSE, dim(df)[1])
    }
}

group_ok <- function(df,
                     accepted_vals = c("PLAY_Gold", "PLAY_Silver",
                                       "No_Visit", "Pilot", "")) {
  if ("group.name" %in% names(df)) {
    df$group.name %in% accepted_vals
  } else {
    rep(FALSE, dim(df)[1])
  }  
}

qa_pending <- function(df) {
  if ("group.name" %in% names(df)) {
    df$group.name %in% c("")
  } else {
    rep(FALSE, dim(df)[1])
  }  
}

home_ok <- function(df) {
  if ("context.setting" %in% names(df)) {
    df$context.setting == "Home"
  } else {
    rep(FALSE, dim(df)[1])
  }
}

country_ok <- function(df) {
  if ("context.country" %in% names(df)) {
    df$context.country == "US"
  } else {
    rep(FALSE, dim(df)[1])
  }
}

state_ok <- function(df) {
  if ("context.state" %in% names(df)) {
    df$context.state %in% c(state.abb, "DC")    
  } else {
    rep(FALSE, dim(df)[1])
  }
}

check_session_ss <- function(df) {
  if (!is.data.frame(df)) {
    stop("Data frame is required")
  }
  
  df <- dplyr::mutate(df,
                          release_level_ok = release_level_ok(df),
                          release_level_public = release_level_public(df),
                          birth_before_test = birth_before_test(df),
                          test_after_start = test_after_start(df),
                          age_group_valid = age_group_valid(df),
                          gender_ok = gender_ok(df),
                          race_ok = race_ok(df),
                          ethnicity_ok = ethnicity_ok(df),
                          not_excluded = not_excluded(df),
                          disability_ok = disability_ok(df),
                          language_ok = language_ok(df),
                          exclusion_ok = exclusion_ok(df),
                          group_ok = group_ok(df),
                          qa_pending = qa_pending(df),
                          home_ok = home_ok(df),
                          country_ok = country_ok(df),
                          state_ok = state_ok(df)
  )
  
  df
}

# check_session_ss <- function(df, site_id) {
#   out_df <- df
#   out_df <- dplyr::mutate(out_df,
#     release_level_ok = release_level_ok(out_df),
#     release_level_public = release_level_public(out_df),
#     birth_before_test = birth_before_test(out_df),
#     test_after_start = test_after_start(out_df),
#     age_group_valid = age_group_valid(out_df),
#     gender_ok = gender_ok(out_df),
#     race_ok = race_ok(out_df),
#     ethnicity_ok = ethnicity_ok(out_df),
#     not_excluded = not_excluded(out_df),
#     disability_ok = disability_ok(out_df),
#     language_ok = language_ok(out_df),
#     exclusion_ok = exclusion_ok(out_df),
#     home_ok = home_ok(out_df),
#     country_ok = country_ok(out_df),
#     state_ok = state_ok(out_df)
#   )
#   
#   out_df
# }

# Files within sessions
this_session_assets <- function(i, df, this_vol_id) {
  databraryapi::list_assets_in_session(this_vol_id, df$session_id[i])
}

NaturalPlay_exists <- function(fnames) {
  result <- stringr::str_detect(fnames, "NaturalPlay")
  as.logical(sum(result))
}

HouseWalkthrough_exists <- function(fnames) {
  result <- stringr::str_detect(fnames, "HouseWalkthrough")
  as.logical(sum(result))
}

StructuredPlay_exists <- function(fnames) {
  result <- stringr::str_detect(fnames, "StructuredPlay")
  as.logical(sum(result))
}

dot_mov_in_filenames <- function(fnames) {
  assertthat::is.string(fnames)
  result <- stringr::str_detect(fnames, ".mov$")
  sum(result)
}

Questionnaires_exists <- function(fnames) {
  result <- stringr::str_detect(fnames, "Questionnaires")
  as.logical(sum(result))
}

bad_video_names <- function(fnames) {
  np <- NaturalPlay_exists(fnames)
  hw <- HouseWalkthrough_exists(fnames)
  sp <- StructuredPlay_exists(fnames)
  qs <- Questionnaires_exists(fnames)
  
  bad_names = ""
  if ((!np) || (!hw) || (!sp) || (!qs)) {
    bad_names = fnames
  }
  bad_names
}

four_or_more_files <- function(fnames) {
  if (is.null(fnames)) {
    FALSE
  } else {
    length(fnames) >= 4
  }
}

four_or_more_videos <- function(sess_assets_df) {
  assertthat::not_empty(sess_assets_df)
# assertthat::has_name(sess_assets_df, asset_type)
  
  vids <- dplyr::select(sess_assets_df, asset_type)
  mp4s <- vids == "MPEG-4 video"
  ifelse(sum(mp4s) >= 4, TRUE, FALSE)
}

generate_session_url <- function(i, df, this_vol_id) {
  this_sess_id <- df$session_id[i]
  url <-
    paste0("https://databrary.org/volume/",
           this_vol_id,
           "/slot/",
           this_sess_id,
           "/-")
  url
}

generate_vol_url <-
  function(vol_id = 899,
           site_code = "NYU",
           markdown = TRUE) {
    assertthat::is.number(vol_id)
    assertthat::is.string(site_code)
    if (markdown) {
      paste0(
        "[",
        site_code,
        " collection volume ",
        vol_id,
        "](",
        "https://databrary.org/volume/",
        vol_id,
        ")"
      )
    } else {
      paste0("https://databrary.org/volume/", vol_id)
    }
  }

check_videos_in_session <- function(i, df, this_vol_id) {
  assertthat::is.number(i)
  assertthat::not_empty(df)
  assertthat::is.number(this_vol_id)
  
  sess_assets <- this_session_assets(i, df, this_vol_id)
  if (is.null(sess_assets)) {
    out_df <- dplyr::tibble(
      session_name = df$session_name[i],
      url = generate_session_url(i, df, this_vol_id),
      NaturalPlay_exists = FALSE,
      HouseWalkthrough_exists = FALSE,
      StructuredPlay_exists = FALSE,
      Questionnaires_exists = FALSE,
      four_or_more_videos = FALSE
    )
  } else {
    out_df <- dplyr::tibble(
      session_name = df$session_name[i],
      url = generate_session_url(i, df, this_vol_id),
      NaturalPlay_exists = NaturalPlay_exists(sess_assets$name),
      HouseWalkthrough_exists = HouseWalkthrough_exists(sess_assets$name),
      StructuredPlay_exists = StructuredPlay_exists(sess_assets$name),
      Questionnaires_exists = Questionnaires_exists(sess_assets$name),
      four_or_more_videos = four_or_more_videos(sess_assets)
    )
  }
  
  out_df
}

# Rendering QA reports
render_qa_report <- function(vol_id = 899,
                             site_code = "NYU",
                             databrary_login = "default@email.com",
                             output_dir = paste0(report_root, "/session_qa"),
                             report_root = "session_qa_reports") {
  start_time <- Sys.time()
  
  # check parameters
  if (is.null(vol_id)) {
    stop("Volume ID not specified.")
  }
  if (is.null(databrary_login)) {
    stop("Databrary login ID not specified.")
  }
  if (!is.character(databrary_login)) {
    stop("Databrary login ID must be character value.")
  }
  if (!databraryapi::login_db(databrary_login)) {
    stop("Error logging in to Databrary.")
  }
  if (is.null(output_dir)) {
    stop("Output directory not specified.")
  }
  if (!is.character(output_dir)) {
    stop("Output directory must be character value.")
  }
  assertthat::is.string(report_root)
  
  # Create output_dir if necessary
  if (!(output_dir %in% list.dirs())) {
    message(paste0("Creating ", output_dir, "/."))
    dir.create(output_dir, showWarnings = FALSE)
  }
  
  rmarkdown::render(
    paste0(report_root, "/", "session-qa-report.Rmd"),
    params = list(
      vol_id = vol_id,
      databrary_login = databrary_login,
      site_code = site_code,
      set_title = generate_vol_url(vol_id, site_code)
    ),
    output_dir = output_dir,
    output_file = paste0(
      "session-qa-report-",
      vol_id,
      "-",
      site_code,
      "-",
      format(Sys.time(), "%Y-%m-%d-%H%M"),
      ".html"
    )
  )
  
  end_time <- Sys.time()
  message(paste0("Execution time: ", end_time - start_time, " secs"))
}

generate_nyu_qa <- function(db_login) {
  assertthat::is.string(db_login)
  render_qa_report(vol_id = 899,
                   site_code = "NYUNI",
                   databrary_login = db_login)
}

generate_gtu_qa <- function(db_login) {
  assertthat::is.string(db_login)
  render_qa_report(vol_id = 954,
                   site_code = "GEORG",
                   databrary_login = db_login)
}

generate_vcu_qa <- function(db_login) {
  assertthat::is.string(db_login)
  render_qa_report(vol_id = 982,
                   site_code = "VCOMU",
                   databrary_login = db_login)
}

generate_all_qa <- function(db_login) {
  generate_nyu_qa(db_login)
  generate_gtu_qa(db_login)
  generate_vcu_qa(db_login)
  databraryapi::logout_db()
}
