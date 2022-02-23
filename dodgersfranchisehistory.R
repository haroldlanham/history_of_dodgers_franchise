# Harold Lanham and Kathryn Nuttall
# Draft Date 23 Feb 2022

# Why does a pitcher raise one leg when he throws the ball?
# If he raised them both, he’d fall down.

library(ggplot2)
library(gganimate)
library(tidyverse)
library(dplyr)
library(hrbrthemes)
library(viridis)
library(viridisLite)

fh <- read_csv("https://github.com/haroldlanham/history_of_dodgers_franchise/raw/main/dodgers_full_franchise_record.csv")

hitting <- read_csv("https://github.com/haroldlanham/history_of_dodgers_franchise/raw/main/dodgers_hitting.csv")

pitching <- read_csv("https://github.com/haroldlanham/history_of_dodgers_franchise/raw/main/dodgers_pitching.csv")

# Bubble plot please work
fh %>%
  arrange(desc(Year)) %>%
  mutate(W_L = W/L)
ggplot(fh, aes(x=W, y=L, size = Year, color = W_L)) +
  geom_point(alpha=0.5, color="blue") +
  scale_size(range = c(.1, 5), name="Wins_Losses") +
  scale_color_ft() +
  theme_ipsum() +
  theme(legend.position="bottom") +
  ylab("L") +
  xlab("W") +
  theme(legend.position = "none")

labs(title = 'Year: {frame_time}', 
     x = 'W', 
     y = 'L') +
  transition_time(Year) +
  ease_aes('linear')

print(summary(fh))
print(summary(hitting))
print(summary(pitching))

anim_save(animation = p, "franchise_w_l.gif")