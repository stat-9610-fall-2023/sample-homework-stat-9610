library(tidyverse)
library(kableExtra)

############################################################
# part (a)
############################################################

# create the histogram of diamond price
p_hist <- diamonds |>
  ggplot(aes(x = price)) +
  geom_histogram(color = "black") +
  labs(x = "Price (in dollars)") +
  theme_bw()

# save plot to disk
ggsave(filename = "figures-and-tables/price-histogram.pdf",
       plot = p_hist,
       device = "pdf",
       width = 4,
       height = 3)


############################################################
# part (b)
############################################################

# compute the mean diamond price by cut
price_by_cut <- diamonds |>
  group_by(cut) |>
  summarise(mean_price = mean(price)) |>
  rename(Cut = cut, `Mean Price ($)` = mean_price)

# format and save table
price_by_cut |>
  kable(format = "latex",
        row.names = NA,
        booktabs = TRUE,
        digits = 2,
        caption = "Mean diamond price by cut.",
        label = "diamond-price-by-cut") |>
  kable_styling(latex_options = "hold_position") |>
  save_kable("figures-and-tables/diamond-price-by-cut.tex")

############################################################
# part (c)
############################################################

lm_fit <- lm(price ~ carat, data = diamonds)
stargazer(lm_fit,
          title = "Results of regressing price on carat.",
          label = "tab:regression-output",
          out = "figures-and-tables/regression-output.tex")
