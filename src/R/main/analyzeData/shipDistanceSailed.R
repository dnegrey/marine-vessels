shipDistanceSailed <- function(x) {
    # this function meant to be used on data for one ship
    # arrange by datetime and lag down previous lat/lon
    y <- x %>%
        arrange(Datetime) %>%
        mutate(
            ShipTypeNameObservationId = row_number(),
            PreviousDatetime = lag(Datetime),
            PreviousLat = lag(Lat),
            PreviousLon = lag(Lon),
            TimeSinceLast_Seconds = as.integer(difftime(
                time1 = Datetime,
                time2 = PreviousDatetime,
                units = "secs"
            ))
        )
    # calculate haversine distance for each record
    y$DistSinceLast_Meters <- geodist_vec(
        x1 = y$Lon,
        y1 = y$Lat,
        x2 = y$PreviousLon,
        y2 = y$PreviousLat,
        paired = TRUE,
        measure = "haversine"
    )
    return(y)
}
