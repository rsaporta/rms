% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stanMisc.r
\name{fitSave}
\alias{fitSave}
\title{fitSave}
\usage{
fitSave(fit, name = as.character(substitute(fit)))
}
\arguments{
\item{fit}{fit object whose unquoted name becomes the base name of the \code{.rds} file}

\item{name}{suffix of file name to use if not the name of the first argument passed to \code{fitSave}}
}
\description{
Save Compact Version of rms Bayesian Fit
}
\details{
Removes the \code{rstan} part a fit object and writes the fit object to the current working directory, with a \code{.rds} suffix, using \code{saveRDS}.
}
\author{
Frank Harrell
}
