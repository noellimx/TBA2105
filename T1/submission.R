
library("ggplot2")
library("dplyr")
# s
gplay <- read.csv("googleplaystore.csv")
# b
gplay_without_any_na <- na.omit(gplay)

# c
installs__ <- gsub(",", "", gplay_without_any_na$Installs)
clean_Installs <- as.numeric(gsub("\\+", "", installs__))
gplay_without_any_na$Installs <- clean_Installs

gplay_without_any_na$log10Reviews <- log10(gplay_without_any_na$Reviews)
clean_gplay <- gplay_without_any_na


# d
plot_gplay_y_Reviews_x_Rating <- ggplot(data = clean_gplay, aes(y = Reviews, x = Rating)) +
    geom_point()
print(plot_gplay_y_Reviews_x_Rating)

# e
plot_gplay_y_logReviews_x_Rating <- ggplot(data = clean_gplay, aes(y = log10Reviews, x = Rating)) +
    geom_point()
print(plot_gplay_y_logReviews_x_Rating)

# f
plot_gplay_y_logReviews_x_Rating_fill_Category <- ggplot(data = clean_gplay, aes(y = log10Reviews, x = Rating, color = factor(Category))) +
    geom_point()
print(plot_gplay_y_logReviews_x_Rating_fill_Category)

# g
plot_gplay_y_logReviews_x_Rating_fill_Type <- ggplot(data = clean_gplay, aes(y = log10Reviews, x = Rating, color = factor(Type))) +
    geom_point()
print(plot_gplay_y_logReviews_x_Rating_fill_Type)

# Try generating the same scatterplot but coloring using Type. What insights can
# you derive from this scatterplot?

# Answer: Paid apps has lesser reviews

#h
clean_gplay_only_paid <- filter(clean_gplay,Type=="Paid")
clean_gplay_not_paid <- filter(clean_gplay,Type!="Paid")

#i
gplay_summary_by_category <- summarise(group_by(clean_gplay,Category),
  meanReviews = mean(Reviews),
  meanRating = mean(Rating)
)
