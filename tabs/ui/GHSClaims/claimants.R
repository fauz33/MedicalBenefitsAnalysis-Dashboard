claimants <- tabPanel(title = "Top 10 Claimants", 
                   value = "claimants",
                   br(), hr(),
                   
                   column(width = 12,
                          br(),
                          
                          HTML("<center>"),
                          pickerInput(inputId = "inputClaimantYear", 
                                      label = "Year", 
                                      choices = unique(totalAmountClaimants$Year), 
                                      selected = "2021",
                                      options = list(`live-search` = TRUE,
                                                     `none-selected-text` = "None selected")),
                          HTML("</center>"),
                          column(width = 6,
                                 HTML("<center><h1>Top 10 Claimants</h1></center>"),
                                 br(), 
                                 column(width = 12,
                                 br(),
                                 br(),
                                 withSpinner(plotOutput("topClaimantBar"), type = 6)
                                 )
                                 
                          ),
                          column(width = 6,
                                 HTML("<center><h1>Claimants List</h1></center>"),
                                 column(width = 2),
                                 column(width = 9,
                                        tags$style(
                                          "th {
                                              background: #728FCE;
                                              color: #fff;
                                              text-align: center;
                                              vertical-align: middle
                                          }     
                                          "
                                        ),
                                        withSpinner(dataTableOutput("listClaimantTable"), type = 6)
                                 )           
                                 
                          )
                   )
)