library(tidyverse)
library(ggplot2)
library(RColorBrewer)
library(extrafont)

library(showtext)

font_add("Century Gothic", 
         regular = "C:/Users/marie/OneDrive/Escritorio/MOCIBA/Century Gothic/CenturyGothic.ttf", 
         bold = "C:/Users/marie/OneDrive/Escritorio/MOCIBA/Century Gothic/centurygothic_bold.ttf")
showtext_auto() # Activa el soporte para fuentes personalizadas


# Cargar los datos
datos <- CB_data_sentiment_analysis_based_rules

# Calculamos la longitud del texto (número de caracteres)
tweets <- datos %>%
  mutate(text_length = nchar(text_cleaned),
         tokens_count = lengths(tokens))


# Encontrar el índice del texto más largo
indice_mas_largo <- which.max(nchar(tweets$text_cleaned))

# Obtener toda la fila correspondiente al texto más largo
texto_mas_largo <- tweets[indice_mas_largo, ]

# Mostrar el texto más largo y su longitud
texto_mas_largo$text_cleaned
nchar(texto_mas_largo$text_cleaned)


# Estadísticas resumidas por sentimiento
tweets %>%
  group_by(Sentiment) %>%
  summarise(
    mean_length = mean(text_length),
    median_length = median(text_length),
    sd_length = sd(text_length),
    min_length = min(text_length),
    max_length = max(text_length),
    n = n()
  )

# Prueba de correlación (si asignamos valores numéricos a sentimientos)
cor.test(tweets$text_length, tweets$sentiment_num, method = "spearman")

# Distribución de longitudes
ggplot(tweets, aes(x = text_length, fill = Sentiment)) +
  geom_histogram(binwidth = 10, position = "stack") +
  labs(title = "Distribución de longitudes de posts por sentimiento",
       x = "Longitud del post (caracteres)",
       y = "Número de posts") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set2") +
  facet_wrap(~Sentiment, ncol = 1)



# RELACIÓN ENTRE SENTIMIENTOS Y LONGITUD DE POSTS
ggplot(tweets, aes(x = Sentiment, y = text_length, fill = Sentiment)) +
  geom_boxplot() +
  labs(title = "Distribución de longitud de posts por sentimiento",
       x = "Sentimiento",
       y = "Longitud del post (caracteres)") +
  # Tema
  theme_light(base_family = "Century Gothic") +
  theme(
    plot.title = element_text(size = 10, hjust = 10),
    legend.position = "none",
    strip.placement = "outside",
    strip.background = element_rect(fill = "#E6ECF1", color = "gray80", size = 0.5),
    strip.text = element_text(face = "bold", size = 12, hjust = 0.5, color = "black"),
    panel.spacing = unit(0.1, "lines"),
    panel.border = element_rect(color = "gray85", fill = NA),
    panel.background = element_blank()
  ) +
  theme(
    plot.margin = margin(10, 10, 10, 10),
    panel.grid.major.y = element_blank()
  ) +
  facet_grid(~"Relación entre Sentimientos y Longitud de los Posts")+
  scale_fill_brewer(palette = "Set2") 