
#------------bmi_calc

library(shiny)

## basic format 
# ui <- fluidPage()
# 
# server <- function(input, output){}
# 
# shinyApp(ui=ui, server=server)


ui <- fluidPage(
  titlePanel('BMI 계산기'),
  sidebarPanel(
    numericInput('wt', '몸무게(kg)', 70, min=30, max=200),
    numericInput('ht', '키(cm)', 165, min=50, max=250),
    submitButton('실행')
  ),
  mainPanel(
    h3('결과'),
    h4('당신의 몸무게'),
    verbatimTextOutput('inputValue1'),
    h4('당신의 키'),
    verbatimTextOutput('inputValue2'),
    h4('당신의 BMI'),
    verbatimTextOutput('result')
  )
)


server <- function(input, output) {
    bmi_calc <- function(weight, height) (weight/(height/100)^2)
    output$inputValue1 <- renderPrint({input$wt})
    output$inputValue2 <- renderPrint({input$ht})
    output$result <- renderPrint({bmi_calc(input$wt, input$ht)})
  }

shinyApp(ui=ui, server=server)

# save file as app and publish using publishing icon
# save file ui & server separately and publish with icon
