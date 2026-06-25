source("utils.R")
load("adult_nhis_data.RData")

# YTQYOGYR: Have you practiced yoga in the past 12 months? 

yog_yes <- getCount(adult_nhis_data, adult_nhis_data$YTQYOGYR, 2)
yog_no <- getCount(adult_nhis_data, adult_nhis_data$YTQYOGYR, 1)

yog_yes # n = 4291
yog_no # n = 22264

getPercentage(adult_nhis_data, adult_nhis_data$YTQYOGYR, 2)
# 15.518 % of adults in our sample have answered 'yes' to having practiced 
# yoga in the past 12 months 

yog_df <- adult_nhis_data |> 
  filter(YTQYOGYR != 0) |> 
  select(YTQYOGYR)

ggplot(yog_df, aes(factor(YTQYOGYR, levels = c(1, 2, 7, 8, 9)))) +
  geom_bar(fill = "navy", stat = "count", show.legend = FALSE) +
  scale_x_discrete(
    "Response to YTQYOGYR", 
    drop = FALSE, 
    labels = c(
      "1" = "No", 
      "2" = "Yes", 
      "7" = "Unknown-refused", 
      "8" = "Unknown-not ascertained", 
      "9" = "Unknown-don't know"
    )
  ) + 
  scale_y_continuous(limits = c(0, 30000)) + 
  labs(
    x = "Response to YTQYOGYR", 
    y = "Count for Responses", 
    title = "During the past 12 months, \ndid you practice yoga?"
  ) + 
  theme_classic() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1)
  )


# YTQYOGPAIN: in the past 12 months have you used yoga for pain? 

yog_pain_yes <- getCount(adult_nhis_data, adult_nhis_data$YTQYOGPAIN, 2)
yog_pain_no <- getCount(adult_nhis_data, adult_nhis_data$YTQYOGPAIN, 1)

yog_pain_yes # n = 1290
yog_pain_no # n = 3000

yog_pain_per <- yog_pain_yes / yog_yes
# 30.1% of the 4291 people who answered yes to practicing yoga in the past year, 
# reported practicing yoga for pain management. 
