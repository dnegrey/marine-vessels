analyzeData <- function(dir) {
    # calculate distance sailed, by ship, between observations
    RDataCreate(
        dir = dir,
        x = "mainShips",
        fun = mainShip,
        args = list(
            xcs = RDataUse(dir, "cleanShips"),
            xstn = RDataUse(dir, "cleanShipTypeName")
        )
    )
    # find observation with longest distance sailed
    RDataCreate(
        dir = dir,
        x = "mainShipsMaxDistance",
        fun = function(x) {
            # main logic for finding max distance/de-duping
            y <- x %>%
                filter(!is.na(DistSinceLast_Meters)) %>%
                group_by(ShipTypeNameId) %>%
                summarise(DistSinceLast_Meters = max(DistSinceLast_Meters)) %>%
                data.frame() %>%
                inner_join(x, c("ShipTypeNameId", "DistSinceLast_Meters")) %>%
                group_by(ShipTypeNameId) %>%
                summarise(ShipTypeNameObservationId = max(ShipTypeNameObservationId)) %>%
                data.frame() %>%
                inner_join(x, c("ShipTypeNameId", "ShipTypeNameObservationId"))
            y <- y[names(x)]
            # include ships that had only one obs (can exclude later)
            yo <- x %>%
                anti_join(select(y, ShipTypeNameId), "ShipTypeNameId")
            # combine
            z <- rbind(y, yo) %>%
                arrange(ShipTypeNameId)
            row.names(z) <- NULL
            stopifnot(
                nrow(z) == length(unique(z$ShipTypeNameId)),
                nrow(z) == length(unique(z$ShipsRecordId)),
                all(z$ShipTypeNameId %in% x$ShipTypeNameId)
            )
            return(z)
        },
        args = list(
            x = RDataUse(dir, "mainShips")
        )
    )
    # main data object
    RDataCreate(
        dir = dir,
        x = "main",
        fun = list,
        args = list(
            shipTypeName = {
                x = RDataUse(dir, "cleanShipTypeName")
                split(x, x$ShipType)
            },
            shipMaxDist = RDataUse(dir, "mainShipsMaxDistance")
        )
    )
}
