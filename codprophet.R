#Instalando os pacotes
install.packages(prophet)
install.packages(tidyquant)
install.packages(dplyr)

#lendo os pacotes
library(prophet)
library(tidyquant)
library(dplyr)

#importando o dataset
library(readxl)
historico <- read_excel("historico.xlsx",
                        col_types= c("numeric","date","text","text"))

#Modelo e previsão - período em dias
model <- prophet(historico)
future <- make_future_dataframe(model,periods = 212)
forecast <- predict(model,future)

#Plotando o gráfico
dyplot.prophet(model,forecast)

#Analisando componentes
prophet_plot_components(model,forecast)
