library(shiny)

shinyUI(fluidPage(
  
  tags$head(
    tags$style(HTML("
                    @import url('//fonts.googleapis.com/css?family=Lora);
                    
                    h1 {
                    font-family: 'Lora';
                    font-weight: 500;
                    line-height: 1.1;
                    color: #48ca3b;
                    }
                     ")
               )
    
    ),
    headerPanel('Pridict Fuel Efficiency'),
    sidebarPanel(
        
        
        h6('[Note: In case you need some Help while using the utility, Click Help Tag on the main Panel]',style = "color: #FF0000;"),
       
           
           c('Please enter :'),
        numericInput('disp', 'Displacement:',70, min = 50, max = 500, step = 10), 
        numericInput('cyldr', 'Number of cylinders (4,6,8):', 4, min = 4, max = 8, step = 2),
        sliderInput('wght', 'Weight (lbs):',1500, min = 1500, max = 5500, step = 100)
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel( "Result",
                h3('Predicted Fuel Efficiency (MPG)'),
                h4('Predict for:'),
                verbatimTextOutput("predictFor"),
                h4('Fuel efficiency (MPG):'),
                verbatimTextOutput("fuelEfficiency"),
                h4('Background'),
                p('This is a shiny application of the example given  by David Rabinson at segment 4 of  his R', a(href="http://varianceexplained.org/RData/code/code_lesson3/","Tutorial."),' This utility uses sample  dataset built into R, called mtcars, that comes from a 1974 issue of Motor Trends magazine'),
                
                
                p('If it is assumed that  weight,  number of cylinders, and the volume, or displacement, of the car are related to the fuel efficency of a car. Fuel eficiency  can then be predicted based on this model for a user given Displacement, Number of Cylinders and Weight. Source code for the application is available at ', a(href="https://github.com/dibakarray/CourseProjectShiny","github.")),
                style = "background-color: #98f5ff;"
        ),
        
        tabPanel( "Help",
                h3('How to Use',style = "background-color: #98f5ff;"),
                h4('The prediction of Fuel efficiency is based on an underlying multiple linear regression model on mtcars dataset.', style = "font-family: 'Open-Sans';"),
                h4('A simple user interface is available to user who wants to find out or explore Fuel Efficiency (miles per gallon) for a given set of input - displacement, number of cylinders and weight of the car. ',style = "font-family: 'Open-Sans';"),
                h4('Change Displacement',style = "background-color: #ff7f24;color: #FFFFFF;style = font-family: 'Lora';"),
                h4('The user need to change the Displacement by clicking the Displacement  numeric input widget. The input will increase/decrease by 10 unit with each click.',style = "font-family: 'Open-Sans';"),
                h4('Change No of Cylinder',style = "background-color: #ff7f24;color: #FFFFFF;style = font-family: 'Lora';"),
                h4(' Similarly, to provide a input of a different number of Cylinder, the user needs to click the "Number of cyliders" numericc input widget. Allowed values are 4, 6 and 8 cylinders.',style = "font-family: 'Open-Sans';"),
                h4('Change Weight of the Vehicle',style = "background-color: #ff7f24;color: #FFFFFF;style = font-family: 'Lora';"), 
                h4(' In order to input weight of the car,user needs to move "Weight" slider right and left. Slider takes values from 1500 to 5500 Ibs.', style = "font-family: 'Open-Sans';"),
                h4('As the Inputs are  changed  on the side panel the user can see  on the main panel changed inputs and the predicted Fuel efficinecy in miles per gallon for the new input set.',style = "font-family: 'Open-Sans';")
        )
      )
      
    
    )
))