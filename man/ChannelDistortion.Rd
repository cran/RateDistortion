\name{ChannelDistortion}
\alias{ChannelDistortion}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Compute the channel distortion for a given channel and cost function.
}
\description{
  This function computes the expected cost for a given channel (as
  produced by the function BlahutAlgorithm) and specified cost function
  given by rho.fn.
}
\usage{
ChannelDistortion(channel, rho.fn, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{channel}{
    An information channel, as returned  by BlahutAlgorithm,
    FindOptimalChannel, or FindRate.
}
  \item{rho.fn}{
    A cost function used to evaluate the channel distortion. This
    function should be defined over the input and output alphabet for
    the channel, and the function should accept vectorized arguments.
}
  \item{\dots}{
    Optional arguments that are passed to the cost function.
}
}
\value{
  This function returns the distortion for the channel, i.e., a single
  numeric (non-negative) value.
}
\references{
  Blahut, R. E. (1972). Computation of channel capacity and rate-distortion functions. IEEE Transactions on Information Theory, 18(4):460--473.
}
\author{
Chris R. Sims
}

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

# Compute the channel distortion according to a different cost function
abs.cost.function <- function(x, y) {
   abs(y - x)
}

ChannelDistortion(channel, abs.cost.function)

}

