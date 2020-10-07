shipSelectedNoteCreate <- function(x) {
    # call out certain keywords using a class and css
    xcc <- "<span class='ship-selected-note-keyword'>%s</span>"
    # note will vary based on whether ship had multiple observations
    if (!is.na(x$DistSinceLast_Meters)) {
        # standard (most ships)
        xt <- "Farthest recorded distance of %s occurred between %s and %s."
        y <- sprintf(
            fmt = xt,
            sprintf(xcc, paste0(format(round(x$DistSinceLast_Meters), big.mark = ","), "m")),
            format(x$Datetime, "%d %B %Y @ %T"),
            format(x$PreviousDatetime, "%d %B %Y @ %T")
        )
    } else {
        # exception (few ships)
        xt <- "Only one observation on %s; distance calculation not applicable."
        y <- sprintf(
            fmt = xt,
            format(x$Datetime, "%d %B %Y @ %T")
        )
    }
    return(y)
}
