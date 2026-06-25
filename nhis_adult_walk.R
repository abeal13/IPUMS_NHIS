source("utils.R")
load("adult_nhis_data.RData")

# LAWALKCLIMDIF Amount of difficulty walking or climbing steps
# Labels:
#value                   label
#0                     NIU
#1           No difficulty
#2         Some difficulty
#3     A lot of difficulty
#4        Cannot do at all
#7         Unknown-refused
#8 Unknown-not ascertained
#9      Unknown-don't know

for (i in 1:9) {
  count <- getCount(adult_nhis_data, adult_nhis_data$LAWALKCLIMDIF, i)
  print(paste(count, "people answered", i, sep = " "))
}

#"21575 people answered 1"
#"4322 people answered 2"
#"1441 people answered 3"
#"305 people answered 4"
#"0 people answered 5"
#"0 people answered 6"
#"7 people answered 7"
#"0 people answered 8"
#"1 people answered 9"

walk_df <- adult_nhis_data |> 
  filter(LAWALKCLIMDIF != 0) |>
  select(LAWALKCLIMDIF)

ggplot(walk_df, aes(factor(LAWALKCLIMDIF, levels = c(1, 2, 3, 4, 7, 8, 9)))) +
  geom_bar(fill = "navy", stat = "count", show.legend = FALSE) +
  scale_x_discrete(
    "Response to LAWALKCLIMDIF", 
    drop = FALSE,
    labels = c(
      "1" = "No difficulty", 
      "2" = "Some difficulty", 
      "3" = "A lot of difficulty", 
      "4" = "Cannot do at all",
      "7" = "Unknown-refused", 
      "8" = "Unknown-not ascertained", 
      "9" = "Unknown-don't know"
    )
  ) + 
  scale_y_continuous(limits = c(0, 30000)) + 
  labs(
    x = "Response to LAWALKCLIMDIF", 
    y = "Count for Responses", 
    title = "LAWALKCLIMDIF Amount of difficulty walking or climbing steps"
  ) + 
  theme_classic() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1)
  )


arth_walk_alot1 <- adult_nhis_data |> 
  filter(LAWALKCLIMDIF == 3, ARTHGLUPEV == 2) |> 
  summarise(count = n())
  # 1038 people who were told by a Dr. that they had ARTHGLUPEV
  # and have 'a lot of difficulty' w/ steps.  
  # (72.033 % of ppl who answered '3') 

# WALKDIF12ST1 Amount of difficulty walking up or down 12 steps
# Labels:
#value                   label
# 0                     NIU
# 1           No difficulty
# 2         Some difficulty
# 3     A lot of difficulty
# 4        Cannot do at all
# 7         Unknown-refused
# 8 Unknown-not ascertained
# 9      Unknown-don't know

for (i in 1:9) {
  count <- getCount(adult_nhis_data, adult_nhis_data$WALKDIF12ST1, i)
  print(paste(count, "people answered", i, sep = " "))
}

# "22375 people answered 1"
# "3224 people answered 2"
# "914 people answered 3"
# "458 people answered 4"
# "0 people answered 5"
# "0 people answered 6"
# "9 people answered 7"
# "0 people answered 8"
# "26 people answered 9"

steps_df <- adult_nhis_data |> 
  filter(WALKDIF12ST1 != 0) |> 
  select(WALKDIF12ST1) 


ggplot(steps_df, aes(factor(WALKDIF12ST1, levels = c(1, 2, 3, 4, 7, 8, 9)))) +
  geom_bar(fill = "navy", stat = "count", show.legend = FALSE) +
  scale_x_discrete(
    "Response to WALKDIF12ST1", 
    drop = FALSE,
    labels = c(
      "1" = "No difficulty", 
      "2" = "Some difficulty", 
      "3" = "A lot of difficulty", 
      "4" = "Cannot do at all",
      "7" = "Unknown-refused", 
      "8" = "Unknown-not ascertained", 
      "9" = "Unknown-don't know"
    )
  ) + 
  scale_y_continuous(limits = c(0, 30000)) + 
  labs(
    x = "Response to WALKDIF12ST1", 
    y = "Count for Responses", 
    title = "WALKDIF12ST1 Amount of difficulty walking up or down 12 steps"
  ) + 
  theme_classic() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1)
  )


arth_walk_alot2 <- adult_nhis_data |> 
  filter(WALKDIF12ST1 == 3, ARTHGLUPEV == 2) |> 
  summarise(count = n())
  # 642 ppl who were told they have ARTHGLUPEV and have 'a lot of difficulty'
  # with 12 steps.  (70.24 % of all ppl who answered '3')
