\name{Sample}
\alias{Sample}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Generate random samples from a channel distribution.
}
\description{
  For a given information channel and input, draw random samples of the
  conditional probability distribution over the channel output.
}
\usage{
Sample(channel, n, index, show.progress = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{channel}{
    An information channel, as returned by \code{BlahutAlgorithm},
    \code{FindOptimalChannel}, or  \code{FindRate}.
  }
  \item{n}{
    The number of random samples to generate.
}
  \item{index}{
    The channel input, specified as its index in the source alphabet.
}
  \item{show.progress}{
    Logical value. Show a progress bar during sampling?
}
}
\value{
  A list with two elements:
  \item{x}{A matrix with n rows containing the channel input.}
  \item{y}{A matrix containing random samples of the channel output for
    the given index.} 
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

# Draw random samples from the output of this channel, for a given input
samples <- Sample(channel, 1000, 50, show.progress = TRUE)

# Plot a histogram of the output
hist(samples$y)

}


