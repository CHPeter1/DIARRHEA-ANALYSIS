require(readr)
require(tidyverse)
require(magrittr)
require(ggplot2)
require(gtsummary)
require(reshape2)
require(officer)

# Load Data

library(readr)
cema_internship_task_2023 <- read_csv("C:/Users/ADMIN/Desktop/NGAIRA/cema_internship_task_2023.csv")
#View(cema_internship_task_2023)

# Data Visualization
# Plot Total Dewormed by County
ggplot(cema_internship_task_2023, aes(x = county, y = `Total Dewormed`)) +
  geom_bar(stat = "identity") +
  labs(title = "Total Dewormed by County", x = "County", y = "Total Dewormed") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Scatter plot of Acute Malnutrition vs. Total Dewormed
ggplot(cema_internship_task_2023, aes(x = `Total Dewormed`, y = `Acute Malnutrition`)) +
  geom_point() +
  labs(title = "Scatter plot of Acute Malnutrition vs. Total Dewormed",
       x = "Total Dewormed", y = "Acute Malnutrition")

# Box plot of stunted 6-23 months by County
ggplot(cema_internship_task_2023, aes(x = county, y = `stunted 6-23 months`)) +
  geom_boxplot() +
  labs(title = "Box plot of stunted 6-23 months by County",
       x = "County", y = "stunted 6-23 months") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Histogram of diarrhoea cases
ggplot(cema_internship_task_2023, aes(x = `diarrhoea cases`)) +
  geom_histogram(binwidth = 100, fill = "blue", color = "black") +
  labs(title = "Histogram of diarrhoea cases",
       x = "Diarrhoea Cases", y = "Frequency")
