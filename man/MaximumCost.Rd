\name{MaximumCost}
\alias{MaximumCost}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Compute the maximum cost for an information source and cost function.
}
\description{
  This function simply returns the maximum possible cost for a given
  cost function, over the space of the input and output alphabets. This
  function is useful for determining an appropriate scaling constant for
  the cost function.
}
\usage{
MaximumCost(x, y, rho.fn, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
    The input or source alphabet for the channel. Either a vector or a
    matrix. For a vector, each element corresponds
    to one symbol in the input alphabet. For a matrix, each row
    corresponds to one symbol.
}
  \item{y}{
    The output alphabet for the channel. This can either be a vector or
    a matrix.
}
  \item{rho.fn}{
    The cost function for the channel, defining rho.fn(x, y) over the
    domain of x and y. This function should accept vectorized arguments.
}
  \item{\dots}{
    Optional arguments that are passed to the cost function.
}
}
\details{
  When calling the routine BlahutAlgorithm, it is possible that cost
  functions with a maximum cost substantially larger than 1 may lead to
  numerical under- or over-flow issues. This can be resolved by
  normalizing the cost function so that its maximum value is one. Note
  that multiplying a cost funciton by a positive scalar does not alter
  the resulting optimal channel. This scaling constant can be passed to
  the routine BlahutAlgorithm as the argument \code{rho.scale}.
}
\value{
  The function returns a single numeric value that corresponds to the
  maximum cost over the space of the channel input and output alphabets.
}
\author{
  Chris R. Sims
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
  \code{\link{BlahutAlgorithm}}
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

MaximumCost(x, y, cost.function)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.

