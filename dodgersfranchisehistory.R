# Harold Lanham and Kathryn Nuttall
# Draft Date 19 Feb 2022

# Why does a pitcher raise one leg when he throws the ball?
# If he raised them both, he’d fall down.

library(ggplot2)
library(gganimate)
library(tidyverse)
library(dplyr)


hitting <- read_csv("https://github.com/haroldlanham/history_of_dodgers_franchise/raw/main/dodgers_hitting.csv")
 

# Most basic bubble plot
ggplot(hitting, aes(x=BB, y=AB, size = Year)) +
  geom_point(alpha=0.7)

ggsave("dodgersbatting.pdf")