#Read the data and prepare data frame
fastfood <- read.csv2("fastfood.csv")
data.df<-data.frame(fastfood[1:60,1:7])#data frame(rectangular data structures)
# Calculate calories per gram and sodium per gram
data.df$calories_per_g <- data.df$caloriesKcal / data.df$servingsizeg
data.df$sodium_per_g <- data.df$sodiummg / data.df$servingsizeg

library(ggplot2)
library(dplyr)
# Restaurant distribution
table(data.df$restaurant)
# calories and sodium summary
summary(data.df$calories_per_g)
summary(data.df$sodium_per_g)
data.df %>%
  arrange(calories_per_g) %>%
  slice(c(1, n()))


# visualization for overview 
hist(data.df$calories_per_g, main="Calories per Gram Distribution", xlab="Calories per g", col="skyblue")
hist(data.df$sodium_per_g, main="Sodium per Gram Distribution", xlab="Sodium per g", col="lightpink")

# Boxplot of calories by restaurant
ggplot(data.df, aes(x = restaurant, y = calories_per_g, fill = restaurant)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Calories per gram by restaurant", x = "restaurant", y = "Calories per gram")

# Boxplot of sodium by restaurant
ggplot(data.df, aes(x=restaurant, y=sodium_per_g,fill=restaurant)) +
  geom_boxplot() +
  labs(title="Sodium per g across Restaurants")

# compare between the meat type
ggplot(data.df, aes(x = meattype, y = calories_per_g, fill = meattype)) +
  geom_violin(trim = FALSE) +
  theme_minimal() +
  labs(title = "Calories per gram by Meat Type", x = "Meat Type", y = "Calories per gram")



#Relationship with fat or serving size
ggplot(data.df, aes(x=fatg, y=calories_per_g)) +
  geom_point(color="blue") +
  geom_smooth(method="lm") +
  labs(title="Relationship between Fat and Calories per g")

