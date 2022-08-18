library(tidyverse)

############################################################
# part (a)
############################################################

# generate the data 
n <- 1000
X <- rnorm(n)

# plot the data
p_hist <- tibble(X) %>%
  ggplot(aes(x = X)) +
  geom_histogram(color = "black") +
  theme_bw()

# save plot to disk
ggsave(filename = "figures-and-tables/normal-histogram.pdf", 
       plot = p_hist, 
       device = "pdf", 
       width = 4,
       height = 3)
