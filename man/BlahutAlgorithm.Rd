\name{BlahutAlgorithm}
\alias{BlahutAlgorithm}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Implementation of the Blahut algorithm described in (Blahut, 1972).
}
\description{
  This function takes an information source, destination alphabet, and
  cost function, and computes an optimal channel for this source at a
  given point along the corresponding rate--distortion curve.
}
\usage{
BlahutAlgorithm(x, px, y, rho.fn, s,
    eps = 0.001, max.iters = Inf, rho.scale = 1, ...)
}
\arguments{
  \item{x}{
    The input or source alphabet for the channel. Either a vector or a
    matrix. For a vector, each element corresponds
    to one symbol in the input alphabet. For a matrix, each row
    corresponds to one symbol.
}
  \item{px}{
    A vector of probabilities over the source alphabet. This vector
    should sum to 1. The length of the vector should equal the number of
    rows in x in the case that x is a matrix.
}
  \item{y}{
    The output alphabet for the channel. This can either be a vector or
    a matrix.
}
  \item{rho.fn}{
    The cost function for the channel, defining rho.fn(x, y) over the
    domain of x and y. This function should accept vectorized arguments.
}
  \item{s}{
    A point along the rate-distortion curve for the channel, equal to
    the slope of the curve at which to compute the rate and distortion
    (see Blahut, 1972 for complete details).
}
  \item{eps}{
    Convergence parameter for the Blahut algorithm. 
}
  \item{max.iters}{
    Maximum number of iterations for the Blahut algorithm.
}
  \item{rho.scale}{
    An optional scaling parameter for the cost function. If set, the
    cost used in the algorithm is rho.scale * rho.fn(x, y). This can be
    useful for avoiding numerical overflow or underflow for badly scaled
    cost functions.
}
  \item{\dots}{
    Optional arguments that are passed to the cost function.
}
}
\value{
  This function returns an object of the class channel. This
  object contains the elements:
  \item{R}{The information rate (in bits) for the channel at the point s
    along the rate--distortion curve.}
  \item{D}{The distortion for the channel at the point s, based on the
    cost function given by rho.fn.}
  The remaining elements of the class summarize and record the input arguments to
  the function BlahutAlgorithm.
}
\references{
  Blahut, R. E. (1972). Computation of channel capacity and rate-distortion functions. IEEE Transactions on Information Theory, 18(4):460--473.
}
\author{
Chris R. Sims
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
  \code{\link{FindOptimalChannel}}, \code{\link{FindRate}}
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

# A different cost function with additional named input arguments
cost.function.2 <- function(x, y, alpha = 1.0) {
    abs(y - x) ^ alpha
}

# Slope of the rate-distortion curve
s <- -1

# Compute the rate-distortion value at the given point s
channel <- BlahutAlgorithm(x, Px, y, cost.function, s)

# Not run:
# channel.2 <- BlahutAlgorithm(x, Px, y, cost.function.2, s, alpha = 1.5)

print(channel)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.

