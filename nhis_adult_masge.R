source("utils.R")
load("adult_nhis_data.RData")

# MASYR: in past 12 months have you seen a practitioner of massage? 

msg_yes <- getCount(adult_nhis_data, adult_nhis_data$MASYR, 2)
msg_no <- getCount(adult_nhis_data, adult_nhis_data$MASYR, 1)

msg_yes # n = 3136
msg_no  # n = 23443

# total = 26579

getPercentage(adult_nhis_data, adult_nhis_data$MASYR, 2)
# 11.341 % of adults in our sample have answered 'yes' to having had acupuncture
# in the past 12 months 

masge_df <- adult_nhis_data |> 
  filter(MASYR != 0) |> 
  select(MASYR)

ggplot(masge_df, aes(factor(MASYR, levels = c(1, 2, 7, 8, 9)))) +
  geom_bar(fill = "navy", stat = "count", show.legend = FALSE) +
  scale_x_discrete(
    "Response to MASYR",
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
    x = "Response to MASYR", 
    y = "Count for Responses", 
    title = "During the past 12 months, \ndid you see a practitioner of massage?"
  ) + 
  theme_classic() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1)
  )


# MASPAIN: in past 12 months have you seen a practitioner of massage for pain? 
msg_pain_yes <- getCount(adult_nhis_data, adult_nhis_data$MASPAIN, 2)
msg_pain_no <- getCount(adult_nhis_data, adult_nhis_data$MASPAIN, 1)

msg_pain_yes # n = 1701
msg_pain_no # n = 1433

# total = 3134

msg_pain_per <- msg_pain_yes / msg_yes

# 54.24% of the 3136  people who answered yes to using massage therapy in the  
# past year, reported seeing a massage therapist for pain management. 

