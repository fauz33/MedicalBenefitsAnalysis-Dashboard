medicalProviders <- tabPanel(title = "Top 10 Medical Providers", 
                   value = "medicalProviders",
                   br(), hr(),
                   
                   column(width = 12,
                          br(),
                          
                          HTML("<center>"),
                          pickerInput(inputId = "inputMProvidersYear", 
                                      label = "Year", 
                                      choices = unique(totalAmountDiagnoses$Year), 
                                      selected = "2021",
                                      options = list(`live-search` = TRUE,
                                                     `none-selected-text` = "None selected")),
                          HTML("</center>"),
                          column(width = 6,
                                 HTML("<center><h1>Top 10 Medical Providers</h1></center>"),
                                 br(), 
                                 column(width = 12,
                                 br(),
                                 br(),
                                 withSpinner(plotOutput("topMProvidersBar"), type = 6)
                                 )
                                 
                          ),
                          column(width = 6,
                                 HTML("<center><h1>Medical Providers List</h1></center>"),
                                 column(width = 12,
                                        tags$style(
                                          "th {
                                              background: #728FCE;
                                              color: #fff;
                                              text-align: center;
                                              vertical-align: middle
                                          }     
                                          "
                                        ),
                                        withSpinner(dataTableOutput("listMProvidersTable"), type = 6)
                                 )           
                                 
                          )
                   )
)