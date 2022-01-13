utilization <- tabPanel(title = "Utilization", 
                  value = "utilization",
                  hr(),
                  br(), br(),
                  HTML("<h1><center>Utilization Experience (2018-2021)</center></h1>"),
                  br(), br(), br(), br(),
                  column(width = 3, align = "center",
                         
                  ),
                  column(width = 12,
                         hr(),
                         
                         
                         fluidRow(
                           tags$style(
                             ".box {
                                      border: 1px solid #D4D4D4;
                                      box-shadow: 0 1px 1px rgb(0 0 0 / 10%);
                                    }
                                    .box:hover {
                                      box-shadow: 0px 8px 8px 0px rgb(0, 0, 0, 0.2);
                                    }
                                    
                                    }
                                    "
                           ),
                           box(
                             br(),
                             HTML("<center><h1>Group Hospitalization & Surgical - Utilization</h1></center>"),
                             br(),
                             status = "primary"
                             ,solidHeader = TRUE 
                             ,width = "6"
                             ,height = 750
                             ,withSpinner(plotOutput("ghs_chart"), type = 6)
                           ),
                           box(
                             br(),
                             HTML("<center><h1>Group Term Life - Utilization</h1></center>"),
                             br(),
                             status = "primary"
                             ,solidHeader = TRUE 
                             ,width = "6"
                             ,height = 750
                             ,withSpinner(plotOutput("gtl_chart"), type = 6)
                           )
                         )    
                         
                        
                  )
)