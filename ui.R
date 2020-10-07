ui <- semanticPage(
    # custom css
    tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")
    ),
    # page title
    title = "Marine Vessels",
    # main application container
    div(class = "ui container", id = "main-container",
        # container header
        h1(class = "ui header", icon("ship"),
           div(class = "content", "Marine Vessels",
               div(class = "sub header", "Location and Distance App"))),
        # section divider
        div(class = "ui horizontal divider", icon("cog"), "Options"),
        # options section
        div(class = "ui container", id = "options-container",
            flow_layout(column_gap = "20px", row_gap = "15px",
                div(class = "column",
                    div(class = "header", p("Vessel Type")),
                    dropdown_input(
                        input_id = "shipType",
                        choices = names(main$shipTypeName),
                        value = names(main$shipTypeName)[1]
                    )
                ),
                div(class = "column",
                    div(class = "header", p("Vessel Name")),
                    dropdown_input(
                        input_id = "shipName",
                        choices = main$shipTypeName[[1]]$ShipName
                    )
                )
            )
        ),
        # section divider
        div(class = "ui horizontal divider", icon("route"), "Results"),
        # results section
        div(class = "ui raised segment",
            card(style = "width: 100%;",
                 div(class = "content",
                     div(class = "header", textOutput("shipSelectedName")),
                     div(class = "meta", textOutput("shipSelectedType")),
                     div(class = "description", htmlOutput("shipSelectedNote")))
            ),
            leafletOutput("shipSelectedMap")
        )
    )
)
