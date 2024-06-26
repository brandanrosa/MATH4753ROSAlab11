% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ciNonSym.R
\name{ciNonSym}
\alias{ciNonSym}
\title{ciNonSym}
\usage{
ciNonSym(x, alpha, alpha2, mu0, epsilon, bins)
}
\arguments{
\item{x}{numeric vector}

\item{alpha}{alpha level}

\item{alpha2}{noncentral cut value 2}

\item{mu0}{estimated mu}

\item{epsilon}{a value for the ball}

\item{bins}{number of bins for the histogram}
}
\value{
a histogram plot and list
}
\description{
A function which produces a histogram and output list.
}
\examples{
\dontrun{ciNonSym(x=cats$LENGTH,alpha=0.05,alpha2=0.02,mu0=45,epsilon=4,bins=25))}
}
