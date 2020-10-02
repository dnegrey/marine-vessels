analyzeData <- function(dir) {
    # calculate distance sailed, by ship, between observations
    RDataCreate(
        dir = dir,
        x = "mainShips",
        fun = mainShip,
        args = list(
            xcs = RDataUse(dir, "cleanShips"),
            xstn = RDataUse(dir, "cleanShipTypeName")
        )
    )
    # main data object
    RDataCreate(
        dir = dir,
        x = "main",
        fun = list,
        args = list(
        )
    )
}
