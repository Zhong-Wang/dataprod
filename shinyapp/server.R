library(shiny)
library(ggplot2)

data(economics)
economics$pop <- economics$pop / 1000
economics$unemploy <- economics$unemploy / 1000
economics <- economics[, c("date", "pop", "unemploy")]

shinyServer(function(input, output) {
  get.data <- reactive({
    economics[
      as.numeric(economics$date) >= as.numeric(input$date[1]) &
        as.numeric(economics$date) <= as.numeric(input$date[2]), ]
  })
  
  output$plot <- renderPlot({
    data <- get.data()
    p <- qplot(date, pop, data = data, geom="blank") +
      xlab("Years") + ylab("Population (in millions)") + ylim(0, max(data$pop))
    if("total" %in% input$type) {
      p <- p + geom_line(aes(y = pop), colour = "red")
      p <- p + geom_line(aes(y = mean(pop)), colour = "red", linetype = 3)
    }
    if("unemployed" %in% input$type) {
      p <- p + geom_line(aes(y = unemploy), colour = "blue")
      p <- p + geom_line(aes(y = mean(unemploy)), colour = "blue", linetype = 3)
    }
    p
  })
  
  output$table <- renderTable({
    data <- get.data()
    t <- data.frame()
    if("total" %in% input$type) {
      row <- nrow(t) + 1
      t[row, 1] <- "Total"
      t[row, 2] <- mean(data$pop)
      colnames(t) <- c("Population", "Mean")
    }
    if("unemployed" %in% input$type) {
      row <- nrow(t) + 1
      isolate(t[row, 1] <- "Unemployed")
      isolate(t[row, 2] <- mean(data$unemploy))
      colnames(t) <- c("Population", "Mean")
    }
    t
  })
})
