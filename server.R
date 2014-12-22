library(shiny)

testOfProportions <- function(nCQ, nRQ, aCQ, aRQ, alpha) {
        CQprop <- aCQ / nCQ
        RQprop <- aRQ / nRQ
        totProp <-  (aCQ + aRQ) / (nCQ + nRQ)
        prop <- (1-totProp) * totProp
        propCQ <- prop / nCQ
        propRQ <- prop / nRQ
        denom <- sqrt(abs(propCQ + propRQ))
        numer <- CQprop - RQprop
        z <- numer / denom
        pval <- pnorm(abs(z), lower.tail = FALSE)
        return(round(pval,3))
}

resultStatement <- function(nCQ, nRQ, aCQ, aRQ, alpha) {
        CQprop <- aCQ / nCQ
        RQprop <- aRQ / nRQ
        totProp <-  (aCQ + aRQ) / (nCQ + nRQ)
        prop <- (1-totProp) * totProp
        propCQ <- prop / nCQ
        propRQ <- prop / nRQ
        denom <- sqrt(abs(propCQ + propRQ))
        numer <- CQprop - RQprop
        z <- numer / denom
        pval <- pnorm(abs(z), lower.tail = FALSE)
        result <- ifelse(pval <= alpha, 
                         "Artifacts differ significantly from random. Possible faking during testing.", 
                         "Artifacts are not signficantly different from random.")
        return(result) 
}

shinyServer(
        function(input, output) {
                 output$Opval <- renderPrint({testOfProportions(input$nCQ,
                                          input$nRQ,
                                          input$aCQ,
                                          input$aRQ,
                                          input$alpha)})
                output$Oresult <- renderPrint({resultStatement(input$nCQ,
                                                               input$nRQ,
                                                               input$aCQ,
                                                               input$aRQ,
                                                               input$alpha)})
        }
)

