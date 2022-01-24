home <- tabPanel(title = "Home", 
                 value = "home",
                 hr(),
                 br(), br(),
                 HTML("<h1><center><b>Medical Utilization in Company XYZ</b></center></h1>"),
                 br(), br(), br(), br(),
                 column(width = 12, br(), br()),
                 column(width = 2, align = "center",
                        
                 ),
                 column(width = 3, align = "center",
                        tab_voronoys(texto = "Demographic", cor = cores[3], id = "homeDemographic")
                 ),
                 column(width = 3, align = "center",
                        tab_voronoys(texto = "Top 10", cor = cores[2], id = "homeGHSClaims")
                 ),
                 column(width = 3, align = "center",
                        tab_voronoys(texto = "Utilization", cor = cores[1], id = "homeUtilization")
                 ),
                 column(width = 12, br(),br()),
                 column(width = 12,
                        br(), br(), 
                        wellPanel(
                          HTML("<h4><b>Medical Benefits Analysis</b> is the activity to analyse the 
                          utilisation of medical benefit provided by the Company XYZ using data science. The 
                          objective of this analysis is to provide insight on the trend of utilisation for 
                          each categories of medical benefits. Hence, the management of this company is 
                          able to visualise and make further refining to cater the employee wellness in the organisation.</h4>")
                        )
                 )
)
