#' Get the default `ormr` folder name
#' @return the default `ormr` folder name
#' @examples
#' get_default_ormr_folder_name()
#' @author Richèl J.C. Bilderbeek
#' @export
get_default_ormr_folder_name <- function() {
  rappdirs::user_data_dir(appname = "ormr")
}
