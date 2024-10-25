library(showtext)

font_add_google("Open Sans")
showtext_auto()

theme_reason <- function(base_line_size = 0.5,
                         base_family = "Open Sans",
                         base_size = 13) {
  theme_minimal(base_family = base_family,
                base_size = base_size,
                base_line_size = base_line_size) %+replace%
    theme(
      # line = element_line(linewidth = base_line_size),
      # axis.line.x = element_line(),
      axis.ticks = element_line(),
      panel.grid = element_blank(),
      # panel.grid.major.y = element_line(color = "grey92"),
      legend.position = "top",
      plot.title = element_text(face = "bold", 
                                size = 18, 
                                margin = margin(b = 10),
                                hjust = 0),
      plot.subtitle = element_text(size = 12,
                                   hjust = 0,
                                   margin = margin(b = 5)),
      plot.caption = element_text(
        color = "gray30",
        size = rel(0.7),     
        hjust = 1,           
        vjust = 1,
        margin = margin(5.5, 0, 0, 0),
        inherit.blank = T
      )
    )
}


# p <- ggplot(mtcars, aes(mpg, wt)) +
#   geom_point() +
#   theme_minimal()
#   
# p

