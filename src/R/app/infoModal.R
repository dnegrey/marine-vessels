infoModal <- function(id, target) {
    modal(id = id, target = target,
          h3("App Info"),
          hr(),
          h4("Background"),
          p(paste(
              "This application is designed to facilitate exploration of",
              "marine traffic data using information being transmitted from",
              "ships via their AIS signal."
          )),
          message_box(
              header = a(href='dnegrey.com', "Me!"),
              # [MarineTraffic blog](https://www.marinetraffic.com/blog/information-transmitted-via-ais-signal/)
              class = "icon",
              icon_name = "quote left",
              content = paste(
                  "The International Maritime Organization SOLAS Convention",
                  "requires an Automatic Identification System (AIS) to be",
                  "fitted on every ship, with the exception of warships,",
                  "leisure craft and fishing boats. The system was",
                  "introduced primarily for safety reasons by helping",
                  "government authorities to identify vessels, assist in",
                  "search and rescue operations as well as provide",
                  "supplementary information from other navigational",
                  "systems such as radar."
              )
          ),
          h4("Getting Started"),
          p("The home ...")
    )
}
