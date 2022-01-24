diagnoseBarChart <- eventReactive(input$inputDiagnoseYear,{
  inputYear <- isolate(input$inputDiagnoseYear)
  ggplot(head(totalAmountDiagnoses[totalAmountDiagnoses$Year==inputYear,],10), aes(x=reorder(Diagnosis,Total), y=Total)) +
    geom_bar(stat="identity",fill="#728FCE")+ coord_flip()+
    geom_text(aes(label=paste0("RM",format(round(Total), big.mark = ",", scientific = FALSE))), position = position_stack(vjust= 0.5),
              colour = "black", size = 5) +
    theme_classic() + theme(plot.title = element_text(hjust = 0.5,size=17),axis.text = element_text(size = 14),axis.text.x = element_blank(),
                            axis.title = element_text(size=15), axis.title.y=element_blank(), axis.title.x=element_blank())
  
})

diagnoseTable <- eventReactive(input$inputDiagnoseYear,{
  inputYear <- isolate(input$inputDiagnoseYear)
  
  listDiagnose <- totalAmountDiagnoses %>% filter(Year==inputYear) %>% mutate(Total=format(round(Total), big.mark = ",", scientific = FALSE))%>% dplyr::select(-Year)
  
  sketch = htmltools::withTags(table(
    class = 'display',
    thead(
      tr(
        th(rowspan = 2, 'Diagnosis'),
        th(colspan = 2, 'Amount Reimbursed'),
        th(rowspan = 2, 'No of Claims'),
        th(colspan = 4, 'No of Claimants')
      ),
      tr(
        th('(MYR)'),
        th('(%)'),
        th('Overall'),
        th('Employee'),
        th('Spouse'),
        th('Children')
      )
    )
  ))
  
  datatable(listDiagnose, 
            #colnames = c("Diagnosis","Amount Reimbursed (RM)", "%", "No of Claims", "No of Claimants","E","SP","C"),
            container = sketch, rownames = FALSE,
            
            options = list(pageLength = 15
                           
                           #autoWidth = TRUE,
                           
            ))
})

output$topDiagnosesBar <- renderPlot({
  diagnoseBarChart()
},height = 600)

output$listDiagnoseTable <- renderDataTable({
  diagnoseTable()
})


