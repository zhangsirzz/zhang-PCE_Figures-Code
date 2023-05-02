data <- read.csv("Stage1.csv",header = T,row.names = 1)

library(ggplot2)

library(plotly)


# we create the ternary plot using plotly
p1<- plot_ly(
  data, a = ~`AA`, b = ~`BB`, c = ~`DD`,
  color = ~`Clusters`, type = "scatterternary", colors=c("#8A2F2D","#ffbe0b","#E53A40",
                                                         "#8d99ae","#BAC44C","#F17F42",
                                                         "#ff0054","#00b9f1","blue","#9F47BA"),
  size = ~Total,
  text = ~paste('AA:',sep='', round(`AP`,1),'%',
                '<br>BB:',round(`BP`,1),'%',
                '<br>DD:',round(`DP`,1),'%',
                '<br>Genes:', `Genes`, hoverinfo="text",
                '<br>Clusters:', `Clusters`),
  marker = list(symbol = 'circle', opacity=0.55, sizemode="diameter", sizeref=1.5,
                line = list(width = 2, color = '#FFFFFF')))%>%
  layout(ternary=list(aaxis=list(title="AA"),
                 baxis = list(title="BB"),
                 caxis = list(title="DD")))

p1