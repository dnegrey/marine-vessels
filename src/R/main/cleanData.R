cleanData <- function(dir) {
    # clean ships
    RDataCreate(
        dir = dir,
        x = "cleanShips",
        fun = cleanShip,
        args = list(
            x = RDataUse(dir, "ships")
        )
    )
    # create unique ship/type id
    RDataCreate(
        dir = dir,
        x = "cleanShipTypeName",
        fun = function(x) {
            y <- x %>%
                select(ShipType, ShipName) %>%
                unique() %>%
                arrange(ShipType, ShipName) %>%
                mutate(ShipTypeNameId = row_number()) %>%
                select(ShipTypeNameId, ShipType, ShipName)
            return(y)
        },
        args = list(
            x = RDataUse("data", "cleanShips")
        )
    )
}
