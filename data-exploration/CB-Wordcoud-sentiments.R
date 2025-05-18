# Cargar librerías necesarias
library(tidyverse)
library(tidytext)
library(wordcloud)
library(RColorBrewer)
library(showtext)

font_add("Century Gothic", 
         regular = "C:/Users/marie/OneDrive/Escritorio/MOCIBA/Century Gothic/CenturyGothic.ttf", 
         bold = "C:/Users/marie/OneDrive/Escritorio/MOCIBA/Century Gothic/centurygothic_bold.ttf")
showtext_auto() # Activa el soporte para fuentes personalizadas

# Cargar los datos
datos <- CB_data_sentiment_analysis_based_rules

# Separar palabras de posts positivos y negativos
palabras_positivas <- datos %>%
  filter(Sentiment == "Positive") %>%
  unnest_tokens(palabra, text_filtered) %>%  # text_filtered (sin stopwords)
  count(palabra, sort = TRUE)

palabras_negativas <- datos %>%
  filter(Sentiment == "Negative") %>%
  unnest_tokens(palabra, text_filtered) %>%
  count(palabra, sort = TRUE)

# Generar nubes de palabras
par(mfrow = c(1, 2))  # Para dividir el panel gráfico en 1 fila y 2 columnas

# Nube para posts positivos
wordcloud(
  words = palabras_positivas$palabra,
  freq = palabras_positivas$n,
  max.words = 50,
  colors = brewer.pal(8, "Dark2"),
  scale = c(3, 0.8),
  main = "Palabras en posts POSITIVOS"
)

# Nube para posts negativas
wordcloud(
  words = palabras_negativas$palabra,
  freq = palabras_negativas$n,
  max.words = 50,
  colors = brewer.pal(8, "Set1"),
  scale = c(3, 0.8),
  main = "Palabras en posts NEGATIVOS"
)