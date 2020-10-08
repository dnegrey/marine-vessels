shipSelectedShipFetch <- function(input, main, namespace = "vesselDropdown") {
    idt <- NS("shipType")(namespace)
    idn <- NS("shipName")(namespace)
    eventReactive(
        eventExpr = c(input[[idt]], input[[idn]]),
        valueExpr = {
            st <- input[[idt]]
            sn <- input[[idn]]
            validate(
                need(
                    expr = st != "" & sn != "",
                    message = "Please select a vessel type and name."
                )
            )
            x <- main$shipMaxDist %>%
                filter(
                    ShipType == st,
                    ShipName == sn
                )
            validate(
                need(
                    expr = nrow(x) == 1,
                    message = "Selection updating, please wait a moment."
                )
            )
            return(x)
        }
    )
}
