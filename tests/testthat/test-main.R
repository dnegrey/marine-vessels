context("main")

test_that("test main object", {
    # class
    expect_is(main, "list")
    # has two objects
    expect_length(main, 2)
    # names
    expect_identical(names(main), c("shipTypeName", "shipMaxDist"))
    # shipTypeName object
    expect_is(main$shipTypeName, "list")
    expect_identical(unlist(unique(lapply(main$shipTypeName, class))), "data.frame")
    xn <- do.call(rbind, main$shipTypeName)
    row.names(xn) <- NULL
    expect_identical(names(xn), c("ShipTypeNameId", "ShipType", "ShipName"))
    expect_is(xn$ShipTypeNameId, "integer")
    expect_is(xn$ShipType, "character")
    expect_is(xn$ShipName, "character")
    expect_equal(sum(is.na(xn)), 0)
    expect_equal(nrow(xn), length(unique(xn$ShipTypeNameId)))
    expect_equal(nrow(xn), nrow(select(xn, ShipType, ShipName)))
    # shipMaxDist object
    expect_is(main$shipMaxDist, "data.frame")
    expect_equal(sum(names(xn) %in% names(main$shipMaxDist)), 3)
    expect_equal(sum(is.na(main$shipMaxDist[names(xn)])), 0)
    expect_equal(nrow(xn), nrow(main$shipMaxDist))
    xn <- arrange(xn, ShipTypeNameId)
    xc <- xn %>%
        inner_join(main$shipMaxDist[names(xn)], names(xn)) %>%
        arrange(ShipTypeNameId)
    expect_identical(xn, xc)
    # all ships in original data
    xo <- ships %>%
        select(ShipType = ship_type, ShipName = SHIPNAME) %>%
        unique() %>%
        arrange(ShipType, ShipName)
    xn <- arrange(xn, ShipType, ShipName)
    expect_identical(xo, xn[2:3])
    # max distance matches
    xm <- mainShip(cleanShips, cleanShipTypeName) %>%
        filter(!is.na(DistSinceLast_Meters)) %>%
        group_by(ShipTypeNameId) %>%
        summarise(MaxDist = max(DistSinceLast_Meters)) %>%
        data.frame()
    xm <- main$shipMaxDist %>%
        left_join(xm, "ShipTypeNameId")
    expect_identical(xm$DistSinceLast_Meters, xm$MaxDist)
    expect_equal(sum(is.na(main$shipMaxDist[c("Lat", "Lon", "Port")])), 0)
    expect_identical(
        which(is.na(main$shipMaxDist$PreviousPort)),
        which(is.na(main$shipMaxDist$PreviousDatetime))
    )
    expect_identical(
        which(is.na(main$shipMaxDist$PreviousPort)),
        which(is.na(main$shipMaxDist$PreviousLat))
    )
    expect_identical(
        which(is.na(main$shipMaxDist$PreviousPort)),
        which(is.na(main$shipMaxDist$PreviousLon))
    )
    expect_identical(
        which(is.na(main$shipMaxDist$PreviousPort)),
        which(is.na(main$shipMaxDist$TimeSinceLast_Seconds))
    )
    expect_identical(
        which(is.na(main$shipMaxDist$PreviousPort)),
        which(is.na(main$shipMaxDist$DistSinceLast_Meters))
    )
})
