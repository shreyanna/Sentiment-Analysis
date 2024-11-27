# **Pronouns and Sentiment: Analyzing Emotional Context in Social Media Posts**

## **Project Overview**
This project examines the relationship between **personal pronoun usage** and the **sentiment** (positive, neutral, or negative) expressed in social media posts. Pronouns, as linguistic markers, play a significant role in emotional tone, self-focus, or social interaction. By analyzing patterns of pronoun usage in relation to sentiment, this project aims to uncover insights into how language reflects the emotional intent of social media users.

This project was completed as a **final project for LING 460: Making Sense of Big Data – Textual Analysis with R**.

---

## **Dataset Information**
The dataset, titled **“Sentiment Analysis Dataset,”** was created by Abhishek Shrivastava in 2020 and sourced from Kaggle. It includes:
- **`text`**: The raw content of each Twitter post.
- **`sentiment`**: A categorical label indicating the sentiment of the post: **positive**, **neutral**, or **negative**.

The dataset was filtered to retain only the `text` and `sentiment` columns for analysis.

---

## **Research Goals**
1. **Research Question**: Is there a relationship between the use of personal pronouns and the sentiment of social media posts?
2. **Hypothesis**: The type of pronoun usage is linked to the sentiment:
   - **First-person pronouns** (e.g., "I," "me") are more prevalent in **negative posts** as users express complaints or personal issues.
   - **Second- and third-person pronouns** (e.g., "you," "they") are more common in **positive posts**, reflecting compliments or expressions of gratitude.

---

## **Procedure**

### **1. Data Preparation**
The dataset was pre-processed to focus on pronoun usage:
- Retained the columns `text` and `sentiment`.
- Removed posts with missing or incomplete data.

### **2. Feature Engineering**
To quantify pronoun usage, the following variables were added:
- **`first_person_count`**: The number of first-person pronouns (e.g., "I," "me") in each post.
- **`total_pronoun_count`**: The total number of all personal pronouns (e.g., "you," "they") in each post.
- **`non_first_person_count`**: The frequency of second- and third-person pronouns (calculated as `total_pronoun_count - first_person_count`).
- **`personal`**: A binary indicator:
  - **1**: Majority of pronouns are first-person.
  - **0**: Majority of pronouns are not first-person.

### **3. Statistical Analysis**
- A **contingency table** was created to summarize the distribution of posts by sentiment and pronoun usage (`personal` = 1 or 0).
- A **Chi-Square Test with a complex sampling design** was performed to assess the relationship between sentiment and pronoun usage:
  - **Independent Variable**: Sentiment (positive, neutral, or negative).
  - **Dependent Variable**: Whether the majority of pronouns in a post are first-person.

### **4. Visualization**
Visualizations were created to support the findings:
- **Bar Plots**: Displayed the proportion of first-person vs. non-first-person pronouns across sentiment categories.
- **Heatmaps**: Highlighted patterns in pronoun usage intensity by sentiment.
- **Proportional Plots**: Showed specific pronoun types driving trends in each sentiment.

---

## **Key Findings**

### **1. Statistical Results**
- The Chi-Square test produced a **p-value of 1.414e-07**, indicating a statistically significant association between sentiment and pronoun usage.
- The null hypothesis (no relationship between sentiment and pronoun type) was rejected.

### **2. Patterns in Pronoun Usage**
- **First-Person Pronouns**:
  - Found more frequently in **negative posts**, supporting the hypothesis that users express complaints or personal struggles using self-referential language.
- **Non-First-Person Pronouns**:
  - More prevalent in **positive posts**, reflecting a tendency to address or compliment others (e.g., "you," "your").

---

## **Conclusions**
The findings strongly support the hypothesis that personal pronoun usage varies with the sentiment of social media posts. Specifically:
- **First-person pronouns** signal self-focus and are more common in negative posts.
- **Non-first-person pronouns** often indicate outward focus and are more common in positive posts.

These results suggest that linguistic patterns, like pronoun use, are deeply connected to emotional tone. Such insights can benefit sentiment analysis tools, social media studies, and even mental health research by highlighting the role of language in emotional expression.

---

## **Future Directions**
1. **Platform-Specific Analysis**: Investigate whether these patterns hold across other platforms like Instagram or TikTok.
2. **Demographic Impact**: Explore how factors like age or gender influence the relationship between pronouns and sentiment.
3. **Multilingual Analysis**: Study pronoun-sentiment patterns in non-English social media posts.

---

## **References**
Shrivastava, A. (2021). Sentiment Analysis Dataset. [Kaggle](https://www.kaggle.com/datasets/abhi8923shriv/sentiment-analysis-dataset).
