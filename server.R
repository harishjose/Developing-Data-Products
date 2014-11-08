library(shiny)
AQL<-function(alpha, lotsize,c) 
{(qbeta(((alpha/100)), c+1, lotsize-c)*100)}

RQL<-function(beta, lotsize,c) 
{(qbeta((1-(beta/100)), c+1, lotsize-c)*100)}

shinyServer(
function(input, output) {
output$inputlotsizevalue <- renderPrint({input$lotsize})
output$inputcvalue <- renderPrint({input$c})
output$estimation <- renderText({round(AQL(input$alpha, input$lotsize,input$c),2)})
output$estimation2 <- renderText({round(RQL(input$beta, input$lotsize,input$c),2)})
output$inputalphavalue <- renderPrint({input$alpha})
output$inputbetavalue <- renderPrint({input$beta})

output$text1 <- renderText({paste("You have chosen the following values. Sample size,n = ",input$lotsize, ", number of rejects, c = ",input$c, ", Producer's risk, alpha = ", input$alpha, " and Consumer's risk, beta = " ,input$beta) })
output$calc <- renderText({"The calculations for AQL are based on binomial distribution. The values of AQL and RQL are calculated by solving the equations shown below. Fortunately, R utilizes the betainverse function to make this easy. In R, the AQL is calculated as (qbeta(((alpha/100)), c+1, n-c)*100), and RQL is calculated as (qbeta((1-(beta/100)), c+1, n-c)*100)."})
output$doc<- renderText({"Please click on the 'App Documentation' tab on top for App Documentation."})

}
)
