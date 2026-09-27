# Shared rink geometry for the site's ggplot figures.
# Draw order: rink_base() first, your data layer next, rink_lines() last.

pos_colors <- c("Center" = "#E74C3C", "Defense" = "#3498DB",
                "Left Wing" = "#2ECC71", "Right Wing" = "#9B59B6")

circle_path <- function(cx, cy, r, n = 100) {
  theta <- seq(0, 2 * pi, length.out = n)
  data.frame(x = cx + r * cos(theta), y = cy + r * sin(theta))
}

rink_segments <- data.frame(
  x = c(-100, 100, 0, 0, 25, 25, -25, -25, 89, 89, -89, -89),
  xend = c(-100, 100, 0, 0, 25, 25, -25, -25, 89, 89, -89, -89),
  y = c(-42.5, -42.5, -42.5, 42.5, -42.5, 42.5, -42.5, 42.5, -42.5, 42.5, -42.5, 42.5),
  yend = c(42.5, 42.5, -42.5, 42.5, -42.5, 42.5, -42.5, 42.5, -42.5, 42.5, -42.5, 42.5),
  color = c("#888888", "#888888", rep("#C0392B", 2), rep("#2980B9", 4), rep("#C0392B", 4)),
  linewidth = c(2, 2, rep(2.5, 2), rep(2.5, 4), rep(1.5, 4))
)

rink_faceoffs <- rbind(
  cbind(circle_path(69, 22, 15), id = "1"),
  cbind(circle_path(69, -22, 15), id = "2"),
  cbind(circle_path(-69, 22, 15), id = "3"),
  cbind(circle_path(-69, -22, 15), id = "4")
)

rink_creases <- rbind(
  cbind(circle_path(89, 0, 6), id = "1"),
  cbind(circle_path(-89, 0, 6), id = "2")
)

rink_base <- function() {
  list(
    geom_rect(xmin = -100, xmax = 100, ymin = -42.5, ymax = 42.5,
              fill = "#DBE8F5", color = "#888888", linewidth = 1.2,
              inherit.aes = FALSE)
  )
}

rink_lines <- function() {
  styles <- unique(rink_segments[c("color", "linewidth")])
  segments <- lapply(seq_len(nrow(styles)), function(i) {
    d <- rink_segments[rink_segments$color == styles$color[i] &
                       rink_segments$linewidth == styles$linewidth[i], ]
    geom_segment(data = d, aes(x = x, xend = xend, y = y, yend = yend),
                 color = styles$color[i], linewidth = styles$linewidth[i],
                 inherit.aes = FALSE)
  })
  c(segments, list(
    geom_polygon(data = rink_faceoffs, aes(x = x, y = y, group = id),
                 fill = NA, color = "#C0392B", linewidth = 0.8,
                 linetype = "dotted", inherit.aes = FALSE),
    geom_polygon(data = rink_creases, aes(x = x, y = y, group = id),
                 fill = ggplot2::alpha("#2980B9", 0.08), color = "#2980B9",
                 linewidth = 1, inherit.aes = FALSE)
  ))
}

hex_colours <- c("#FFFFCC", "#FED976", "#FD8D3C", "#E31A1C", "#BD0026", "#800026")

density_plot <- function(data, bins = 42, legend_name = "Shots per hex",
                         title = NULL) {
  ggplot(data, aes(arenaAdjustedXCord, arenaAdjustedYCord)) +
    rink_base() +
    stat_binhex(bins = bins, na.rm = TRUE) +
    scale_fill_gradientn(colours = hex_colours, name = legend_name) +
    rink_lines() +
    coord_equal(xlim = c(-100, 100), ylim = c(-44, 44)) +
    labs(title = title, x = NULL, y = NULL) +
    theme_void() +
    theme(
      plot.title = element_text(size = 15, face = "bold", hjust = 0.5,
                                margin = margin(b = 6)),
      legend.title = element_text(size = 11),
      legend.text = element_text(size = 10),
      strip.text = element_text(face = "bold", size = 12, margin = margin(t = 6, b = 2)),
      plot.margin = margin(10, 10, 10, 10)
    )
}
