shinyServer(function(input, output, session){
  ##-- HOME ----
  source("tabs/server/home.R", local = TRUE)
  source("tabs/server/demographic.R", local = TRUE)
  source("tabs/server/diagnoses/diagnoses.R", local = TRUE)
  source("tabs/server/diagnoses/medicalProviders.R", local = TRUE)
  source("tabs/server/diagnoses/claimants.R", local = TRUE)
  source("tabs/server/utilization.R", local = TRUE)
})