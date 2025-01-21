# Análise Temporal dos Casos de Dengue em Sergipe

Este projeto visa explorar a evolução temporal dos casos de dengue no estado de Sergipe, utilizando técnicas de análise de séries temporais para identificar padrões, sazonalidade e tendências que possam auxiliar na compreensão e no combate à doença.

## Objetivos
1. Decompor a série temporal dos casos de dengue para identificar componentes de tendência, sazonalidade e ruído.
2. Realizar testes de sazonalidade para avaliar a periodicidade dos casos.
3. Aplicar o modelo ARIMA para prever casos futuros.
4. Suavizar os dados para melhor visualização e análise.
5. Calcular o **MAPE** (Mean Absolute Percentage Error) como métrica de avaliação do modelo.

## Metodologia
Os dados utilizados neste projeto foram coletados no **DATASUS** e abrangem os casos registrados de dengue no estado de Sergipe ao longo de vários anos. As etapas do projeto incluem:
- **Coleta e preparação dos dados:** tratamento de valores ausentes e formatação para análise.
- **Análise exploratória dos dados:** identificação de padrões iniciais.
- **Decomposição da série temporal:** separação em componentes (tendência, sazonalidade, ruído).
- **Modelagem ARIMA:** ajuste e avaliação do modelo.
- **Avaliação de desempenho:** cálculo do MAPE para medir a precisão do modelo.

## Ferramentas Utilizadas
- **Linguagem R:** para a análise de séries temporais e visualização dos resultados.
- **Pacotes:** `forecast`, `ggplot2`, entre outros.
- **Fontes de Dados:** DATASUS (Sistema de Informações sobre Mortalidade e Notificação).

## Resultados Esperados
Este projeto busca fornecer insights sobre a evolução dos casos de dengue em Sergipe, identificando períodos de maior incidência e possibilitando previsões que auxiliem na formulação de estratégias de saúde pública.

## Estrutura do Repositório
- `data/`: arquivos de dados brutos e tratados.
- `scripts/`: códigos em R utilizados no projeto.
- `results/`: gráficos, tabelas e outras saídas da análise.
- `report/`: relatório final detalhando as descobertas.

## Resultados
### Teste de Estacionariedade (Dickey-Fuller)
O teste ADF indicou que a série temporal suavizada é estacionária com um p-valor significativo (**p-value = 0.01**).

### Modelo ARIMA
Foram ajustados dois modelos:
1. ARIMA(3,0,2)(2,0,0)[12] com dados normais.
2. ARIMA(1,1,1)(2,0,1)[12] com dados suavizados.

Os resultados do segundo modelo apresentaram um **MAPE** de **16%**, indicando um bom ajuste.

### Visualização
Gráficos gerados mostram as previsões para os casos de dengue nos próximos 12 meses, com base nos modelos ARIMA.

## Contato
📧 **E-mail:** [Mateusramos2001@gmail.com](mailto:Mateusramos2001@gmail.com)  
🌐 **Portfólio:** [Seu Link do GitHub](https://github.com/SeuUsuario)
