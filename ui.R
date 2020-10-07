ui <- semanticPage(
    # custom css
    tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")
    ),
    # page title
    title = "Marine Vessels",
    div(
        class = "ui container",
        id = "main-container",
        # container header
        h1(class = "ui header", icon("ship"),
           div(class = "content", "Marine Vessels",
               div(class = "sub header", "Location and Distance App"))),
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
        # note and map
        div(
            class = "ui raised segment",
            card(
                style = "width: 100%;",
                div(class = "content",
                    div(class = "header", textOutput("shipSelectedName")),
                    div(class = "meta", textOutput("shipSelectedType")),
                    div(class = "description", htmlOutput("shipSelectedNote")))
            ),
            leafletOutput("shipSelectedMap")
        )
    )
)
