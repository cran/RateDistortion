\name{MutualInformation}
\alias{MutualInformation}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Compute the mutual information for a given channel and source distribution.
}
\description{
  This function computes the mutual information (in bits) for a given
  channel. It optimally computes this over a source distribution given
  by its second argument. This can be used to compute the information
  rate for a channel that is optimized for one source distribution, but
  used to communicate values drawn from a different distribution.
}
\usage{
MutualInformation(Q, px = NA)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Q}{
    An information channel, as returned  by \code{BlahutAlgorithm},
    \code{FindOptimalChannel}, or \code{FindRate}.
}
  \item{px}{
    Optional. If specified, this should be a vector of probabilities
    that sums to 1. The length of the vector should equal the number of
    symbols in the source alphabet.
}
}
\details{
  This algorithm works by direct implementation of the
  equation for mutual information. It can run slowly for channels with
  large source or destination alphabets.
}
\value{
  A single numeric value, corresponding to the information rate (in
  bits) for the channel and given source distribution.
}
\author{
  Chris R. Sims
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
  \code{\link{BlahutAlgorithm}}, \code{\link{FindOptimalChannel}}, \code{\link{FindRate}}
}
\examples{
# Define a discretized Gaussian information source
x <- seq(from = -10, to = 10, length.out = 100)
Px <- dnorm(x, mean = 0, sd = 3)
Px <- Px / sum(Px) # Ensure that probability sums to 1
y <- x # The destination alphabet is the same as the source

# Define a quadratic cost function
cost.function <- function(x, y) {
    (y - x)^2
}

# Slope of the rate-distortion curve
s <- -1

# Compute the rate-distortion value at the given point s
channel <- BlahutAlgorithm(x, Px, y, cost.function, s)

# Compute the information rate for this channel assuming a different (uniform) source distribution
uniform.dist <- rep(1 / 100, 100)
MutualInformation(channel, uniform.dist)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.

