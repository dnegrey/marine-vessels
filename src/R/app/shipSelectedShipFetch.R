shipSelectedShipFetch <- function(ship_type, ship_name,
                                  ship_data = main$shipMaxDist) {
    validate(
        need(
            expr = ship_type != "" & ship_name != "",
            message = "Please select a vessel type and name."
        )
    )
    x <- ship_data %>%
        filter(
            ShipType == ship_type,
            ShipName == ship_name
        )
    validate(
        need(
            expr = nrow(x) == 1,
            message = "Selection updating, please wait a moment."
        )
    )
    return(x)
}
