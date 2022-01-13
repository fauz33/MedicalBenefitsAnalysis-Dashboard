MProvidersBarChart <- eventReactive(input$inputMProvidersYear,{
  inputYear <- isolate(input$inputMProvidersYear)
  ggplot(head(totalAmountMProviders[totalAmountMProviders$Year==inputYear,],10), aes(x=reorder(`Medical Provider`,Total), y=Total)) +
    geom_bar(stat="identity",fill="#728FCE")+ coord_flip()+
    geom_text(aes(label=paste0("RM",format(round(Total), big.mark = ",", scientific = FALSE))), position = position_stack(vjust= 0.5),
              colour = "black", size = 5) +
    theme_classic() + theme(plot.title = element_text(hjust = 0.5,size=17),axis.text = element_text(size = 14),axis.text.x = element_blank(),
                            axis.title = element_text(size=15), axis.title.y=element_blank(), axis.title.x=element_blank())
  
})

MProvidersTable <- eventReactive(input$inputMProvidersYear,{
  inputYear <- isolate(input$inputMProvidersYear)
  
  listMProviders <- totalAmountMProviders %>% filter(Year==inputYear) %>% mutate(Total=format(round(Total), big.mark = ",", scientific = FALSE))%>% dplyr::select(-Year)
  
  sketch = htmltools::withTags(table(
    class = 'display',
    thead(
      tr(
        th(rowspan = 2, 'Medical Providers'),
        th(colspan = 2, 'Amount Reimbursed'),
        th(rowspan = 2, 'No of Claims'),
        th(colspan = 2, 'Top Claimants')
      ),
      tr(
        th('(MYR)'),
        th('(%)'),
        th('Claimant'),
        th('No of Claims')
      )
    )
  ))
  
  datatable(listMProviders, 
            #colnames = c("Diagnosis","Amount Reimbursed (RM)", "%", "No of Claims", "No of Claimants","E","SP","C"),
            container = sketch, rownames = FALSE,
            
            options = list(pageLength = 15
                           
                           #autoWidth = TRUE,
                           
            ))
})

output$topMProvidersBar <- renderPlot({
  MProvidersBarChart()
},height = 600)

output$listMProvidersTable <- renderDataTable({
  MProvidersTable()
})


