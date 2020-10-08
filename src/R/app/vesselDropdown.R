vesselDropdown <- function(id, type, choices, value) {
    ns <- NS(id)
    div(class = "column",
        div(class = "header", p(paste("Vessel", type)),
            dropdown_input(
                input_id = ns("vesselDropdown"),
                choices = choices,
                value = value
            ))
    )
}
