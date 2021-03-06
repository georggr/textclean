% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/drop_row.R
\name{drop_row}
\alias{drop_row}
\alias{keep_row}
\alias{drop_empty_row}
\alias{drop_NA}
\title{Filter Rows That Contain Markers}
\usage{
drop_row(dataframe, column, terms, ...)

keep_row(dataframe, column, terms, ...)

drop_empty_row(dataframe)

drop_NA(dataframe, column = TRUE, ...)
}
\arguments{
\item{dataframe}{A dataframe object.}

\item{column}{Column name to search for markers/terms.}

\item{terms}{The regex terms/markers of the rows that are to be removed from 
the dataframe.}

\item{\ldots}{Other arguments passed to \code{\link[base]{grepl}}.}
}
\value{
\code{drop_row} - returns a dataframe with the termed/markered rows 
removed.

\code{drop_empty_row} - returns a dataframe with empty rows removed.

\code{drop_NA} - returns a dataframe with \code{NA} rows removed.
}
\description{
\code{drop_row} - Remove rows from a data set that contain a given marker/term.

\code{keep_row} - Keep rows from a data set that contain a given marker/term.

\code{drop_empty_row} - Removes the empty rows of a data set that are common in 
reading in data.

\code{drop_NA} - Removes the \code{NA} rows of a data set.
}
\examples{
\dontrun{
## drop_row EXAMPLE:
drop_row(DATA, "person", c("sam", "greg"))
keep_row(DATA, "person", c("sam", "greg"))
drop_row(DATA, 1, c("sam", "greg"))
drop_row(DATA, "state", c("Comp"))
drop_row(DATA, "state", c("I "))
drop_row(DATA, "state", c("you"), ignore.case=TRUE)

## drop_empty_row EXAMPLE:
(dat <- rbind.data.frame(DATA[, c(1, 4)], matrix(rep(" ", 4), 
   ncol =2, dimnames=list(12:13, colnames(DATA)[c(1, 4)]))))
drop_empty_row(dat)

## drop_NA EXAMPLE:
DATA[1:3, "state"] <- NA
drop_NA(DATA)
}
}
