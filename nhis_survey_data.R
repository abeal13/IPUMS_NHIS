#This is for the data from the 2022 NHIS survey which included questions about complementary 
# and integrative health practices such as acupuncture. 
setwd("YOUR_PATH_HERE")
source("utils.R")
ddi <- read_ipums_ddi("nhis_00001_ddi.xml")
nhis_data <- read_ipums_micro(ddi)

# extract only adult answers to the questions of interest. 
# these are questions about arthritic type pain, mobility w/ walking and climbing stairs. 
# use of acupuncture, massage, meditation, and yoga. 
adult_nhis_data <- nhis_data %>% 
  filter(ASTATFLG %in% c(1, 2)) %>% 
  select(
    YEAR, 
    NHISPID,  #unique ID of person 
    ASTATFLG, #flag for if they are adult or not 
    ARTHGLUPEV, #arthritis, gout, lupus, etc
    LAWALKCLIMDIF, 
    WALKDIF12ST1, 
    ACUYR, 
    ACUPAIN, 
    MASYR, 
    MASPAIN, 
    RELMEDYR, 
    RELMEDPAIN, 
    YTQYOGYR, 
    YTQYOGPAIN
  )


# was trying to figure out the value codes for the participant id stuff. 
# found that the nhis_data frame has values at 0 or 1, 2. 

nhis_data %>% 
  filter(ASTATFLG == 0) %>% 
  summarize(count = n())

# ASTATFLG 1, 2 i.e. Adults = 27651
# ASTATFLG 0 i.e. Children, 
# or other adults not included in universe = 7464

save(adult_nhis_data, file = "adult_nhis_data.RData")

