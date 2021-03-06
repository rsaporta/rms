% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stanMisc.r
\name{coef.rmsb}
\alias{coef.rmsb}
\title{coef.rmsb}
\usage{
\method{coef}{rmsb}(object, stat = c("mean", "median", "mode"), ...)
}
\arguments{
\item{object}{an object created by an \code{rms} package Bayesian fitting function}

\item{stat}{name of measure of posterior distribution central tendency to compute}

\item{...}{ignored}
}
\value{
a vector of intercepts and regresion coefficients
}
\description{
Extract Bayesian Summary of Coefficients
}
\details{
Computes either the posterior mean (default), posterior median, or posterior mode of the parameters in an \code{rms} Bayesian regression model
}
\examples{
\dontrun{
  f <- blrm(...)
  coef(f, stat='mode')
}
}
\author{
Frank Harrell
}
