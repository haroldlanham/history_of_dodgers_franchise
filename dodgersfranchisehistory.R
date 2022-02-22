# Harold Lanham and Kathryn Nuttall
# Draft Date 19 Feb 2022

# Why does a pitcher raise one leg when he throws the ball?
# If he raised them both, he’d fall down.

library(ggplot2)
library(gganimate)
library(tidyverse)
library(dplyr)

fh <- read_csv("https://github.com/haroldlanham/history_of_dodgers_franchise/raw/main/dodgers_full_franchise_record.csv")

hitting <- read_csv("https://github.com/haroldlanham/history_of_dodgers_franchise/raw/main/dodgers_hitting.csv")

pitching <- read_csv("https://github.com/haroldlanham/history_of_dodgers_franchise/raw/main/dodgers_pitching.csv")

# Bubble plot
ggplot(hitting, aes(x=BB, y=AB, size = Year)) +
  geom_point(alpha=0.3)

ggsave("dodgersbatting.pdf")