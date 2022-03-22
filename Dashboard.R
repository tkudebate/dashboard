library(shiny)
library(shinydashboard)


ui <- dashboardPage(
#Header  
  dashboardHeader(title = "Covid19 Dashboard"),
#Sidebar  
  dashboardSidebar(
    sidebarMenu(
      menuItem(
        "首頁",icon = icon('dashboard'),tabName = "Firstpage"
      ),
      menuItem(
        "關於",icon = icon('marker'),tabName = "about"
      ),
      menuItem(
        "台灣資料",icon = icon('bar-chart-o'),tabName = "about"
      ),
      menuItem(
        "各國統計",icon = icon('bar-chart-o'),tabName = "about"
      )
    )
  ),
#body  
  dashboardBody(
    # Boxes need to be put in a row (or column)
    fluidRow(
    
    ),
    tabItems(
      tabItem(
        tabName = "Firstpage",h1('firstpage')
      ),
      tabItem(
        tabName = "about",h1('about')
      )
    )
  )
)

server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
}

shinyApp(ui = ui, server = server)
  
  