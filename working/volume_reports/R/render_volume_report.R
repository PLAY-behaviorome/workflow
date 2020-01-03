render_volume_report <- function(vol_id = 444, 
                                 databrary_login = "email@provider.com",
                                 output_dir = ".") {
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
  
  # Create output_dir if necessary
  if (!(output_dir %in% list.dirs())) {
    message(paste0("Creating ", output_dir, "/."))
    dir.create(output_dir)
  }
  
  rmarkdown::render("volume-report.Rmd", 
                    params = list(vol_id = vol_id, 
                                  databrary_login = databrary_login),
                    output_dir = output_dir,
                    output_file = paste0("volume-report-", vol_id, ".html"))
  
  end_time <- Sys.time()
  message(paste0("Execution time: ", end_time-start_time))
}
