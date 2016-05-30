#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(
  navbarPage("ZetaStock",
             theme="bootstrap.css",
             tabPanel(
               "Home",
               sidebarLayout(
                 tags$img(src="https://raw.githubusercontent.com/ZetaPhase/ZetaKrypt/master/ZetaKrypt/img/ZetaKrypt-logo.png", width="256", height="256"),
                 mainPanel(
                   h3(tags$p("Welcome to ZetaStock.")),
                   textInput(
                     inputId = "code",
                     label = NULL,
                     value = "",
                     width = "400px",
                     placeholder = "Please enter the company code"
                   ),
                   actionButton("go", "Go"),
                   h4(tags$p("About")),
                   htmlOutput("home"),
                   h4(tags$p("Links")),
                   tags$a(href="https://github.com/ZetaPhase/ZetaStock", "Visit the GitHub Repo"),
                   tags$br(),
                   tags$a(href="https://zetaphase.io/", "Visit our main site page")
                 )
               )
             ),
             tabPanel(
               "Open",
               mainPanel(plotOutput("openPlot"))
             ),
             tabPanel(
               "High"
             ),
             tabPanel(
               "Low"
             ),
             tabPanel(
               "Close"
             ),
             tabPanel(
               "Volume"
             ),
             tabPanel(
               "Adjusted Close"
             )
  ))
