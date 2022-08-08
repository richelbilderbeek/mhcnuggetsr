#' Get the default folder for \link[ormr]{ormr}.
#'
#' This is either `python3` (such as in this case, when the user uses `pip`
#' to install Python packages) or a folder where \link[ormr]{ormr} installs
#' Python packages using \link[reticulate]{reticulate}.
#' @return the default \link[ormr]{ormr} folder
#' @examples
#' get_default_orm_folder_name()
#' @author Richèl J.C. Bilderbeek
#' @export
get_default_orm_folder_name <- function() {
  "python3"
}
