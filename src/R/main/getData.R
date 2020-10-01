getData <- function(dir) {
    # download ships data, if it does not already exist
    if (!file.exists("var/ships.csv")) {
        download.file(
            "https://drive.google.com/uc?export=download&id=160JnqoQysqzvR1GBBnKJFKAew_v6TYli",
            "var/ships_data.zip"
        )
        unzip(
            "var/ships_data.zip",
            exdir = "var"
        )
    }
    # read in ships data
    RDataCreate(
        dir = dir,
        x = "ships",
        fun = read.csv,
        args = list(
            file = "var/ships.csv",
            na.strings = "",
            stringsAsFactors = FALSE
        )
    )
}
