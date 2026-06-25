setwd("/Users/anthonybeal/Desktop/Comp_Code_DataSci/Biostats/NHIS/")
source("utils.R")
load("adult_nhis_data.RData")

# "Have you EVER been told by a doctor or other health professional that you had
# ...Some form of arthritis, rheumatoid arthritis, gout, lupus, or fibromyalgia (fy-bro-my-AL-jeeuh)?"

adult_arth_yes <- getCount(adult_nhis_data, adult_nhis_data$ARTHGLUPEV, 2)
adult_arth_no <- getCount(adult_nhis_data, adult_nhis_data$ARTHGLUPEV, 1)

print(adult_arth_yes) # n = 7296 
print(adult_arth_no) # n = 20303

getPercentage(adult_nhis_data, adult_nhis_data$ARTHGLUPEV, adult_arth_yes) 
# 26.386 %
getPercentage(adult_nhis_data, adult_nhis_data$ARTHGLUPEV, adult_arth_no) 
# 73.426 %
  
acu_arth <- adult_nhis_data |> 
  filter(ACUYR == 2, ARTHGLUPEV == 2) |> 
  summarise(count = n())
  # 229 people who answered yes to ACUYR and ARTHGLUPEV


arth_df <- adult_nhis_data |> 
  select(ARTHGLUPEV)

# this plot shows the answers to ARTHGLUPEV as a bar graph 
# for some reason it only shows 4 of the 6 possible answers 
ggplot(arth_df, aes(factor(ARTHGLUPEV, levels = c(1, 2, 7, 8, 9)))) +
  geom_bar(fill = "navy", stat = "count", show.legend = FALSE) +
  scale_x_discrete(
    "Response to ARTHGLUPEV", 
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
    x = "Response to ARTHGLUPEV", 
    y = "Count for Responses", 
    title = "Have you EVER been told by a doctor or other health professional that you had
 \nSome form of arthritis, rheumatoid arthritis, gout, lupus, or fibromyalgia (fy-bro-my-AL-jeeuh)?"
  ) + 
  theme_classic() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1)
  )
