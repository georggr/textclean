#' Multiple \code{\link[base]{gsub}}
#' 
#' \code{mgsub} - A wrapper for \code{\link[base]{gsub}} that takes a vector 
#' of search terms and a vector or single value of replacements.
#' 
#' @param x A character vector.
#' @param pattern Character string to be matched in the given character vector. 
#' @param replacement Character string equal in length to pattern or of length 
#' one which are  a replacement for matched pattern. 
#' @param leadspace logical.  If \code{TRUE} inserts a leading space in the 
#' replacements.
#' @param trailspace logical.  If \code{TRUE} inserts a trailing space in the 
#' replacements.
#' @param fixed logical. If \code{TRUE}, pattern is a string to be matched as is. 
#' Overrides all conflicting arguments.
#' @param trim logical.  If \code{TRUE} leading and trailing white spaces are 
#' removed and multiple white spaces are reduced to a single white space.
#' @param order.pattern logical.  If \code{TRUE} and \code{fixed = TRUE}, the 
#' \code{pattern} string is sorted by number of characters to prevent substrings 
#' replacing meta strings (e.g., \code{pattern = c("the", "then")} resorts to 
#' search for "then" first).
#' @param \dots Additional arguments passed to \code{\link[base]{gsub}}.
#' @return \code{mgsub} - Returns a vector with the pattern replaced.
#' @seealso \code{\link[textclean]{replace_tokens}}
#' \code{\link[base]{gsub}}
#' @export
#' @rdname mgsub
#' @examples
#' mgsub(DATA$state, c("it's", "I'm"), c("it is", "I am"))
#' mgsub(DATA$state, "[[:punct:]]", "PUNC", fixed = FALSE)
mgsub <- function (x, pattern, replacement, leadspace = FALSE, 
    trailspace = FALSE, fixed = TRUE, trim = FALSE, order.pattern = fixed, 
    ...) {

    if (leadspace | trailspace) replacement <- spaste(replacement, trailing = trailspace, leading = leadspace)

    if (fixed && order.pattern) {
        ord <- rev(order(nchar(pattern)))
        pattern <- pattern[ord]
        if (length(replacement) != 1) replacement <- replacement[ord]
    }
    if (length(replacement) == 1) replacement <- rep(replacement, length(pattern))
    if (any(!nzchar(pattern))) {
        good_apples <- which(nzchar(pattern))  
        pattern <- pattern[good_apples]
        replacement <- replacement[good_apples]      
        warning('Empty pattern found (i.e., `pattern = ""`).\nThis pattern and replacement have been removed.')
    }
    for (i in seq_along(pattern)){
        x <- gsub(pattern[i], replacement[i], x, fixed = fixed, ...)
    }

    if (trim) x <- gsub("\\s+", " ", gsub("^\\s+|\\s+$", "", x, perl=TRUE), perl=TRUE)
    x
}

#' Multiple \code{\link[base]{gsub}}
#' 
#' \code{mgsub_fixed} - An alias for \code{mgsub}.
#' 
#' @export
#' @rdname mgsub
mgsub_fixed <- mgsub 

#' Multiple \code{\link[base]{gsub}}
#' 
#' \code{mgsub_regex} - An wrapper for \code{mgsub} with \code{fixed = FALSE}.
#' 
#' @export
#' @rdname mgsub
mgsub_regex <- function (x, pattern, replacement, leadspace = FALSE, 
    trailspace = FALSE, fixed = FALSE, trim = FALSE, order.pattern = fixed, 
    ...) {
    
    mgsub(x = x, pattern = pattern, replacement = replacement, leadspace = leadspace, 
        trailspace = trailspace, fixed = fixed, trim = trim, order.pattern = order.pattern, 
        ...
    )
    
}
    
    
spaste <-
function (terms, trailing = TRUE, leading = TRUE) {
    if (leading) {
        s1 <- " "
    }     else {
        s1 <- ""
    }
    if (trailing) {
        s2 <- " "
    } else {
        s2 <- ""
    }
    pas <- function(x) paste0(s1, x, s2)
    if (is.list(terms)) {
        z <- lapply(terms, pas)
    } else {
        z <- pas(terms)
    }
    return(z)
}


