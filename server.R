library(shiny)
library(datasets)


shinyServer(function(input, output) {

  # Return the requested dataset
  datasetInput <- reactive({
    switch(input$dataset,
           "rock" = rock,
           "pressure" = pressure,
           "cars" = cars)
  })

# Judge the variable name if valid
  output$ifvalided<-reactive({
if (!(input$Variable) %in% names(datasetInput())){
"Invalid" } else {
"Valid"
}
  }
)

  # show the plot

  output$plot <- renderPlot({
if (is.null(input$Variable)) {
NULL  } else {
plot(datasetInput()[,input$Variable],ylab=input$Variable,cex.lab=1.5)
    }
})
# Show the first "n" rows
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)
  })
})

