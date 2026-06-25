setwd("/Users/anthonybeal/Desktop/Comp_Code_DataSci/Biostats/NHIS/")
source("utils.R")
load("adult_nhis_data.RData")

# ACUYR "During the past 12 months, did you see a practitioner of acupuncture?"

acu_yes <- getCount(adult_nhis_data, adult_nhis_data$ACUYR, 2)
acu_no <- getCount(adult_nhis_data, adult_nhis_data$ACUYR, 1)

acu_yes # n = 665
acu_no # n = 25913 
# total  27,651

getPercentage(adult_nhis_data, adult_nhis_data$ACUYR, 2)
# 2.405 % of adults in our sample have answered 'yes' to having had acupuncture
# in the past 12 months 

acu_df <- adult_nhis_data |> 
  select(ACUYR, ACUPAIN) 

p_acuyr <- ggplot(acu_df, aes(factor(ACUYR, levels = c(1, 2, 7, 8, 9)))) +
  geom_bar(fill = "navy", stat = "count", show.legend = FALSE) +
  scale_x_discrete(
    "Response to ACUYR", 
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
    x = "Response to ACUYR", 
    y = "Count for Responses", 
    title = "During the past 12 months, \ndid you see a practitioner of acupuncture?"
  ) + 
  theme_classic() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1)
  )
  
print(p_acuyr)
# ACUPAIN "During the past 12 months, did you see a practitioner of acupuncture
# ...to treat or manage physical pain?"

acu_pain_yes <- getCount(adult_nhis_data, adult_nhis_data$ACUPAIN, 2)
acu_pain_no <- getCount(adult_nhis_data, adult_nhis_data$ACUPAIN, 1)

# 0f the adults who answered 'yes' to ACUYR above
acu_pain_yes # n = 502 
acu_pain_no # n = 163


acu_pain_per <- acu_pain_yes / acu_yes
# 75.49% of the 665 people who answered yes to using acupuncture in the past year, 
# reported seeing an acupuncturist for pain management. 



# here I am filtering out the values that are 0 or NIU so that they don't 
# show up in the plot
acu_pain_df <- adult_nhis_data |> 
  filter(ACUPAIN != 0) |> 
  select(ACUPAIN) 


p_acupain <- ggplot(acu_pain_df, aes(factor(ACUPAIN, levels = c(1, 2, 7, 8, 9)))) +
  geom_bar(fill = "navy", stat = "count", show.legend = FALSE) +
  scale_x_discrete(
    "Response to ACUPAIN", 
    drop = FALSE, 
    labels = c(
      "1" = "No", 
      "2" = "Yes", 
      "7" = "Unknown-refused", 
      "8" = "Unknown-not ascertained", 
      "9" = "Unknown-don't know"
    )
  ) + 
  labs(
    x = "Response to ACUPAIN", 
    y = "Count for Responses", 
    title = "During the past 12 months, \ndid you see a practitioner of acupuncture to treat or manage physical pain?"
  ) + 
  theme_classic() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1)
  )

print(p_acupain)
