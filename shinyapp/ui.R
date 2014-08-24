library(shiny)

shinyUI(fluidPage(
  
  titlePanel("1967 - 2007 US Population"),
  
  sidebarLayout(position = "right",
    sidebarPanel(
      p("The 'economics' dataset is from 'ggplot2' package,
        which includes data regarding personal savings rate,
        personal consumption expenditure, median duration of unemployment,
        unemployed population and total population in the US during Jun 1967 to Mar 2007.[1]"),
      p("This very simple interactive application allows user to see how
        unemployed population and total population changed over time.
        You can use date picker to change the range of data to be plotted.
        You can also use check box to specify which population data to be displayed."),
      a("1. R document - US economic time series.",
        href="http://docs.ggplot2.org/current/economics.html", target="_blank")
    ),
    
    mainPanel(
      checkboxGroupInput("type", "",
                   c("Total Population" = "total",
                     "Unemployed Population" = "unemployed"),
                   selected = "unemployed",
                   inline = TRUE),
      
      plotOutput("plot"),
      
      dateRangeInput("date",
                     "Date range:",
                     start = "1967-06-30",
                     end = "2007-03-31",
                     min = "1967-06-30",
                     max = "2007-03-31",
                     startview = "year"),
      
      tableOutput("table")
    )
  )
))
