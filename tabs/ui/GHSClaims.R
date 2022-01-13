tab_files <- list.files(path = "tabs/ui/GHSClaims", full.names = T)
suppressMessages(lapply(tab_files, source))

GHSClaims <- tabPanel(title = "Top 10", 
                      value = "GHSClaims",
                      hr(),
                      tabsetPanel(
                        diagnoses,
                        medicalProviders,
                        claimants
                   
                      )
)