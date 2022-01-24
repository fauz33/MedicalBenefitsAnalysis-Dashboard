gtl_barchart  <- reactive(
  ggplot(PaidAmount1, aes(x=Year,y=n,fill=Amount)) + 
    geom_bar(position="dodge", stat="identity") +
    geom_text(aes(label=paste0("RM",format(round(n), big.mark = ",", scientific = FALSE))), colour = "black", size = 5,position=position_dodge(width=0.9), vjust=-0.25) +
    scale_fill_brewer(labels = c("Claims Amount", "Total Premium")) +
    theme_classic() +theme(legend.title = element_blank(),legend.text = element_text(size=10),axis.text = element_text(size = 12),axis.text.y = element_blank(),
                           axis.title = element_text(size=15),axis.title.y=element_blank(), axis.title.x=element_blank())
)

ghs_barchart <- reactive(
  ggplot(PaidAmount10, aes(x=Year,y=n,fill=Amount)) + 
    geom_bar(position="dodge", stat="identity") +
    geom_text(aes(label=paste0("RM",format(round(n), big.mark = ",", scientific = FALSE))), colour = "black", size = 5,position=position_dodge(width=0.9), vjust=-0.25) +
    scale_fill_brewer(labels = c("Claims Amount", "Total Premium")) +
    theme_classic() +theme(legend.title = element_blank(),legend.text = element_text(size=10),axis.text = element_text(size = 12),axis.text.y = element_blank(),
                           axis.title = element_text(size=15),axis.title.y=element_blank(), axis.title.x=element_blank())
)

output$ghs_chart <- renderPlot({
  ghs_barchart()
},height = 600)

output$gtl_chart <- renderPlot({
  gtl_barchart()
},height = 600)