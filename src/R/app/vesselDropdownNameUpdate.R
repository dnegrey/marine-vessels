vesselDropdownNameUpdate <- function(input, session, main,
                                     namespace = "vesselDropdown") {
    idt <- NS("shipType")(namespace)
    idn <- NS("shipName")(namespace)
    observeEvent(
        eventExpr = input[[idt]],
        handlerExpr = {
            xt <- input[[idt]]
            update_dropdown_input(
                session = session,
                input_id = idn,
                choices = main$shipTypeName[[xt]]$ShipName
            )
        }
    )
}
