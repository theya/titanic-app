library(shiny)

# Define UI for Titanic application
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Would you survive from the Titanic disaster?"),
    
    # Sidebar with widget inputs
    sidebarLayout(
        position = "left",
        sidebarPanel(
            h1("Welcome on board!"),
            p("Find out the chances you would have to survive if you were a passenger of the Titanic."),
            
            h3("Step 1:"),
            selectInput("sex",
                        label = h4("What's your gender?"),
                        choices = list("Female",
                                       "Male"),
                        selected = 1),
            
            h3("Step 2:"),
            numericInput("age",
                         label = h4("How old are you?"),
                         value = 0),
            
            h3("Step 3:"),
            radioButtons("class",
                        label = h4("What class would you choose?"),
                        choices = list("Having dinner with the captain" = 1,
                                       "Enjoying the fresh trip" = 2,
                                       "Dancing with Jack" = 3,
                                       "Seconding the Chief Mate" = 4),
                        selected = 3),
            
            br(),
            
            submitButton("Embark")
        ),
        
        mainPanel(
            
            img(src = "sinking-ship.gif", 
                height = 100, 
                width = 100, 
                style = "display: block; margin-left: auto; margin-right: auto;"),
            
            br(),
            br(),
            
            uiOutput("selection", align = "center"),
            
            br(),
            
            h4("Would you have survived?", align = "center"),
            uiOutput("prediction", align = "center"),
            
            br(),
            br(),
            
            img(src = "giphy.gif", style = "display: block; margin-left: auto; margin-right: auto;"),
            
            br(),
            br(),
            
            h3("Need help?"),
            helpText("Don't pay attention to the first results that are displayed. They correspond to the default inputs", 
                     br(),
                     "Follow the three steps in the left sidebar of this page. You will have to enter a gender, an age and a class.", 
                     br(),
                     "Then click on the 'Embark' button to submit your inputs. For information, there is no data collected on this page.",
                     br(),
                     "See how your inputs are converted on the right and read the answer you were waiting for! (PS: The answer is not 100% accurate...)")
        )
    )
))