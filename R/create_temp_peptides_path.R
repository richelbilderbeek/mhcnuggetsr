#' Create a path to a non-existing temporary file
#' @param fileext file extension
#' @author Richèl J.C. Bilderbeek
#' @examples
#' create_temp_peptides_path()
#' @export
create_temp_peptides_path <- function(
  fileext = ".fasta"
) {
  file.path(
    rappdirs::user_cache_dir(),
    basename(
      tempfile(pattern = "mhcnuggets_", fileext = fileext)
    )
  )
}
