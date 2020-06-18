#' Predict the half maximal inhibitory concentration (aka IC50) (in nM)
#' for one or more peptides as saved in a file.
#' Each peptide must be 15 amino acids at
#' most (use \link{predict_ic50s} to predict the IC50s for longer peptides)
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
#'   mhcnuggets_options <- create_mhcnuggets_options(
#'     mhc = mhc_1_haplotype
#'   )
#'
#'   df <- predict_ic50_from_file(
#'     peptides_path = peptides_path,
#'     mhcnuggets_options = mhcnuggets_options
#'   )
#'   expect_true("peptide" %in% names(df))
#'   expect_true("ic50" %in% names(df))
#'   expect_equal("character", class(df$peptide))
#'   expect_equal("numeric", class(df$ic50))
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
predict_ic50_from_file <- function(
  mhcnuggets_options,
  peptides_path
) {
  if (!file.exists(peptides_path)) {
    stop(
      "Cannot find 'peptides_path'. \n",
      "Actual value: ", peptides_path
    )
  }
  if (any(nchar(readLines(peptides_path, warn = FALSE)) > 15)) {
    stop("'peptides' must have lengths of at most 15")
  }
  mhcnuggetsr::check_mhcnuggets_options(mhcnuggets_options)

  if (is.na(mhcnuggets_options$mhc_class)) {
    if (mhcnuggets_options$mhc %in% mhcnuggetsr::get_mhc_1_haplotypes()) {
      mhcnuggets_options$mhc_class <- "I"
    } else {
      testthat::expect_true(
        mhcnuggets_options$mhc %in% mhcnuggetsr::get_mhc_2_haplotypes()
      )
      mhcnuggets_options$mhc_class <- "II"
    }
  }
  testthat::expect_true(mhcnuggets_options$mhc_class %in% c("I", "II"))

  module <- reticulate::import_from_path(module = "mhcnuggets")
  filename <- mhcnuggetsr::create_temp_peptides_path(fileext = ".csv")
  suppressMessages(
    module$src$predict$predict(
      class_ = mhcnuggets_options$mhc_class,
      peptides_path = peptides_path,
      mhc = mhcnuggets_options$mhc,
      ba_models = mhcnuggets_options$ba_models,
      output = filename
    )
  )

  df <- tibble::as_tibble(utils::read.csv(filename))
  df$peptide <- as.character(df$peptide)
  df
}
