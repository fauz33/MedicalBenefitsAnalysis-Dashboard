stacked_bar <- reactive(
  ggplot(relData, aes(fill=Rel, y=Count, x=Year)) + 
    geom_bar(position="stack",width=0.7, stat="identity") +
    geom_text(aes(label=Count), position = position_stack(vjust= 0.5),
              colour = "black", size = 6) + 
    scale_fill_brewer(labels = c("Children", "Employee","Spouse")) +
    theme_classic() +theme(legend.title = element_blank(),axis.text = element_text(size = 12),
                           axis.title = element_text(size=15),axis.title.y=element_blank(), axis.title.x=element_blank())
)

pie_chart <- eventReactive(input$inputYear,{
  inputYear <- isolate(input$inputYear)
  ggplot(relData[relData$Year==inputYear,], aes(x="", y=percentage, fill=Rel)) +
    geom_bar(stat="identity", width=1, color="white") +
    coord_polar("y", start=0) +
    ggtitle("Members By Relationship") + 
    geom_text(aes(label = percentage),
              position = position_stack(vjust = 0.5), size = 6) +
    scale_fill_brewer(labels = c("Children", "Employee","Spouse")) +
    theme_void() + theme(legend.title = element_blank(),plot.title = element_text(hjust = 0.5,size=17))
})

ageRangeBarChart <- eventReactive(input$inputYear,{
  #ageRange <- paste0("ageRange",isolate(input$inputYear))
  inputYear <- isolate(input$inputYear)
  dfAgeRange <- ageRange %>% filter(Year==inputYear) %>% dplyr::select(Age_Range,Count)
  #calcAgeRange<-eval(parse(text=inputYear)) %>% filter(Rel!='P') %>% distinct(PatientIC_Tran,.keep_all = TRUE) %>% select(PatientAge)
  
  #df <- as.data.frame(table(age.range(calcAgeRange$PatientAge, upper = 70)))
  ggplot(dfAgeRange, aes(x=Count, y=Age_Range)) +
    geom_bar(stat="identity", fill="steelblue")+ 
    ggtitle("Members By Age Band") + xlab("Total")+
    geom_text(aes(label=Count), position = position_stack(vjust= 0.5),
              colour = "black", size = 5) +
    theme_classic() + theme(plot.title = element_text(hjust = 0.5,size=17),axis.text = element_text(size = 12),
                            axis.title = element_text(size=15), axis.title.y=element_blank(), axis.title.x=element_blank())
  
})

demo_calc <- eventReactive(input$inputYear,{ 
  inputYear <- isolate(input$inputYear)
  
  listCalc <- list()
  listCalc[[1]] <- key_takeaways[key_takeaways$Year==inputYear & key_takeaways$Computation=="Avg Kids",]$Value
  
  listCalc[[2]] <- key_takeaways[key_takeaways$Year==inputYear & key_takeaways$Computation=="Growth",]$Value
  
  listCalc[[3]] <- key_takeaways[key_takeaways$Year==inputYear & key_takeaways$Computation=="Median",]$Value
  
  
  names(listCalc) <- c("child_per_employee","emp_growth","median_age")
  
  return(listCalc)
})

output$rel_count <- renderPlot({
  stacked_bar()
},height = 600)

output$rel_percent <- renderPlot({
  pie_chart()
})

output$rel_age <- renderPlot({
  ageRangeBarChart()
})

output$child_per_employee <- renderText({
  demo_calc()$child_per_employee
})

output$emp_growth <- renderText({
  demo_calc()$emp_growth
})

output$median_age <- renderText({
  demo_calc()$median_age
})