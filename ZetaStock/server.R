# Shiny app logic

library(shiny)
library(ggplot2)
library(xts)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  yahoo.read <- function(url){
    dat <- read.table(url,header=TRUE,sep=",")
    #df <- dat[,c("Date", option)]
    dat$Date <- as.Date(as.character(dat$Date))
    return(dat)
  }
  
  goClicked <- eventReactive(input$go, {
    yahoo.read(paste("http://real-chart.finance.yahoo.com/table.csv?s=", input$code, "&a=07&b=24&c=2010&d=07&e=24&f=2015&g=d&ignore=.csv", sep=""))
  })
  
  output$home <- renderUI({
    str1 <- paste("ZetaStock is an open-source web-based stock analyzer built with R that provides advanced features such as machine learning.")
    str2 <- paste("This analyzer was built by Xeliot and 0xFireball from ZetaPhase.")
    str3 <- paste("If you're a developer, feel free to check out the source code on GitHub from the link below!.")
    HTML(paste(str1, str2, str3, sep='<br/>'))
  })
  
  output$openPlot <- renderPlot({
    qplot(goClicked()$Date, goClicked()$Close, geom="line", ylab="Closing Price", xlab="Time")
  })
  
  
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
  })
  
})
