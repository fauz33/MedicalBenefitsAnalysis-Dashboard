claimantBarChart <- eventReactive(input$inputClaimantYear,{
  inputYear <- isolate(input$inputClaimantYear)
  ggplot(head(totalAmountClaimants[totalAmountClaimants$Year==inputYear,],10), aes(x=reorder(PatientIC_Tran,Total), y=Total)) +
    geom_bar(stat="identity",fill="#728FCE")+ coord_flip()+
    geom_text(aes(label=paste0("RM",format(round(Total), big.mark = ",", scientific = FALSE))), position = position_stack(vjust= 0.5),
              colour = "black", size = 5) +
    theme_classic() + theme(plot.title = element_text(hjust = 0.5,size=17),axis.text = element_text(size = 14),axis.text.x = element_blank(),
                            axis.title = element_text(size=15), axis.title.y=element_blank(), axis.title.x=element_blank())
  
})

claimantTable <- eventReactive(input$inputClaimantYear,{
  inputYear <- isolate(input$inputClaimantYear)
  
  listClaimants <- totalAmountClaimants %>% filter(Year==inputYear) %>% mutate(Total=format(round(Total), big.mark = ",", scientific = FALSE))%>% 
    dplyr::select(-Year)%>% mutate(TotalAmountIncur=format(round(TotalAmountIncur), big.mark = ",", scientific = FALSE))
  

  datatable(listClaimants, 
            colnames = c("Claimants","Amount Incurred (RM)","Amount Reimbursed (RM)","No of Claims"),
            
            options = list(pageLength = 15,
                           
                           autoWidth = TRUE,
                           columnDefs = list(list(width = '80', targets = 4),
                                             list(className = 'dt-center',targets="_all")
                                             
                                             )
                           
            ))
})

output$topClaimantBar <- renderPlot({
  claimantBarChart()
},height = 600)

output$listClaimantTable <- renderDataTable({
  claimantTable()
})


