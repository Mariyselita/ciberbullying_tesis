install.packages("tidyverse")

library(dplyr)  # Para count() y arrange()
library(ggplot2) # Para los gráficos

# Cargar los datos
datos <- CB_data_sentiment_analysis_based_rules

sentiment_counts <- datos %>% 
  count(Sentiment) %>% 
  arrange(desc(n))

print(sentiment_counts)


# Calcular porcentajes igual que antes
sentiment_counts <- sentiment_counts %>%
  dplyr::mutate(Porcentaje = round(n / sum(n) * 100, 1))

colores <- c("Positive" = "#619CFF", "Negative" = "#F8766D", "Neutral" = "#00BA38")

# Gráfico
ggplot(sentiment_counts, aes(x = reorder(Sentiment, n), y = n, fill = Sentiment)) +
  geom_bar(stat = "identity", width = 0.5) +
  coord_flip() +
  geom_text(
    aes(label = paste0(scales::comma(n), "\n(", Porcentaje, "%)")),
    hjust = -0.2,
    size = 4,
    color = "#060606"
  ) +
  scale_fill_manual(values = colores) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.15))) +
  labs(
    title = "",
    x = "",
    y = "Frecuencia \n (Porcentajes)",
    fill = "Sentimiento"
  ) +
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
  # Línea negra como "doble borde" debajo del strip
  theme(
    plot.margin = margin(10, 10, 10, 10),
    panel.grid.major.y = element_blank()
  ) +
  facet_grid(~"Conteo para la variable Sentimiento")



