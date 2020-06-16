#' Predict the half maximal inhibitory concentration (aka IC50) (in nM)
#' for one or more peptides.
#' Each peptide must be 15 amino acids at
#' most (use \link{predict_ic50s} to predict the IC50s for longer peptides)
#' @inheritParams default_params_doc
#' @examples
#' library(testthat)
#'
#' if (is_mhcnuggets_installed()) {
#'
#'   peptides <- c("AIAACAMLLV", "ALVCYIVMPV", "ALEPRKEIDV")
#'   mhc_1_haplotype <- "HLA-A02:01"
#'
#'   mhcnuggets_options <- create_mhcnuggets_options(
#'     mhc = mhc_1_haplotype
#'   )
#'
#'   df <- predict_ic50(
#'     peptides = peptides,
#'     mhcnuggets_options = mhcnuggets_options
#'   )
#'   expect_true("peptide" %in% names(df))
#'   expect_true("ic50" %in% names(df))
#'   expect_equal("character", class(df$peptide))
#'   expect_equal("numeric", class(df$ic50))
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
predict_ic50 <- function(
  mhcnuggets_options,
  peptides,
  peptides_path = create_temp_peptides_path()
) {
  if (any(nchar(peptides) > 15)) {
    stop("'peptides' must have lengths of at most 15")
  }
  writeLines(text = peptides, con = peptides_path)
  mhcnuggetsr::predict_ic50_from_file(
    mhcnuggets_options = mhcnuggets_options,
    peptides_path = peptides_path
  )
}
