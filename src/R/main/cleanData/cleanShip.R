cleanShip <- function(x) {
    # keep necessary fields and clean up names
    # fix some misspellings with port (use as labels later)
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
            Port = port,
            Datetime = DATETIME,
            Lat = LAT,
            Lon = LON,
            Speed = SPEED
        ) %>%
        mutate(
            Port = ifelse(
                Port == "gothenborg", "Gothenburg",
                ifelse(
                    Port == "Kalingrad", "Kaliningrad",
                    ifelse(
                        Port == "Klaipeda", "Klaipėda",
                        Port
                    )
                )
            )
        )
    return(y)
}
