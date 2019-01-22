
library(shiny)
library(tidyverse)
library(ggthemes)
library(lubridate)

ui <- fluidPage(
   
   # Application title
   titlePanel("Uncertainty in returns"),
   
   # Sidebar with input
   sidebarLayout(
      sidebarPanel(
         sliderInput("begin_year",
                     "Start Year:",
                     min = 1926,
                     max = 2017,
                     value = 1926,
                     sep = ""),
         sliderInput("end_year",
                     "End Year:",
                     min = 1926,
                     max = 2017,
                     value = 2017,
                     sep = "")
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("timePlot"),
         plotOutput("distPlot")
      )
   )
)

# Define server logic required 
server <- function(input, output) {
  

  sp500 <- read_csv("sp500.csv", col_types = cols(caldt = col_date(format = "%m/%d/%Y")))
  bonds <- read_csv("bonds.csv", col_types = cols(caldt = col_date(format = "%Y%m%d")))
  sp500_clean <- sp500 %>% right_join(bonds) %>% 
    rename(sp500_vw = vwretd, bond = t30ret) %>%
    mutate( year = year(caldt)) %>%
    group_by(year) %>%
    mutate(lgross_ret_sp500 = log(sp500_vw+1),
           lgross_ret_bond  = log(bond + 1)) %>%
    summarize(annual_ret = exp(sum(lgross_ret_sp500, na.rm=TRUE)) - exp(sum(lgross_ret_bond, na.rm=TRUE))) %>% 
    filter(year != 2018 & year != 1925)
  min_ret <- min(sp500_clean$annual_ret)
  max_ret <- max(sp500_clean$annual_ret)
 
  x <- reactive({
    sp500_clean %>% filter(year >= input$begin_year & year <= input$end_year)
  })
   output$timePlot <- renderPlot({
      ggplot(data = x(), aes(y=annual_ret, x=year)) + 
        geom_line( color = "#0f4d92") +
        geom_hline(yintercept = mean(x()$annual_ret), color = "#0f4d92") + 
        geom_hline(yintercept = mean(sp500_clean$annual_ret), color = "red") +
        annotate("text", label = paste(c("Sample Average:", round(mean(x()$annual_ret),3)), collapse = " "), 
                 x = input$end_year - 10, 
                 y = max_ret, size = 5, 
                 color = "#0f4d92") +
        annotate("text", label = paste(c("Overall Average:", round(mean(sp500_clean$annual_ret),3)), collapse = " "), 
                 x = input$end_year - 10, 
                 y = max_ret-.07, size = 5, 
                 color = "red") +
        theme_minimal() +
        theme(text = element_text(size=24, 
                                  family="News Cycle")) + 
        ylab("Annual Excess Returns") +
        xlab("Time") +
        scale_fill_viridis_d(guide=FALSE) +
        ylim(c(min_ret, max_ret))
   })
   
   output$distPlot <- renderPlot({
     data <- x()
     data <- data %>% 
       summarize(mean_val = mean(annual_ret), mean_se = sd(annual_ret) / sqrt(n()), sd = sd(annual_ret)) 
     data2 <- tibble(mean_dist = rnorm(10000, data$mean_val,data$mean_se)) %>%
                     #dist = rnorm(10000, data$mean_val, data$sd)) %>%
       gather(name, val)
     ggplot(data = data2) + 
       geom_density(aes(x=val,  fill=name),  alpha = 0.1)  +
       geom_vline(xintercept = mean(x()$annual_ret), color = "#0f4d92") + 
       geom_vline(xintercept = mean(sp500_clean$annual_ret), color = "red") +
       theme_minimal() +
       theme(text = element_text(size=24, 
                                 family="News Cycle")) + 
       ylab("") +
       xlab("Annual Returns") + 
       xlim(c(0,.15)) + 
       scale_fill_viridis_d(guide=guide_legend(""), labels = c("Average Excess Returns", "Average Return"))
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

