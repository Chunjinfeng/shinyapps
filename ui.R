library(shiny)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(

  headerPanel("Plot any Variable"),


  sidebarPanel(
    selectInput("dataset", "Choose a dataset:", choices = c("rock", "pressure", "cars") ),

   numericInput("obs", "Number of observations to show:", 5),
   textInput("Variable","The variable you want to plot is:","peri"),
submitButton("Update View"),
helpText("Note:when you first see the application,you can choose one of the three datasets,and view number of data by enter the number to show the rows of the data.when you enter the variable name of the dataset correctly,the application will give you a scatter diagram of the variable.In another way,it will give you an indication of 'Invalid' and you will also not get the plot.")
),
mainPanel(
    h4("Weather the Variable Valid"),
    verbatimTextOutput("ifvalided"),
    
    h4("The Scatter Diagram of Variable"),
    plotOutput("plot"),
    
    h4("Observations"),
    tableOutput("view")
  )
))
