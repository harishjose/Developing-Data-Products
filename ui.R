library(shiny)
shinyUI(
  navbarPage("  ",

             #next tab             
tabPanel("Shiny App", style = "color:dark gray",
                      fluidPage(
                       
                        titlePanel("AQL - RQL Calculator"),
                        h6("Copyright - Harish Jose. November 2014."),
                        sidebarLayout(
                          sidebarPanel(
                            h6("Enter the values below, and click on submit. The AQL and RQL values are shown on right side.", style = "color:#888888; background-color: #99CCFF;text-decoration: underline;"), 
                            numericInput(
                              inputId = "lotsize",
                              label = strong("Enter Sample Size, n, greater than 30:"),
                              value = 100, min = 30
                            ),
                            
                            numericInput(
                              inputId = "c",
                              label = strong("Enter Number of Rejects, c, greater than 0:"),
                              value = 0, min = 0
                            ),
                            
                            numericInput(
                              inputId = "alpha",
                              label = strong("Enter Producer's risk, alpha (%) between 1 & 100:"),
                              value = 5, min = 1, max = 100
                            ),
                            
                            numericInput(
                              inputId = "beta",
                              label = strong("Enter Consumer's risk, beta (%) between 1 & 100:"),
                              value = 10, min =1 , max =100
                            ),
                            
                            submitButton('Submit')
                          ),
mainPanel(
                            h3('Your selections:', style = "color:#888888; background-color: #99CCFF;"),
                            tags$style(type='text/css', '#text1 {background-color: rgba(255,255,0,0.40); color: green;font-size: 15px;line-height: 30px;}'), 
                            textOutput("text1"),
                            
                            h3('Your AQL is (%):', style = "color:#888888; background-color: #99CCFF;"),
                            tags$style(type='text/css', '#estimation {background-color: #87ed5f; text-align : center;color: #3c453b;font-size: 26px;line-height: 30px; font-weight: bold;}'),
                            textOutput("estimation"),
                            h3('Your RQL is (%):', style = "color:#888888; background-color: #99CCFF;"),
                            tags$style(type='text/css', '#estimation2 { background-color: #87ed5f; text-align : center;color: #3c453b;font-size: 26px;line-height: 30px; font-weight: bold;}'),
                            textOutput("estimation2"),
                            h3('Calculations:', style = "color:#888888; background-color: #99CCFF;"),
                            tags$style(type='text/css', '#calc {background-color: rgba(255,255,0,0.40); color: green;font-size: 15px;line-height: 30px;}'),
                            textOutput("calc"),
                            img(src="aql.png", height = 50, width = 250),
                            img(src="rql.png", height = 50, width = 250),
                            h3('App Documentation:', style = "color:#888888; background-color: #99CCFF;"),
                            tags$style(type='text/css', '#doc {background-color: rgba(255,255,0,0.40); color: green;font-size: 15px;line-height: 30px;}'),
                            verbatimTextOutput("doc")
                            
                            )
                        ))),
             #end of tab
#next tab  
tabPanel("App Documentation",
                      h2("AQL - RQL Calculator"),
                      h6("Copyright - Harish Jose. November 2014."),
                      br(),
                      h3("Description", style = "color:#888888; background-color: #99CCFF;"),
                      p("AQL stands for Acceptable Quality Level, and RQL stands for Rejectable Quality Level. The basic idea is that the customer can perform inspection on a smaller sample size and determine whether to accept the lot or reject the lot at incoming. This is a key concept for Quality Engineering. For more details click the link below."),
                      a("Wikipedia Link", class = "btn btn-primary btn-md",href = "http://en.wikipedia.org/wiki/Acceptable_quality_limit"),
                      h3("App Details", style = "color:#888888; background-color: #99CCFF;"),
                      p("There are four inputs needed to calculate the AQL and RQL values."),
                      p(" [1] Sample Size, n. This should be larger than 30. The app has the default value of 100."),
                      p(" [2] Number of Rejects. Generally we expect this to be zero rejects. The app has the default value of 0."),
                      p(" [3] Alpha value. This is also called as producer's risk. This should be between 1 and 100. Generally this is set at 5%. The app has the default value of 5%."),
                      p(" [4] Beta value. This is also called as consumer's risk. This should be between 1 and 100. Generally this is set at 10%. The app has the default value of 10%."),
                      br(),
                      p("When the app opens, it calculates the AQL and RQL values based on the default values."),
                      strong("Click on Submit button, after the desired values are entered to get the new results. The Results are shown on the right panel. The paragraphs will be automatically updated to reflect the new values."),
                      br(),
                      br(),
                      p("Based on the values chosen, the app will calculate the AQL and RQL values. If the values are outside the range specified, the textbox will turn red.")
             )
#end of tab
 
  )
)