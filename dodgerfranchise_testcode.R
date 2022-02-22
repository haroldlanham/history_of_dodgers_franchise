# Harold Lanham and Kathryn Nuttall
# Draft Date 19 Feb 2022

# Why does a pitcher raise one leg when he throws the ball?
# If he raised them both, he’d fall down.

library(ggplot2)
library(gganimate)
library(tidyverse)
library(dplyr)
library(hrbrthemes)
library(viridis)
library(viridisLite)

hitting <- read_csv("https://github.com/haroldlanham/history_of_dodgers_franchise/raw/main/dodgers_hitting.csv")


# Bubble plot please work
hitting %>%
  arrange(desc(Year)) %>%
  mutate(BB = BB/AB)
ggplot(hitting, aes(x=BB, y=AB, size = Year, color = OPS)) +
  geom_point(alpha=0.5, color="blue") +
  scale_size(range = c(.1, 5), name="Batting") +
  scale_color_ft() +
  theme_ipsum() +
  theme(legend.position="bottom") +
  ylab("AB") +
  xlab("BB") +
  theme(legend.position = "none")

ggsave("dodgersbatting1.pdf")