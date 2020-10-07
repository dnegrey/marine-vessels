shipSelectedNoteCreate <- function(x) {
    # call out certain keywords using a class and css
    xcc <- "<span class='ship-selected-note-keyword'>%s</span>"
    # note will vary based on whether ship had multiple observations
    if (!is.na(x$DistSinceLast_Meters)) {
        # standard (most ships)
        xt <- paste0(
            "Farthest recorded distance on %s. ",
            "It sailed %s from its previous location on %s."
        )
        y <- sprintf(
            fmt = xt,
            format(x$Datetime, "%d %B %Y @ %T"),
            sprintf(xcc, paste0(format(round(x$DistSinceLast_Meters), big.mark = ","), "m")),
            format(x$PreviousDatetime, "%d %B %Y @ %T")
        )
    } else {
        # exception (few ships)
        xt <- paste0(
            "Had only observation on %s. ",
            "Distance between observations is not applicable."
        )
        y <- sprintf(
            fmt = xt,
            format(x$Datetime, "%d %B %Y @ %T")
        )
    }
    return(y)
}
