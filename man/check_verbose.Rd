% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_verbose.R
\name{check_verbose}
\alias{check_verbose}
\title{Check the \code{verbose}}
\usage{
check_verbose(verbose)
}
\arguments{
\item{verbose}{set to \link{TRUE} for more debug information}
}
\value{
Nothing.
}
\description{
Check the \code{verbose}
Will \link{stop} if it is invalid.
}
\examples{
check_verbose(TRUE)
check_verbose(FALSE)
}
\author{
Richèl J.C. Bilderbeek
}
