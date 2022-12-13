#' Predict the half maximal inhibitory concentration (aka IC50) (in nM)
#' for one or more peptides as saved in a file.
#' Each peptide must be 15 amino acids at
#' most (use \link{predict_ic50s} to predict the IC50s for longer peptides)
#' @inheritParams default_params_doc
#' @param mhcnuggets_output_filename path to a temporary file to write
#' the MHCnuggets results to. This file will be deleted at the end of
#' the function if it passes successfully.
#' @examples
#' if (is_mhcnuggets_installed()) {
#'
#'   peptides_path <- get_example_filename("test_peptides.peps")
#'   mhc_1_haplotype <- "HLA-A02:01"
#'   mhcnuggets_options <- create_mhcnuggets_options(
#'     mhc = mhc_1_haplotype
#'   )
#'
#'   predict_ic50_from_file(
#'     peptides_path = peptides_path,
#'     mhcnuggets_options = mhcnuggets_options
#'   )
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
predict_ic50_from_file <- function(
  mhcnuggets_options,
  peptides_path,
  mhcnuggets_output_filename = mhcnuggetsr::create_temp_peptides_path(
    fileext = ".csv"
  ),
  verbose = FALSE
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
  if (peptides_path == mhcnuggets_output_filename) {
    stop(
      "'peptides_path' and 'mhcnuggets_output_filename' must be different, \n",
      "because 'mhcnuggets_output_filename' is a temporary file that will \n",
      "be deleted. \n",
      "peptides_path: ", peptides_path
    )
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

  dir.create(
    path = dirname(mhcnuggets_output_filename),
    showWarnings = FALSE,
    recursive = TRUE
  )

  # Up to full path
  peptides_path <- normalizePath(peptides_path)
  testthat::expect_true(file.exists(peptides_path))
  mhcnuggets_output_filename <- normalizePath(
    mhcnuggets_output_filename,
    mustWork = FALSE
  )
  testthat::expect_true(peptides_path != mhcnuggets_output_filename)

  if (verbose) {
    message(
      "Calling MHCnuggets, with:\n",
      "class: ", mhcnuggets_options$mhc_class, "\n",
      "peptides_path: ", peptides_path, "\n",
      "mhc: ", mhcnuggets_options$mhc, "\n",
      "ba_models: ", mhcnuggets_options$ba_models, "\n",
      "output: ", mhcnuggets_output_filename, "\n"
    )
  }
  testthat::expect_true(reticulate::py_module_available("mhcnuggets"))
  module <- reticulate::import(
    module = "mhcnuggets"
  )
  module <- reticulate::import_from_path(
    module = "mhcnuggets"
  )
  mhcnuggets_path <- normalizePath(
    file.path(
      get_default_mhcnuggets_folder(
        mhcnuggetsr_folder = mhcnuggets_options$mhcnuggetsr_folder)
    )
  )
  module <- reticulate::import_from_path(
    module = "mhcnuggets",
    path = mhcnuggets_path
  )
  module <- reticulate::import_from_path(
    module = "mhcnuggets",
    path = normalizePath(file.path(mhcnuggets_path, "mhcnuggets"))
  )
  module <- reticulate::import_from_path(
    module = "mhcnuggets",
    path = normalizePath(file.path(mhcnuggets_path, "mhcnuggets", "mhcnuggets"))
  )

  if (verbose) {
    module$src$predict$predict(
      class_ = mhcnuggets_options$mhc_class,
      peptides_path = peptides_path,
      mhc = mhcnuggets_options$mhc,
      ba_models = mhcnuggets_options$ba_models,
      output = mhcnuggets_output_filename
    )
  } else {
    suppressWarnings(
      suppressMessages(
        module$src$predict$predict(
          class_ = mhcnuggets_options$mhc_class,
          peptides_path = peptides_path,
          mhc = mhcnuggets_options$mhc,
          ba_models = mhcnuggets_options$ba_models,
          output = mhcnuggets_output_filename
        )
      )
    )
  }
  testthat::expect_true(file.exists(peptides_path))

  df <- tibble::as_tibble(utils::read.csv(mhcnuggets_output_filename))
  df$peptide <- as.character(df$peptide)

  file.remove(mhcnuggets_output_filename)

  testthat::expect_true(file.exists(peptides_path))

  df
}
