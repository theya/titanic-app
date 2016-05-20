library(shiny)

library(datasets)
data(Titanic)
# library(e107)
# library(caret)
library(randomForest)

Titanic <- as.data.frame(Titanic)

rows <- rep(1:nrow(Titanic) ,Titanic[ , 5])
Titanic <- Titanic[rows, -5]
Titanic$Survived <- factor(Titanic$Survived, levels = c("Yes", "No"))

set.seed(201605)
# rfGrid <- expand.grid(mtry = 2)
rfModel <- randomForest(Survived ~ ., data = Titanic, mtry = 2)


# Define server logic required
shinyServer(
    function(input, output) {
        output$selection <- renderUI({ 
            if (input$age <= 18) {
                ageSelection <- "Child"
            } else {
                ageSelection <- "Adult"
            }
            
            if (input$class == 1) {
                classSelection <- "1st"
            } else if (input$class == 2) {
                classSelection <- "2nd"
            } else if (input$class == 3) {
                classSelection <- "3rd"
            } else {
                classSelection <- "Crew"
            }

            paste("You would be a ", input$sex, ageSelection, "in", classSelection,"class.")
        })
            
        output$prediction <- renderUI({
            if (input$class == 1) {
                classSelection <- "1st"
            } else if (input$class == 2) {
                classSelection <- "2nd"
            } else if (input$class == 3) {
                classSelection <- "3rd"
            } else {
                classSelection <- "Crew"
            }
            Titanic$Class[1] = classSelection
            
            Titanic$Sex[1] = input$sex

            if (input$age <= 18) {
                ageSelection <- "Child"
            } else {
                ageSelection <- "Adult"
            }
            Titanic$Age[1] = ageSelection

            predict <- predict(rfModel, newdata = Titanic[1, 1:3])
            prob <- predict(rfModel, newdata = Titanic[1,], type = "prob")
            
            if (predict == "Yes") {
                paste("Most probably yes! With a probability:", prob[1]*100, "%")
            } else if (predict == "No") {
                paste("Most probably and unfortunately... No... With a probability:", prob[2]*100, "%")
            }
        })
    }
)


