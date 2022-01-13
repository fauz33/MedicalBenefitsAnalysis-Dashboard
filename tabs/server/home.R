
observeEvent(input$homeDemographic,{
  updateTabsetPanel(session = session, inputId = "navbar", selected = "demographic")
})
observeEvent(input$homeGHSClaims,{
  updateTabsetPanel(session = session, inputId = "navbar", selected = "GHSClaims")
})
observeEvent(input$homeUtilization,{
  updateTabsetPanel(session = session, inputId = "navbar", selected = "utilization")
})
