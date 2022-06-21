library(shiny)

shinyUI(fluidPage(

        titlePanel("Predict Son's Height from Father's Height"),

        sidebarLayout(
                sidebarPanel(
                        p("Give the father's height in below text box"),
                        numericInput("inputFatherHeight","What is the height of the father? (in Inches)", value = 60),
                        checkboxInput("showModel", "Show/Hide Model", value=TRUE)
                ),

                mainPanel(
                        h4("An analysis carried out on the linear relation between height of father and son."),
                        h4("Through a linear regression model, the height of son is predicted by height of father's."),
                        plotOutput("plot"),
                        h3("Predicted Son's Height (in Inches):"),
                        textOutput("pred"),
                )
        )
))
