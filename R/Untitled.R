df <- data.frame(name = c("PLAY1", "play2", "yelp3", NA), 
                 site_id = c("nyu", "nyu", "nuy", ""))

has_PLAY <- function(df) {
  first_four <- stringr::str_sub(df$name, 1, 4)
  df$has_PLAY <- stringr::str_detect(first_four, "PLAY")
  df
}

has_PLAY_2 <- function(df) {
  dplyr::mutate(df, has_PLAY = stringr::str_detect(stringr::str_sub(df$name, 1, 4), "PLAY"))
}

has_site_id <- function(df, id) {
  dplyr::mutate(df, has_site_id = (site_id == id))
}

check_inputs <- function(df) {
  assertthat::validate_that(is.data.frame(df),
                            is.character(df$name),
                            is.character(df$site_id))
}
