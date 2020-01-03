# box integration helpers

play_folder_id <- "97191561864"

download_session_videos <- function(session_id = 36876, vol_id = 899,
                                    site_id = "NYU", session_dir = paste0(site_id, "-", 
                                                                          vol_id, "-", session_id),
                                    vb = TRUE) {
  require(tidyverse)
  require(databraryapi)
  
  assertthat::is.number(session_id)
  assertthat::is.number(vol_id)
  assertthat::is.string(site_id)
  
  if (!dir.exists(session_dir)) {
    message(paste0("'session_dir' ", session_dir, " does not exist. Creating."))
    dir.create(session_dir)
  }
  assertthat::is.string(session_dir)
  assertthat::is.dir(session_dir)
  assertthat::is.writeable(session_dir)
  
  if (vb) message("Downloading list of session assets.")
  session_assets <- databraryapi::list_assets_in_session(vol_id, session_id)
  assertthat::not_empty(session_assets)
  
  video_assets <- dplyr::filter(session_assets, asset_type == "MPEG-4 video")
  assertthat::not_empty(video_assets)
  
  vid_ids <- video_assets$asset_id
  
  for (v in 1:length(vid_ids)) {
    if (vb) message(paste0("Downloading video ", v, " of ", length(vid_ids), "\n."))
    databraryapi::download_video(vol_id, session_id, asset_id = vid_ids[v],
                                 out_dir = session_dir,
                                 vb = vb)
  }
}

