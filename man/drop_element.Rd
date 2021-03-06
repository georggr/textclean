% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/drop_element.R
\name{drop_element}
\alias{drop_element}
\alias{keep_element}
\title{Filter Elements in a Vetor}
\usage{
drop_element(x, pattern, ...)

keep_element(x, pattern, ...)
}
\arguments{
\item{x}{A character vector.}

\item{pattern}{A regex pattern to match for exclusion.}

\item{\ldots}{Other arguments passed to \code{\link[base]{grep}}.}
}
\value{
Returns a vector with matching elements removed.
}
\description{
\code{drop_element} - Filter to drop the matching elements of a vector.

\code{keep_element} - Filter to keep the matching elements of a vector.
}
\examples{
x <- c('dog', 'cat', 'bat', 'dingo', 'dragon', 'dino')
drop_element(x, '^d.+?g')
keep_element(x, '^d.+?g')
drop_element(x, 'at$')
drop_element(x, '^d')
drop_element(x, '\\\\b(dog|cat)\\\\b')
}
