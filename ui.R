shinyUI(
  fluidPage(
    ##-- Favicon ----
    tags$head(
      tags$link(rel = "shortcut icon", href = "img/favicon.ico"),
      #-- biblio js ----
      tags$link(rel="stylesheet", type = "text/css",
                href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"),
      tags$link(rel="stylesheet", type = "text/css",
                href = "https://fonts.googleapis.com/css?family=Open+Sans|Source+Sans+Pro")
    ),
    ##-- Logo ----
    list(tags$head(HTML('<link rel="icon", href="img/logo-art.png",
                        type="image/png" />'))),
    div(style="padding: 1px 0px; width: '100%'",
        titlePanel(
          title="", windowTitle = "Medical Benefits Analysis"
        )
    ),
    ##-- Header ----
    navbarPage(#title = div(img(src="img/logo-art.png",height = "75px"), style = "padding-left:100px;"),
               title = "Data De Facto",
               id = "navbar",
               selected = "home",
               theme = "styles.css", 
               fluid = T,
               ##-- Abas ----
               home,
               demographic,
               GHSClaims,
               utilization
    ),
    ##-- Footer ----
    div(class = "footer",
        includeHTML("html/footer.html"),
        
    )
  )
)