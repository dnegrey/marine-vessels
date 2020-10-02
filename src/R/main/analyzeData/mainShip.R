mainShip <- function(xcs, xstn) {
    # append ship type name id for easier splitting
    x <- xcs %>%
        inner_join(xstn, c("ShipType", "ShipName"))
    # split by ship and calculate distance sailed between obs
    xl <- lapply(
        X = split(x, x$ShipTypeNameId),
        FUN = shipDistanceSailed
    )
    # recombine
    y <- do.call(rbind, xl)
    row.names(y) <- NULL
    return(y)
}
