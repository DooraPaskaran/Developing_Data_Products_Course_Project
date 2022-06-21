library(shiny)
library(UsingR)
data(father.son)

shinyServer(function(input, output) {

        model <- lm(sheight~fheight, data = father.son)

        modelpred <- reactive({
                fatherHeightInput <- input$inputFatherHeight
                predict(model, newdata= data.frame(fheight=fatherHeightInput))
        })


        output$plot <- renderPlot({
                fatherHeightInput <- input$inputFatherHeight

                plot(father.son$fheight, father.son$sheight, xlab = "Father's Height", ylab = "Son's Height")
                if(input$showModel){
                        abline(model,lwd=2,col="blue")
                }
                points(fatherHeightInput, modelpred(),col="red", pch=16)


        })

        output$pred <- renderText({modelpred()})


})
