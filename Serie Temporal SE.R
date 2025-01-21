dados <- read.csv(file.choose())
library(dplyr)
library(tidyr)
library(lubridate)

# Transformar os dados para o formato longo com 'Data' e 'Casos'
dados_longos <- dados %>%
  pivot_longer(cols = Jan:Dez, names_to = "Mes", values_to = "Casos") %>%
  mutate(Data = paste(Ano.notificação, Mes, sep = "-"),
         Data = as.Date(paste0(Data, "-01"), format = "%Y-%b-%d"))


library(zoo)
# Suavizar os dados usando uma média móvel
dados_longos$Casos_suavizados <- rollmean(dados_longos$Casos, 12, fill = NA, align = "center")


#####################################################################################################
#####################################################################################################

library(ggplot2)

# Gráfico de linha para visualizar os casos ao longo do tempo
ggplot(dados_longos, aes(x = Data, y = Casos)) +
  geom_line() +
  theme_minimal() +
  labs(title = "Casos de Dengue em Sergipe (2007-2024)",
       x = "Ano", y = "Casos de Dengue")









#####################################################################################################
#####################################################################################################
library(forecast)

# Transformar os dados para uma série temporal
ts_dengue <- ts(dados_longos$Casos, start = c(2007, 1), frequency = 12)

# Decompor a série temporal em tendência, sazonalidade e erro
decomposicao <- decompose(ts_dengue)
plot(decomposicao)




#####################################################################################################
#####################################################################################################

# Teste de Dickey-Fuller para verificar estacionariedade
library(tseries)
adf.test(ts_dengue)

# Ajustar um modelo ARIMA
modelo_arima <- auto.arima(ts_dengue)
summary(modelo_arima)

# Fazer previsões com o modelo ARIMA
previsao <- forecast(modelo_arima, h = 12) # Previsão para os próximos 12 meses
plot(previsao)

# Obter as previsões para o conjunto de treino
previsao_treino <- fitted(modelo_arima)

# Calcular o MAPE para o conjunto de treino
mape_interno <- mean(abs((dados_longos$Casos[1:length(previsao_treino)] - previsao_treino) / dados_longos$Casos[1:length(previsao_treino)]) * 100)
mape_interno






#####################################################################################################
#####################################################################################################
# Transformar os dados suavizados para uma série temporal
ts_dengue_suavizados <- ts(dados_longos$Casos_suavizados, start = c(2007, 1), frequency = 12)

# Decompor a série temporal suavizada
decomposicao_suavizada <- decompose(ts_dengue_suavizados)
plot(decomposicao_suavizada)

# Teste de Dickey-Fuller para verificar estacionariedade nos dados suavizados
# Remover valores NA antes de aplicar o teste ADF
ts_dengue_suavizados <- na.omit(ts_dengue_suavizados)
adf.test(ts_dengue_suavizados)

# Ajustar um modelo ARIMA com os dados suavizados
modelo_arima_suavizados <- auto.arima(ts_dengue_suavizados)
summary(modelo_arima_suavizados)

# Fazer previsões com o modelo ARIMA ajustado
previsao_suavizados <- forecast(modelo_arima_suavizados, h = 12) # Previsão para os próximos 12 meses
plot(previsao_suavizados)
