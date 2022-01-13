demographic <- tabPanel(title = "Demographic", 
                  value = "demographic",
                  hr(),
                  br(), br(),
                  HTML("<h1><center>Headcount Trend</center></h1>"),
                  br(), br(), br(), br(),
                  column(width = 3, align = "center",
                         
                  ),
                  column(width = 12,
                         hr(),
                         column(width = 4,
                                br(),
                                br(),
                                HTML("<center><h1>Total Headcount</h1></center>"),
                                withSpinner(plotOutput("rel_count"), type = 6)
                         ),
                         column(style='border-left: 1px solid #D4D4D4',width = 8,
                                br(),
                                
                                HTML("<center>"),
                                pickerInput(inputId = "inputYear", 
                                            label = "Year", 
                                            choices = unique(relData$Year), 
                                            selected = "2021",
                                            options = list(`live-search` = TRUE,
                                                           `none-selected-text` = "None selected")),
                                HTML("</center>"),
                                fluidRow(
                                column(width = 6,
                                      br(),
                                      
                                      br(),
                                      withSpinner(plotOutput("rel_percent"), type = 6) 
                                ),
                                
                                column(width = 6,
                                       br(),
                                       withSpinner(plotOutput("rel_age"), type = 6)
                                  )
                                ),
                                fluidRow(
                                  tags$style(
                                    ".box {
                                      border: 1px solid #D4D4D4;
                                      box-shadow: 0 1px 1px rgb(0 0 0 / 10%);
                                    }
                                    .box:hover {
                                      box-shadow: 0px 8px 8px 0px rgb(0, 0, 0, 0.2);
                                    }
                                    #child_per_employee {
                                                        font-size: 45px;
                                                        padding-top: 25px;
                                                        font-weight: bold;
                                                        text-align: center;
                                                        color: red;
                                    }
                                    #emp_growth{
                                                        font-size: 45px;
                                                        padding-top: 25px;
                                                        font-weight: bold;
                                                        text-align: center;
                                                        color: red;
                                    }
                                    #median_age{
                                                        font-size: 45px;
                                                        padding-top: 25px;
                                                        font-weight: bold;
                                                        text-align: center;
                                                        color: red;
                                    }
                                    "
                                  ),
                                  box(
                                    status = "primary"
                                    ,solidHeader = TRUE 
                                    ,width = "4"
                                    ,height = 250
                                    ,withSpinner(textOutput("child_per_employee"), type = 6)
                                    , HTML("<center><h3>Number of Children per Employee </h3></center>")
                                    , HTML("<center><h3>With Dependent (s)</h3></center>")
                                  ),
                                  box(
                                    status = "primary"
                                    ,solidHeader = TRUE 
                                    ,width = "4"
                                    ,height = 250
                                    ,withSpinner(textOutput("emp_growth"), type = 6)
                                    ,HTML("<center><h3>Average of Employee Growth</h3></center>")
                                    ,HTML("<center><h3>Rate Since 2018</h3></center>")
                                  ),
                                  box(
                                    status = "primary"
                                    ,solidHeader = TRUE 
                                    ,width = "4"
                                    ,height = 250
                                    ,withSpinner(textOutput("median_age"), type = 6)
                                    ,HTML("<center><h3>Employees Median Age</h3></center>")
                                  )
                                )
                        )
                        
                  )
)