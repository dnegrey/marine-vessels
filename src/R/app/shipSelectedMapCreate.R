shipSelectedMapCreate <- function(x) {
    y <- leaflet(data = x) %>%
        addProviderTiles("CartoDB.Positron") %>%
        addCircleMarkers(
            lng = ~Lon,
            lat = ~Lat,
            color = "#FF0000"
        ) %>%
        addMarkers(
            lng = ~Lon,
            lat = ~Lat,
            popup = ~paste(
                sprintf("Vessel name: <b>%s</b>", ShipName),
                sprintf("Vessel type: <b>%s</b>", ShipType),
                sprintf("Longitude: <b>%s</b>", Lon),
                sprintf("Latitude: <b>%s</b>", Lat),
                sprintf("Port: <b>%s</b>", Port),
                sprintf("Datetime: <b>%s</b>", Datetime),
                sprintf("Time since last observation (seconds): <b>%s</b>", format(TimeSinceLast_Seconds, big.mark = ",")),
                sprintf("Distance since last observation (meters): <b>%s</b>", format(round(DistSinceLast_Meters), big.mark = ",")),
                sep = "<br>"
            )
        )
    # some ships had only one total observation and therefore have only 1 point
    # conditionally avoid these for displaying the previous point (avoid warnings)
    if (!is.na(x$DistSinceLast_Meters)) {
        y <- y %>%
            addCircleMarkers(
                lng = ~PreviousLon,
                lat = ~PreviousLat,
                color = "#000000"
            ) %>%
            addMarkers(
                lng = ~PreviousLon,
                lat = ~PreviousLat,
                popup = ~paste(
                    sprintf("Vessel name: <b>%s</b>", ShipName),
                    sprintf("Vessel type: <b>%s</b>", ShipType),
                    sprintf("Longitude: <b>%s</b>", PreviousLon),
                    sprintf("Latitude: <b>%s</b>", PreviousLat),
                    sprintf("Port: <b>%s</b>", PreviousPort),
                    sprintf("Datetime: <b>%s</b>", PreviousDatetime),
                    sep = "<br>"
                )
            )
    }
    # resume and add legend
    y <- y %>%
        addLegend(
            position = "bottomright",
            title = "Location Type",
            colors = c("#000000", "#FF0000"),
            labels = c("Origin", "Destination")
        )
    return(y)
}
