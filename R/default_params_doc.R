#' This function does nothing. It is intended to inherit the documentation
#' of the parameters from.
#' @param ba_models Set to TRUE to use a pure BA model
#' @param folder_name superfolder of MHCnuggets.
#'   The name of the superfolder is \code{/home/[user_name]/.local/share}
#'   by default, as can be obtained by\link{get_default_mhcnuggets_folder}
#' @param mhc the MHC haplotype name
#' @param mhcs the MHC haplotype names
#' @param mhc_class MHC class. Must be \code{I}, \code{II}
#'   or \link{NA}. Use \link{NA} to let the class be deduced automatically
#' @param mhcnuggets_options options to run MHCnuggets with,
#'   as can be created by \link{create_mhcnuggets_options}.
#' @param mhcnuggets_url URL to the MHCnuggets GitHub repository
#' @param n_aas number of amino acids
#' @param peptide_length length of a peptide, in number of amino acids
#' @param peptide one peptide sequence
#' @param peptides one of more peptide sequences
#' @param peptides_path the path to the peptides
#' @param protein_sequence protein sequence, in uppercase,
#'   for example \code{FAMILYVW}
#' @param verbose set to \link{TRUE} for more debug information
#' @author Richèl J.C. Bilderbeek
#' @note This is an internal function, so it should be marked with
#'   \code{@noRd}. This is not done, as this will disallow all
#'   functions to find the documentation parameters
default_params_doc <- function(
  ba_models,
  folder_name,
  mhc, mhcs,
  mhc_class,
  mhcnuggets_options,
  mhcnuggets_url,
  n_aas,
  peptide, peptides,
  peptide_length,
  peptides_path,
  protein_sequence,
  verbose
) {
  # Nothing
}
