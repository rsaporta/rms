% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stanMisc.r
\name{PostF}
\alias{PostF}
\title{PostF}
\usage{
PostF(fit, name = c("short", "orig"), pr = FALSE)
}
\arguments{
\item{fit}{a Bayesian fit or \code{contrast.rms} object}

\item{name}{specifies whether assertions will refer to shortened parameter names (the default) or original names.  Shorted names are of the form \code{a1, ..., ak} where \code{k} is the number of intercepts in the model, and \code{b1, ..., bp} where \code{p} is the number of non-intercepts.  When using original names that are not legal R variable names, you must enclose them in backticks.  For \code{contrast} objects, \code{name} is ignored and you must use contrast names.  The \code{cnames} argument to \code{contrast.rms} is handy for assigning your own names.}

\item{pr}{set to \code{TRUE} to have a table of short names and original names printed when \code{name='short'}.  For \code{contrasts} the contrast names are printed if \code{pr=TRUE}.}
}
\value{
an R function
}
\description{
Function Generator for Posterior Probabilities of Assertions
}
\details{
From a Bayesian fit object such as that from \code{blrm} generates an R function for evaluating the probability that an assertion is true.  The probability, within simulation error, is the proportion of times the assertion is true over the posterior draws.  If the assertion does not evaluate to a logical or 0/1 quantity, it is taken as a continuous derived parameter and the vector of draws for that parameter is returned and can be passed to the \code{PostF} plot method.  \code{PostF} can also be used on objects created by \code{contrast.rms}
}
\examples{
\dontrun{
  f <- blrm(y ~ age + sex)
  P <- PostF(f)
  P(b2 > 0)     # Model is a1 + b1*age + b2*(sex == 'male')
  P(b1 < 0 & b2 > 0)   # Post prob of a compound assertion
  # To compute probabilities using original parameter names:
  P <- PostF(f, name='orig')
  P(age < 0)    # Post prob of negative age effect
  P(`sex=male` > 0)
  f <- blrm(y ~ sex + pol(age, 2))
  P <- PostF(f)
  # Compute and plot posterior density of the vertex of the
  # quadratic age effect
  plot(P(-b2 / (2 * b3)))

  # The following would be useful in age and sex interacted
  k <- contrast(f, list(age=c(30, 50), sex='male'),
                   list(age=c(30, 50), sex='female'),
                cnames=c('age 30 M-F', 'age 50 M-F'))
  P <- PostF(k)
  P(`age 30 M-F` > 0 & `age 50 M-F` > 0)
##' }
}
\author{
Frank Harrell
}
