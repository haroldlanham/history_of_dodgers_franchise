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

p <- ggplot(fh, aes(x=W, y=L, size = W_L, color = Lg
)) + # give the plot a name at the beginning of this line, I chose "anim"
  geom_point(alpha=0.5, color="dodgerblue4") +
  scale_size(range = c(.1, 5), name="Wins_Losses") +
  # scale_color_ft() + # not relevant bc you set the color directly
  # scale_fill_gradient()+ # not relevant because you don't have a fill aesthetic
  theme_ipsum() + # all these lines (31-35 and the labs statements) should be part of making anim
  theme(legend.position="right") +
  # ylab("L") + # these are redundant bc included in the labs() stmt below
  # xlab("W") +
  labs(#title = 'Year: {frame_time}', 
    x = 'W', 
    y = 'L')

# end of the static graph; other stuff goes in an anim 
# (these can also be combined, many tutorials do)

anim <- p +
  transition_time(Year) +
  labs(title = 'Year: {frame_time}')
ease_aes('elastic')

# print(summary(fh))
# print(summary(hitting))
# print(summary(pitching))

animate(anim, nframes=nrow(fh), # the default is 100 frames but you want one frame per year.
        renderer = gifski_renderer())
anim_save('dodgers.gif')

ggsave("dodgers.pdf")