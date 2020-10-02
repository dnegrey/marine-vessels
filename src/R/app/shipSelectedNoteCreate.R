shipSelectedNoteCreate <- function(x) {
    # call out certain keywords using a class and css
    xcc <- "<span class='ship-selected-note-keyword'>%s</span>"
    # note will vary based on whether ship had multiple observations
    if (!is.na(x$DistSinceLast_Meters)) {
        # standard (most ships)
        xt <- paste0(
            "The %s vessel you selected, %s, had its ",
            "farthest recorded distance between two consecutive observations ",
            "on %s. It sailed %s from its previous observation on %s."
        )
        y <- sprintf(
            fmt = xt,
            sprintf(xcc, x$ShipType),
            sprintf(xcc, x$ShipName),
            sprintf(xcc, format(x$Datetime, "%d %B %Y @ %T")),
            sprintf(xcc, paste0(format(round(x$DistSinceLast_Meters), big.mark = ","), "m")),
            sprintf(xcc, format(x$PreviousDatetime, "%d %B %Y @ %T"))
        )
    } else {
        # exception (few ships)
        xt <- paste0(
            "The %s vessel you selected, %s, had its ",
            "only observation ",
            "on %s. Therefore, it has no recorded distance between two ",
            "consecutive observations."
        )
        y <- sprintf(
            fmt = xt,
            sprintf(xcc, x$ShipType),
            sprintf(xcc, x$ShipName),
            sprintf(xcc, format(x$Datetime, "%d %B %Y @ %T"))
        )
    }
    return(y)
}
