\name{ConditionalDistribution}
\alias{ConditionalDistribution}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Return the conditional output distribution for a given channel and a given input.
}
\description{
  For a given channel and a given input, specified either as a value or
  an index, this function returns a list of two values, the output
  alphabet, and the conditional probability distribution over that
  alphabet.
}
\usage{
ConditionalDistribution(channel, index = NA, x = NA)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{channel}{
    An information channel, as returned  by BlahutAlgorithm,
    FindOptimalChannel, or FindRate.
}
  \item{index}{
    The input to the channel, defined as an index into the input alphabet.
}
  \item{x}{
    If an index is not specified, then the channel input may be
    specified as a value from its alphabet. This is slower than
    specifying an index.
}
}

\value{
  This function returns a list of two values:
  \item{y}{The output alphabet for the channel}
  \item{p}{The conditional probability distribution over this output,
  for the specified input. This is a vector of probabilities that will
  sum to 1.}
}
\references{
  Blahut, R. E. (1972). Computation of channel capacity and rate-distortion functions. IEEE Transactions on Information Theory, 18(4):460--473.
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

# Compute & plot the conditional probability distribution for a particular channel input.
cpd <- ConditionalDistribution(channel, index = 50)
plot(cpd$y, cpd$p)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.

