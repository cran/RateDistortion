\name{DifferenceDistribution}
\alias{DifferenceDistribution}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Compute the difference distribution for a given channel. 
}
\description{
  This function computes the probability distribution over the quantity
  y - x, where x is the channel input and y is the channel output. Note
  that this function is only meaningful where the difference operator
  can meaningfully be applied to x and y. In addition, it is only
  implemented for univariate probability distributions; that is,
  channels where both the input and output alphabet are described by
  a vector.
}
\usage{
DifferenceDistribution(channel)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{channel}{
    An information channel, as computed by BlahutAlgorithm or FindOptimalChannel.
}
}
\value{
  A list with two elements:
  \item{diff}{The vector of difference elements z = y - x}
  \item{p}{The probability distribution over the vector diff.}
}
\author{
  Chris R. Sims
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

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

# Compute & plot the channel difference (or error) distribution
diff.distribution <- DifferenceDistribution(channel)
plot(diff.distribution$diff, diff.distribution$p)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.

