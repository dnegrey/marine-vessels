server <- shinyServer(function(input, output, session) {
    # change available ship names based on type selected
    observeEvent(
        eventExpr = input$`shipType-vesselDropdown`,
        handlerExpr = {
            update_dropdown_input(
                session = session,
                input_id = "shipName-vesselDropdown",
                choices = main$shipTypeName[[input$`shipType-vesselDropdown`]]$ShipName
            )
        }
    )
    # get ship selected based on type and name
    shipSelected <- eventReactive(
        eventExpr = c(
            input$`shipType-vesselDropdown`,
            input$`shipName-vesselDropdown`
        ),
        valueExpr = shipSelectedShipFetch(
            ship_type = input$`shipType-vesselDropdown`,
            ship_name = input$`shipName-vesselDropdown`
        )
    )
    # reactive text - ship name
    output$shipSelectedName <- renderText(
        input$`shipName-vesselDropdown`
    )
    # reactive text - ship type
    output$shipSelectedType <- renderText(
        paste(input$`shipType-vesselDropdown`, "vessel")
    )
    # reactive text - note regarding ship distance
    output$shipSelectedNote <- renderText(
        shipSelectedNoteCreate(shipSelected())
    )
    # dynamic map based on ship selected
    output$shipSelectedMap <- renderLeaflet({
        shipSelectedMapCreate(shipSelected())
    })
})
