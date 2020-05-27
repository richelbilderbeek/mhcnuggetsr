#' Predict
#' @inheritParams default_params_doc
#' @examples
#' library(testthat)
#'
#' if (is_mhcnuggets_installed()) {
#'
#'   peptides_path <- get_example_filename("test_peptides.peps")
#'   expect_true(file.exists(peptides_path))
#'
#'   mhc_1_haplotype <- "HLA-A02:01"
#'   expect_true(mhc_1_haplotype %in% get_trained_mhc_1_haplotypes())
#'
#'   df <- predict_ic50(
#'     mhc_class = "I",
#'     peptides = peptides_path,
#'     mhc = mhc_1_haplotype
#'   )
#'   expect_true("peptide" %in% names(df))
#'   expect_true("ic50" %in% names(df))
#'   expect_equal("character", class(df$peptide))
#'   expect_equal("numeric", class(df$ic50))
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
predict_ic50 <- function(
  mhc_class,
  peptides,
  mhc,
  ba_models = FALSE,
  folder_name = get_default_mhcnuggets_folder(),
  mhcnuggets_url = get_mhcnuggets_url(),
  peptides_path = tempfile()
) {
  writeLines(text = peptides, con = peptides_path)
  mhcnuggetsr::predict_ic50_from_file(
    mhc_class = mhc_class,
    peptides_path = peptides_path,
    mhc = mhc,
    ba_models = ba_models,
    folder_name = folder_name,
    mhcnuggets_url = mhcnuggets_url
  )
}
