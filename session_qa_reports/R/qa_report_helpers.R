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
session_name_has_PLAY <- function(i, df) {
  assertthat::is.number(i)
  first_four <- stringr::str_sub(df$session_name[i], 1, 4)
  stringr::str_detect(first_four, "PLAY")
}

session_name_has_site_id <- function(i, df, site_id) {
  assertthat::is.number(i)
  assertthat::is.string(site_id)
  
  site_id_from_name <- stringr::str_sub(df$session_name[i], 6, 8)
  site_id_from_name == site_id
}

session_name_has_sub_id <- function(i, df) {
  assertthat::is.number(i)
  
  sub_id_from_name <- stringr::str_sub(df$session_name[i], -3)
  sub_id_from_participant.id <-
    stringr::str_pad(df$participant.ID[i], 3, pad = "0")
  sub_id_from_name == sub_id_from_participant.id
}

session_name_has_correct_separators <- function(i, df) {
  has_first_underscore <-
    stringr::str_sub(df$session_name[i], 5, 5) == "_"
  has_second_underscore <-
    stringr::str_sub(df$session_name[i], 11, 11) == "_"
  # has_first_dash <-
  #   stringr::str_sub(df$session_name[i], 13, 13) == "-"
  
  has_first_underscore && has_second_underscore #&& has_first_dash
}

session_name_play_id_valid <- function(i, df) {
  play_id <- stringr::str_sub(df$session_name[i], 14, 22)
  stringr::str_detect(play_id, "[:alnum:]+")
}

session_name_length_ok <- function(i, df, name_length = 23) {
  stringr::str_length(df$session_name[i]) == name_length
}

check_session_name <- function(i, df, site_id) {
  out_df <- dplyr::tibble(
    session_name = df$session_name[i],
    has_PLAY = session_name_has_PLAY(i, df),
    has_site_id = session_name_has_site_id(i, df, site_id),
    has_sub_id = session_name_has_sub_id(i, df),
    has_corr_seps = session_name_has_correct_separators(i, df),
    play_id_valid = session_name_play_id_valid(i, df),
    length_ok = session_name_length_ok(i, df)
  )
  
  out_df
}

# Spreadsheet checks
release_level_ok <-
  function(i,
           df,
           ok_levels = c("SHARED", "EXCERPTS", "PUBLIC")) {
    this_release_level <- df$session_release[i]
    this_release_level %in% ok_levels
  }

release_level_public <- function(i, df) {
  df$session_release[i] == "PUBLIC"
}

birthdate_not_NA <- function(i, df) {
  !is.na(df$participant.birthdate[i])
}

testdate_not_NA <- function(i, df) {
  !is.na(df$session_date[i])
}

birthdate_not_blank <- function(i, df) {
  df$participant.birthdate[i] != ""
}

testdate_not_blank <- function(i, df) {
  df$session_date[i] != ""
}

birthdate_is.Date <- function(i, df) {
  if (birthdate_not_NA(i, df) && birthdate_not_blank(i, df)) {
    lubridate::is.Date(lubridate::as_date(df$participant.birthdate[i]))
  } else {
    FALSE
  }
}

testdate_is.Date <- function(i, df) {
  if (testdate_not_NA(i, df) && testdate_not_blank(i, df)) {
    lubridate::is.Date(lubridate::as_date(df$session_date[i]))
  } else {
    FALSE
  }
}

birth_before_test <- function(i, df) {
  if (birthdate_is.Date(i, df) && testdate_is.Date(i, df)) {
    bdate <- lubridate::as_date(df$participant.birthdate[i])
    tdate <- lubridate::as_date(df$session_date[i])
    bdate < tdate
  } else {
    FALSE
  }
}

test_after_start <- function(i, df, start_date = "2018-12-15") {
  if (testdate_not_NA(i, df) && testdate_is.Date(i, df)) {
    tdate <- lubridate::as_date(df$session_date[i])
    start_date <- lubridate::as_date(start_date)
    tdate > start_date
  } else {
    FALSE
  }
}

age_in_mos <- function(i, df) {
  if (birthdate_is.Date(i, df) && testdate_is.Date(i, df)) {
    bdate <- lubridate::as_date(df$participant.birthdate[i])
    tdate <- lubridate::as_date(df$session_date[i])
    as.numeric(lubridate::as.duration(tdate - bdate), "months")
  } else {
    NA
  }
}

age_valid <- function(age, min_age, max_age) {
  gte_min_age <- age >= min_age
  lte_max_age <- age <= max_age
  gte_min_age && lte_max_age && !is.na(age)
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

age_group_valid <- function(i, df) {
  this_age <- age_in_mos(i, df)
  mos_12(this_age) || mos_18(this_age) || mos_24(this_age)
}

gender_ok <- function(i, df) {
  df$participant.gender[i] %in% c("Male", "Female")
}

race_ok <- function(i, df) {
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
  df$participant.race[i] %in% race_categories
}

ethnicity_ok <- function(i, df) {
  ethnicity_categories <- c("Hispanic or Latino",
                            "Not Hispanic or Latino",
                            "Refused")
  
  df$participant.ethnicity[i] %in% ethnicity_categories
}

disability_ok <- function(i, df) {
  df$participant.disability[i] != "Typical"
}

language_ok <- function(i, df) {
  language_categories <- c("English",
                           "Spanish",
                           "English, Spanish",
                           "Spanish, English")
  
  df$participant.language[i] %in% language_categories
}

not_excluded <- function(i, df) {
  df$exclusion.reason[i] == ""
}

exclusion_ok <-
  function(i,
           df,
           accepted_vals = c("pilot", "other", "language not English or Spanish", "")) {
    df$exclusion.reason[i] %in% accepted_vals
  }

home_ok <- function(i, df) {
  df$context.setting[i] == "Home"
}

country_ok <- function(i, df) {
  df$context.country[i] == "US"
}

state_ok <- function(i, df) {
  df$context.state[i] %in% state.abb
}

check_session_ss <- function(i, df, site_id) {
  out_df <- dplyr::tibble(
    session_name = df$session_name[i],
    release_level_ok = release_level_ok(i, df),
    release_level_public = release_level_public(i, df),
    birth_before_test = birth_before_test(i, df),
    test_after_start = test_after_start(i, df),
    age_group_valid = age_group_valid(i, df),
    gender_ok = gender_ok(i, df),
    race_ok = race_ok(i, df),
    ethnicity_ok = ethnicity_ok(i, df),
    not_excluded = not_excluded(i, df),
    disability_ok = disability_ok(i, df),
    language_ok = language_ok(i, df),
    exclusion_ok = exclusion_ok(i, df),
    home_ok = home_ok(i, df),
    country_ok = country_ok(i, df),
    state_ok = state_ok(i, df)
  )
  
  out_df
}

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
                   site_code = "NYU",
                   databrary_login = db_login)
}

generate_gtu_qa <- function(db_login) {
  assertthat::is.string(db_login)
  render_qa_report(vol_id = 954,
                   site_code = "GTU",
                   databrary_login = db_login)
}

generate_all_qa <- function(db_login) {
  generate_nyu_qa(db_login)
  generate_gtu_qa(db_login)
}
