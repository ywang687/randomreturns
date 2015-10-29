library(shiny)
require(graphics)
shinyServer(function(input, output) {
  
  output$text1 <- renderText({
    runs <- input$runs
    if (runs == 1){
    paste("You have selected ", input$runs, " run.")
    }else{
      paste("You have selected ", input$runs, " runs.")
    }
  })
  
  output$pnl <- renderPlot({
    wr <- input$winRate
    ws <- input$wSize
    ls <- input$lSize
    d <- input$days
    tpd <- input$tradesPerDay
    runs <- input$runs

    cumulateFunction <- function(d, tpd, wr, ls){
      daySum <- numeric(d)
      cumulate <- numeric(d)
      for (i in 1:d){
        for (j in 1:tpd){
          ran <- sample(1:100, 1)
          if (ran <= wr){
              unif1 <- runif(1, min = 0, max = 2*ws) #using irwin-hall distribution as a sub for a normal distribution of values, since I only want positive values
              unif2 <- runif(1, min = 0, max = 2*ws) #using n = 8 to simulate decent discipline, not a whole lot of randomness
              unif3 <- runif(1, min = 0, max = 2*ws)
              unif4 <- runif(1, min = 0, max = 2*ws)
              unif5 <- runif(1, min = 0, max = 2*ws)
              unif6 <- runif(1, min = 0, max = 2*ws)
              unif7 <- runif(1, min = 0, max = 2*ws)
              unif8 <- runif(1, min = 0, max = 2*ws)
              ran2 <- c(unif1, unif2, unif3, unif4, unif5, unif6, unif7, unif8)
              daySum[i] <-daySum[i]+mean(ran2) # need to make this a normdist random function for better simulation
          }else{
              unif1 <- runif(1, min = 0, max = 2*ls) #using irwin-hall distribution as a sub for a normal distribution of values, since I only want positive values
              unif2 <- runif(1, min = 0, max = 2*ls)
              unif3 <- runif(1, min = 0, max = 2*ls)
              unif4 <- runif(1, min = 0, max = 2*ls)
              unif5 <- runif(1, min = 0, max = 2*ls)
              unif6 <- runif(1, min = 0, max = 2*ls)
              unif7 <- runif(1, min = 0, max = 2*ls)
              unif8 <- runif(1, min = 0, max = 2*ls)
              ran2 <- c(unif1, unif2, unif3, unif4, unif5, unif6, unif7, unif8)
              daySum[i] <-daySum[i]-mean(ran2) # same as previous note
          }
        }
        cumulate[i] <- sum(daySum)
      }
      return (cumulate)
    }
    
    if (runs == 1){
      x <- c(1:d)
      y <- cumulateFunction(d, tpd, wr, ls)
      
      DF<- data.frame(1:d, matrix(c(y), ncol=1))
      colnames(DF) <- c('Day', paste0('Run', 2:ncol(DF)-1))
      DF.TS <- ts(DF[-1], start = 1, frequency = 1)
      
      ts.obj <- ts(x)
      lowess.obj <- lowess(ts.obj, f = 1)
      plot(DF.TS, plot.type = "single", ylab="Cumulative Profit and Loss ($)", col=1:ncol(DF.TS))
      legend("topleft", colnames(DF.TS), col=1:ncol(DF), lty =1, cex=1)
      
    }
    else if (runs == 5){
      x <- c(1:d)
      y <- cumulateFunction(d, tpd, wr, ls)
      y1 <- cumulateFunction(d, tpd, wr, ls)
      y2 <- cumulateFunction(d, tpd, wr, ls)
      y3 <- cumulateFunction(d, tpd, wr, ls)
      y4 <- cumulateFunction(d, tpd, wr, ls)
      
      DF<- data.frame(1:d, matrix(c(y, y1, y2, y3, y4), ncol=5))
      colnames(DF) <- c('Day', paste0('Run', 2:ncol(DF)-1))
      DF.TS <- ts(DF[-1], start = 1, frequency = 1)
      
      ts.obj <- ts(x)
      lowess.obj <- lowess(ts.obj, f = 1)
      plot(DF.TS, plot.type = "single", ylab="Cumulative Profit and Loss ($)", col=1:ncol(DF.TS))
      legend("topleft", colnames(DF.TS), col=1:ncol(DF), lty =1, cex=0.65)
      
    }
    else if (runs == 20){
      x <- c(1:d)
      #note to fix this ugly code at some point
      y <- cumulateFunction(d, tpd, wr, ls)
      y1 <- cumulateFunction(d, tpd, wr, ls)
      y2 <- cumulateFunction(d, tpd, wr, ls)
      y3 <- cumulateFunction(d, tpd, wr, ls)
      y4 <- cumulateFunction(d, tpd, wr, ls)
      y5 <- cumulateFunction(d, tpd, wr, ls)
      y6 <- cumulateFunction(d, tpd, wr, ls)
      y7 <- cumulateFunction(d, tpd, wr, ls)
      y8 <- cumulateFunction(d, tpd, wr, ls)
      y9 <- cumulateFunction(d, tpd, wr, ls)
      y10 <- cumulateFunction(d, tpd, wr, ls)
      y11 <- cumulateFunction(d, tpd, wr, ls)
      y12 <- cumulateFunction(d, tpd, wr, ls)
      y13 <- cumulateFunction(d, tpd, wr, ls)
      y14 <- cumulateFunction(d, tpd, wr, ls)
      y15 <- cumulateFunction(d, tpd, wr, ls)
      y16 <- cumulateFunction(d, tpd, wr, ls)
      y17 <- cumulateFunction(d, tpd, wr, ls)
      y18 <- cumulateFunction(d, tpd, wr, ls)
      y19 <- cumulateFunction(d, tpd, wr, ls)
      
      DF<- data.frame(1:d, matrix(c(y, y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12, y13, y14, y15, y16, y17, y18, y19), ncol=20))
      colnames(DF) <- c('Day', paste0('Run', 2:ncol(DF)-1))
      DF.TS <- ts(DF[-1], start = 1, frequency = 1)
      
      ts.obj <- ts(x)
      lowess.obj <- lowess(ts.obj, f = 1)
      plot(DF.TS, plot.type = "single", ylab="Cumulative Profit and Loss ($)", col=1:ncol(DF.TS))
      legend("topleft", colnames(DF.TS), col=1:ncol(DF), lty =1, cex=0.5)

    }
    
      
  })
  
})

