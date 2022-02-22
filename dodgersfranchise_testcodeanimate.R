# Harold Lanham and Kathryn Nuttall
# Draft Date 19 Feb 2022

# Why does a pitcher raise one leg when he throws the ball?
# If he raised them both, he’d fall down.

library(ggplot2)
library(gganimate)
library(tidyverse)
library(dplyr)


hitting <- read_csv("https://github.com/haroldlanham/history_of_dodgers_franchise/raw/main/dodgers_hitting.csv")


# bubble plot
p <- ggplot(data = hitting,
       aes(x=BB, 
           y=AB 
           )) +
  geom_point(alpha=0.7) +
  scale_x_log10() +
  theme_bw() +
  
  labs(title = 'Year: {frame_time}', 
       x = 'BB', 
       y = 'AB') +
  transition_time(Year) +
  ease_aes('linear')

print(summary(hitting))

anim_save(animation = p, "hitting.gif")