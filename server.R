server <- shinyServer(function(input, output, session) {
    # change available ship names based on type selected
    observeEvent(
        eventExpr = input$shipType,
        handlerExpr = {
            x <- main$shipTypeName[[input$shipType]]$ShipName
            update_dropdown_input(
                session = session,
                input_id = "shipName",
                choices = x
            )
        }
    )
    # get ship selected based on type and name
    shipSelected <- eventReactive(
        eventExpr = c(
            input$shipType,
            input$shipName
        ),
        valueExpr = shipSelectedShipFetch(input$shipType, input$shipName)
    )
    # dynamic note based on ship selected
    output$shipSelectedNote <- renderText(
        shipSelectedNoteCreate(shipSelected())
    )
    # dynamic map based on ship selected
    output$shipSelectedMap <- renderLeaflet({
        shipSelectedMapCreate(shipSelected())
    })
})
