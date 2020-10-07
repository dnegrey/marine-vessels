server <- shinyServer(function(input, output, session) {
    # change available ship names based on type selected
    observeEvent(
        eventExpr = input$shipType,
        handlerExpr = {
            update_dropdown_input(
                session = session,
                input_id = "shipName",
                choices = main$shipTypeName[[input$shipType]]$ShipName
            )
        }
    )
    # get ship selected based on type and name
    shipSelected <- eventReactive(
        eventExpr = c(input$shipType, input$shipName),
        valueExpr = shipSelectedShipFetch(input$shipType, input$shipName)
    )
    # reactive text - ship name
    output$shipSelectedName <- renderText(
        input$shipName
    )
    # reactive text - ship type
    output$shipSelectedType <- renderText(
        paste(input$shipType, "vessel")
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
