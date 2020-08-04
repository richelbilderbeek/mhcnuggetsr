#' Predict the IC50 for peptides.
#'
#' Predict the half maximal inhibitory concentration (aka IC50) (in nM)
#' for one or more peptides.
#' Each peptide must be 15 amino acids at
#' most (use \link{predict_ic50s} to predict the IC50s for longer peptides)
#' @note this function uses a temporary file, because MHCnuggets reads its
#' input from file. This temporary file is deleted after this function
#' passed successfully.
#' @return a tibble with two columns:
#' (1) \code{peptide}, which holds the peptide sequence, and
#' (2) \code{ic50}, which holds the predicted IC50
#' @inheritParams default_params_doc
#' @examples
#' if (is_mhcnuggets_installed()) {
#'
#'   peptides <- c("AIAACAMLLV", "ALVCYIVMPV", "ALEPRKEIDV")
#'   mhc_1_haplotype <- "HLA-A02:01"
#'
#'   mhcnuggets_options <- create_mhcnuggets_options(
#'     mhc = mhc_1_haplotype
#'   )
#'
#'   predict_ic50(
#'     peptides = peptides,
#'     mhcnuggets_options = mhcnuggets_options
#'   )
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
predict_ic50 <- function(
  mhcnuggets_options,
  peptides,
  peptides_path = create_temp_peptides_path()
) {
  if (any(nchar(peptides) > 15)) {
    stop(
      "'peptides' must have lengths of at most 15 amino acids. \n",
      "Tip: use 'predict_ic50s' to get the IC50s for longer peptides"
    )
  }
  writeLines(text = peptides, con = peptides_path)
  ic50 <- mhcnuggetsr::predict_ic50_from_file(
    mhcnuggets_options = mhcnuggets_options,
    peptides_path = peptides_path
  )
  file.remove(peptides_path)
  ic50
}
