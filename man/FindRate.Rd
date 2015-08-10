\name{FindRate}
\alias{FindRate}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Search for a channel that achieves a given level of distortion.
}
\description{
  This function will search for the channel that has the minimum information
  rate (in bits) necessary to achieve the level of performance (distortion) given
  by the input argument D.
}
\usage{
FindRate(x, px, y, rho.fn, D,
    tol = 1e-05, eps = 0.001, max.iters = Inf,
    slope.range = c(-100, 0), search.bracket = TRUE,
    max.search.steps = 10,
    rho.scale = TRUE,
    verbose = FALSE, ...)
}
%- maybe also 'usage' for other objects documented here.
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
  \item{D}{
    The distortion level, for which the goal is to find the minimum
    necessary information rate necessary to achieve this level of distortion.
}
  \item{tol}{
    The desired accuracy (convergence tolerance) for searching along the
    rate-distortion curve. This argument is passed to \code{\link{uniroot}}.
}
  \item{eps}{
    Convergence parameter for the Blahut algorithm.
}
  \item{max.iters}{
    Maximum number of iterations for each call to the Blahut algorithm.
}
  \item{slope.range}{
    A vector of the form c(lower, upper) containing the range of slope
    values along the rate-distortion curve to search for the optimal channel.
}
  \item{search.bracket}{
    A logical value. If an optimal channel meeting the constraints
    cannot be found in the initial search bracket, should the bracket be
    extended to find a bracketing interval?
}
  \item{max.search.steps}{
        If \code{search.bracket} is TRUE, the maximum number of times the bracket
    should be extended before giving up.
}
  \item{rho.scale}{
    An optional scaling parameter for the cost function. If set, the
    cost used in the algorithm is rho.scale * rho.fn(x, y). This can be
    useful for avoiding numerical overflow or underflow for badly scaled
    cost functions.
}
  \item{verbose}{
    A logical value indicating whether diagnostic information should be
    displayed to the console during the algorithm.
}
  \item{\dots}{
    Optional arguments that are passed to the cost function.
}
}
\details{
  This function is based on using uniroot() to identify a point along
  the rate-distortion curve satisfying the specified constraints. It is
  essentially an outer-loop optimization routine over the function BlahutAlgorithm.
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
\note{
  The channel returned by this function can be used to compute a
  conditional probability distribution via
  \code{\link{ConditionalDistribution}}, or to generate random samples
  from the distribution for a given channel input via
  \code{\link{Sample}}.
}

\seealso{
  \code{\link{BlahutAlgorithm}}, \code{\link{ConditionalDistribution}}, \code{\link{Sample}}
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

D <- 1.0
Q <- FindRate(x, Px, y, cost.function, D, verbose = TRUE)
print(Q)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.

