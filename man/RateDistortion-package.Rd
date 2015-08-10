\name{RateDistortion-package}
\alias{RateDistortion-package}
\alias{RateDistortion}
\docType{package}
\title{
  Routines for Solving Rate-Distortion Problems
}
\description{
  An implementation of routines for solving rate-distortion problems.
  Rate-distortion theory is a field within information theory that
  examines optimal lossy compression. That is, given that some
  information must be lost, how can a communication channel be designed
  that minimizes the cost of communication error? Rate-distortion
  theory is concerned with the optimal  (minimal cost) solution to such
  tradeoffs. An important tool for solving rate-distortion problems is
  the Blahut algorithm, developed by Richard Blahut and described in:
  
  Blahut, R. E. (1972). Computation of channel capacity and
  rate-distortion functions. IEEE Transactions on Information Theory,
  IT-18(4), 460-473.
  
  This package implements the basic Blahut algorithm, and additionally contains a number of `helper' functions, including a routine for searching for an information channel that minimizes cost subject to a constraint on information rate.
}
\details{
\tabular{ll}{
Package: \tab RateDistortion\cr
Type: \tab Package\cr
Version: \tab 1.01\cr
Date: \tab 2015-08-08\cr
License: \tab GPL-2\cr
}

This package is used by defining an information source and cost
function, and searching for optimal (but constrained) channels for
communicating values from this source. Constraints can be placed on the
maximum allowable information rate or the minimum allowable distortion.

See the documentation for the functions \code{BlahutAlgorithm},
\code{FindOptimalChannel}, and \code{FindRate} for examples.

}
\author{
Chris R. Sims

Maintainer: Chris R. Sims <chris.sims@drexel.edu>
}
\references{
  Blahut, R. E. (1972). Computation of channel capacity and rate-distortion functions. IEEE Transactions on Information Theory, IT-18(4), 460-473.
}
\keyword{ package }
