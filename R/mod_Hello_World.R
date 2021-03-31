#' Hello_World UI Function
#'
#' @description Module to generate and display random numbers on button click.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_Hello_World_ui <- function(id){
  ns <- NS(id)
  tagList(
    #// shiny:: uses the shiny namespace
    #// ns() is required for modular shiny code
    #// First the action button is rendered and hw-button is 
    #// referenced to the server
    shiny::actionButton(ns("hw_button"), 
                        label = "Click me", 
                        icon = icon("fas fa-question-circle"),
                        width = 200),
    
    # // The textoputput will display the number. hw-display is where         
    # // the server will send data
    shiny::textOutput(ns("hw_display_number"))
  )
}
    
#' Hello_World Server Function
#'
#' @noRd 
mod_Hello_World_server <- function(input, output, session){
  ns <- session$ns
  #// use an event observer bound to the button
  #// the function we wrote is global and is called here
  #// the number is sent to the ui via hw-display_number handle
  
  shiny::observeEvent(input$hw_button, {
    output$hw_display_number <- shiny::renderText(get_random_number())
  })
}
    
## To be copied in the UI
# mod_Hello_World_ui("Hello_World_ui_1")
    
## To be copied in the server
# callModule(mod_Hello_World_server, "Hello_World_ui_1")
 
