ui <- semanticPage(
    # custom css
    tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")
    ),
    # page title
    title = "Marine Vessels Application",
    # body header
    h1(class = "ui header", icon("ship"),
       div(class = "content", "Marine Vessels Application")),
    # vessel type selection
    h4("Vessel Type"),
    dropdown_input(
        input_id = "shipType",
        choices = names(main$shipTypeName),
        value = names(main$shipTypeName)[1]
    ),
    # vessel name selection
    h4("Vessel Name"),
    dropdown_input(
        input_id = "shipName",
        choices = main$shipTypeName[[1]]$ShipName
    ),
    # note regarding vessel
    br(),
    hr(),
    htmlOutput("shipSelectedNote"),
    hr(),
    # map displaying vessel coordinates
    h4("Vessel Map"),
    leafletOutput("shipSelectedMap")
)
