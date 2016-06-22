library(shiny)
shinyUI(pageWithSidebar(
    headerPanel('Pridict Fuel Efficiency'),
    sidebarPanel(
        
        p('This is a shiny application of the example given  by David Rabinson at segment 4 of  his R', a(href="http://varianceexplained.org/RData/code/code_lesson3/","Tutorial."),' This utility uses sample  dataset built into R, called mtcars, that comes from a 1974 issue of Motor Trends magazine'),
        
        h3('Description'),
        p('Lets assume that  weight,  number of cylinders, and the volume, or displacement, of the car are related to the fuel efficency of a car. Now, based on the model we want to predict fuel eficiency given Displacement, Number of Cylinders and Weight.'),
        
       
           
           c('Please enter :.'),
        numericInput('disp', 'Displacement:',70, min = 50, max = 500, step = 10), 
        numericInput('cyldr', 'Number of cylinders (4,6,8):', 4, min = 4, max = 8, step = 2),
        sliderInput('wght', 'Weight (lbs):',1500, min = 1500, max = 5500, step = 100)
    ),
    mainPanel(
        h2('Predicted Fuel Efficiency (MPG)'),
        h4('Predict for:'),
        verbatimTextOutput("predictFor"),
        h4('Fuel efficiency (MPG):'),
        verbatimTextOutput("fuelEfficiency"),
        h4('How to Use'),
        h5('Please select appropriate values on the left hand Panel. Displacement can be a value from 70 to 500. You can change number of cylinders by clicking numeric input widget. Allowed values are 4,6 and 8. Weight of the car in Ib can be selected by moving the slider left and right.')
    )
))