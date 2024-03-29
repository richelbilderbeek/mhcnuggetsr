% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_mhc.R
\name{check_mhc}
\alias{check_mhc}
\title{Check if \code{mhc} is a valud MHCnuggets name}
\usage{
check_mhc(mhc)
}
\arguments{
\item{mhc}{the MHC haplotype name}
}
\description{
Check if \code{mhc} is a valud MHCnuggets name
}
\examples{
# MHCnuggets uses names without the asterisk
check_mhc("HLA-A01:01")

# The official name is not the name format used by MHCnuggets
# check_mhc("HLA-A*01:01")
}
\author{
Richèl J.C. Bilderbeek
}
