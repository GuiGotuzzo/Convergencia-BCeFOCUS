install.packages("tidyverse")
library(tidyverse)

# Dados do Focus -> (26/12/2025)
focus <- tibble(
  ano = c(2025, 2026, 2027, 2028),
  ipca = c(4.32, 3.60, 3.25, 3.25),
  selic = c(15.00, 12.25, 10.50, 9.75)
)

# Dados do RPM 
rpm <- tibble(
  ano = c(2025, 2026, 2027, 2028),
  ipca = c(4.4, 3.5, 3.2, 3.0), 
  selic = c(15.0, 12.25, 10.5, 9.5) 
)

dados <- bind_rows(
  focus %>% mutate(fonte = "Focus"),
  rpm %>% mutate(fonte = "Banco Central")
)

# Gráfico da inflação
g_ipca <- dados %>%
  ggplot(aes(x = ano, y = ipca, color = fonte)) +
  geom_line(size = 1.3) +
  geom_point(size = 3) +
  labs(
    title = "Convergência das expectativas de inflação",
    subtitle = "Focus vs Cenário de Referência do Banco Central (Dez/2025)",
    y = "IPCA (%)",
    x = "Ano"
  ) +
  theme_minimal()

# Gráfico da Selic
g_selic <- dados %>%
  ggplot(aes(x = ano, y = selic, color = fonte)) +
  geom_line(size = 1.3) +
  geom_point(size = 3) +
  labs(
    title = "Trajetória da taxa Selic esperada",
    subtitle = "Expectativas do mercado e cenário do BC",
    y = "Selic (%)",
    x = "Ano"
  ) +
  theme_minimal()

g_ipca
g_selic
