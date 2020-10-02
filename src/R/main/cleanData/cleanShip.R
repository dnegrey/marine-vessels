cleanShip <- function(x) {
    # keep necessary fields and clean up names
    y <- x %>%
        select(
            ShipsRecordId,
            ShipType = ship_type,
            ShipTypeId = SHIPTYPE,
            ShipName = SHIPNAME,
            ShipId = SHIP_ID,
            ShipLength = LENGTH,
            ShipWidth = WIDTH,
            Deadweight = DWT,
            Datetime = DATETIME,
            Lat = LAT,
            Lon = LON,
            Speed = SPEED,
        )
    return(y)
}
