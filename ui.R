library(shiny)

shinyUI(fluidPage(
  titlePanel(h1("Randomness of Returns (day trader version)")),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select inputs for this simulation. Assume values 
               are after consideration of trading fees. Default values are set to 50% winrate, 
               with $1.2 avg profit and $1 avg loss over 100 days."), 
      
      sliderInput("winRate", 
                  label = "Win Rate (% of trades that are good):", 
                  min = 0, max = 100, value = 50),
      
      numericInput("wSize", 
                  label = "Win Size (mean $ earned per good trade):", 
                  value = 1.20,
                  min = 1.00, 
                  max = 10.00,
                  step = 0.01), 
      
      numericInput("lSize",
                  label = "Loss size (mean $ lost in a bad trade):", 
                  value = 1.00,
                  min = 1.00, 
                  max = 10.00,
                  step = 0.01), 
      
      sliderInput("days", 
                  label = "Trading days in consideration:", 
                  min = 10, max = 1000, value = 100), 
      
      sliderInput("tradesPerDay", 
                  label = "Trades per day:", 
                  min = 1, max = 100, value = 1), 
      
      selectInput("runs", 
                  label = "Number of runs:",
                  choices = list("1 run" = 1, "5 runs" = 5, 
                                 "20 runs" = 20), selected = 5)
      
      
    ),
      
    mainPanel(p("Based on a ", a("paper", href="https://www.scribd.com/doc/264964196/Random-Probability-Theory-Related-to-Trading-Systems"), " by Peter L Brandt, this shiny app allows you to see how factors like win rate, bet size, 
and payout ratio does not necessarily guarantee trading success. In fact, randomness can have a 
huge factor on trading outcomes (this may seem obvious, but please read on), in both the short 
term and the long term. Having a lot of discipline and good research is, therefore, no guarantee of 
success. What could this imply for the average investor? If you are struggling to turn a profit, it 
may or may not be due wholly to your strategy. What this tells me is that a lot of proper backtesting 
is required along with live results to determine a profitable trading strategy. This may, of course, 
already be obvious to many who are already ardent backtesters, but it might still be interesting to 
see just how varied results can be with a single strategy."), 
              
              h2("Output:"), 
              textOutput("text1"), 
              plotOutput("pnl"), 
              br(),p("Update: along with the release of the ", a("Portfolio", href="https://tradingfever.shinyapps.io/randomreturns2"), " version of the app, I have updated the average gains/losses to reflect a normally distributed random sampling rather than a simple sampling, since I assume 
the investor (you) have some measure of discipline and will likely execute within something resembling a normalized price band. ", br(), br(), "
                     
                     
                     Back to ", a("TradingFever", href="http://tradingfever.com"))
              
              )
    )
))

#deployment shortcut
#require('devtools')
#require('shinyapps')
#shinyapps::setAccountInfo(name='tradingfever', token='A36F7E776986F655B9C66C1622B0D357', secret='mysecret')
#setwd('/Users/wei/workspace/randomreturns')
#deployApp()
