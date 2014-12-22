library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("Test of Proportions for random artifacts and faking during polygraph testing"),
        sidebarPanel(
                numericInput('nCQ', 'Enter the number of presentations of comparison stimuli', 9,
                             min = 9, max = 20, step = 1),
                numericInput('nRQ', 'Enter the number of presentations of the investigation target stimuli', 9, 
                             min = 6, max = 20, step = 1),
                numericInput('aCQ', 'Enter the number of artifacts observed at comparison stimuli', 4,
                             min = 9, max = 20, step = 1),
                numericInput('aRQ', 'Enter the number of rtifacts observed at relevant target stimuli', 2, 
                             min = 6, max = 20, step = 1),
                numericInput('alpha', 'Enter the alpha level or tollerance for error', .05, 
                             min = 6, max = 20, step = .01),            
                submitButton('Submit')
                ),
        mainPanel(
               h3('Documentation'),
                p('This application will calculate the test of proportions as a measure of probability that observed artifacts have occured during polygraph testing as consistent with what would be expected due to random chance.'),
               p('Enter the number of presentations of comparison and target stimuli. Then enter the number of artifacts observed at the comparison and target stimuli.'),
                p('This app will calculate the test of proportions using the input values.'),
               p('Additional information can be found at http://rpubs.com/rnelson/51922'),
                h4('p-value'),
                verbatimTextOutput("Opval"),
                h4('Results'),
                strong(verbatimTextOutput("Oresult"))
                
                )
        ))