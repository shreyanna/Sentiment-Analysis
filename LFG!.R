library(dplyr)
library(tidytext)
library(stringr)
library(survey)


data <- read.csv("/Users/shreya/Downloads/archive123/test.csv",
                 fileEncoding = "ISO-8859-1",
                 stringsAsFactors = FALSE,
                 fill = TRUE)

names(data)

first_person_pronouns <- c("i", "me", "my", "mine", "we", "us", "our", "ours")
personal_pronouns <- c("i", "me", "my", "mine", "we", "us", "our", "ours",
                       "you", "your", "yours", "he", "him", "his", "she", 
                       "her", "hers", "they", "them", "their", "theirs")

filtered_data <- data %>%
  select(text, sentiment)

filtered_data <- filtered_data %>%
  mutate(
    first_person_count = str_count(tolower(text), str_c("\\b(", str_c(first_person_pronouns, collapse = "|"), ")\\b")),
    
    total_pronoun_count = str_count(tolower(text), str_c("\\b(", str_c(personal_pronouns, collapse = "|"), ")\\b")),
    
    non_first_person_count = total_pronoun_count - first_person_count
  )

filtered_data <- filtered_data %>%
  filter(total_pronoun_count > 0)

print(filtered_data)

write.csv(filtered_data, "/Users/shreya/Desktop/filtered_data")


data_new <- read.csv("/Users/shreya/Desktop/analysis_data.csv")
data_new


# test <- svychisq(ids=PostID, data=data_new)
?svychisq()



library(survey)

# Step 1: Create a survey design object
# Replace 'PostID' with the ID column in your dataset, and add weights if available
my_survey <- svydesign(
  id = ~PostID,  # Cluster or post ID (use ~1 if no clustering)
  data = data_new  # Use the dataset with sentiment and personal pronoun presence
)

# Step 2: Create a contingency table
# 'sentiment' is the sentiment label, 'personal' indicates presence of personal pronouns
contingency_table <- svytable(~sentiment + personal, design = my_survey)

# Step 3: Perform Chi-Square Test
chi_square_result <- svychisq(~sentiment + personal, design = my_survey)

# Step 4: Display the result
contingency_table
chi_square_result


