server <- shinyServer(function(input, output, session) {
    # update vessel names in menu based on vessel type selected
    vesselDropdownNameUpdate(input, session, main)
    # reactive data - ship selected
    shipSelected <- shipSelectedShipFetch(input, main)
    # render reactive text - ship name
    output$shipSelectedName <- renderText(
        shipSelected()$ShipName
    )
    # render reactive text - ship type
    output$shipSelectedType <- renderText(
        paste(shipSelected()$ShipType, "vessel")
    )
    # render reactive text - note about ship distance
    output$shipSelectedNote <- renderText(
        shipSelectedNoteCreate(shipSelected())
    )
    # render reactive map - ship location(s)
    output$shipSelectedMap <- renderLeaflet({
        shipSelectedMapCreate(shipSelected())
    })
})
