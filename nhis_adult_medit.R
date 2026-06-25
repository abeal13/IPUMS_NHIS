source("utils.R")
load("adult_nhis_data.RData")

# RELMEDYR "During the past 12 months, did you use meditation?"

medt_yes <- getCount(adult_nhis_data, adult_nhis_data$RELMEDYR, 2)
medt_no <- getCount(adult_nhis_data, adult_nhis_data$RELMEDYR, 1)

medt_yes # n = 4967
medt_no # n = 21593 
# total  26,560
## QUESTION: should total actually be the total of 
#all types of responses? i.e. 1-5?

getPercentage(adult_nhis_data, adult_nhis_data$RELMEDYR, 2)
# 17.963 % of adults in our sample have answered 'yes' to having done meditation
# in the past 12 months 

medit_df <- adult_nhis_data |> 
  filter(RELMEDYR != 0) |>
  select(RELMEDYR)

ggplot(medit_df, aes(factor(RELMEDYR, levels = c(1, 2, 7, 8, 9)))) +
  geom_bar(fill = "navy", stat = "count", show.legend = FALSE) +
  scale_x_discrete(
    "Response to RELMEDYR", 
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
    x = "Response to RELMEDYR", 
    y = "Count for Responses", 
    title = "During the past 12 months, did you use meditation?"
  ) + 
  theme_classic() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1)
  )


# RELMEDPAIN: in the past 12 months have you practiced meditation for pain? 

medt_pain_yes <- getCount(adult_nhis_data, adult_nhis_data$RELMEDPAIN, 2)
medt_pain_no <- getCount(adult_nhis_data, adult_nhis_data$RELMEDPAIN, 1)

medt_pain_yes # n = 931
medt_pain_no # n = 4032

medt_pain_per <- medt_pain_yes / medt_yes

# 18.74 % of the 4967 people who answered yes to having practiced meditation 
# in the past 12 months reported practicing meditation for pain. 
