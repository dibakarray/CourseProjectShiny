library(shiny)
data(mtcars)

mfit = lm(mpg ~ wt + disp + cyl, data=mtcars)



shinyServer(
    function(input, output) {
        weight <- reactive({input$wght/1000})
        displacement <- reactive(input$disp)
        cylinder <- reactive(input$cyldr)
        
        
        predicted_mpg <-reactive({mfit$coefficients[1] + mfit$coefficients[2] * weight() + mfit$coefficients[3] * displacement() + mfit$coefficients[4] * cylinder()})
        output$predictFor <- renderPrint({paste("User Input: Vehicle of - Displacement ",input$disp, ", Cylinders  ",
                                                 input$cyldr, ", Weight -  ",
                                                 input$wght, " Ibs")})
        output$fuelEfficiency <- renderPrint({paste(round(predicted_mpg(), 2), "MPG")})
       
    }
)