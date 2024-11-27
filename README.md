# **LING 460 Final Project: Pronoun Usage and Sentiment in Social Media Posts**

## **Project Overview**
This project investigates the relationship between **personal pronoun usage** and the **sentiment** (positive, neutral, or negative) of social media posts, using a dataset of randomly sampled Twitter posts. Pronouns are a significant linguistic feature often tied to emotional tone, self-focus, or social interaction. By analyzing patterns of pronoun usage in relation to sentiment, this project aims to uncover insights into how language reflects the emotional intent of social media users.

---

## **Dataset Information**
The dataset used in this analysis was sourced from Kaggle, titled **“Sentiment Analysis Dataset,”** created by Abhishek Shrivastava in 2020. Key variables in the dataset include:
- **`text`**: The raw content of each Twitter post.
- **`sentiment`**: A categorical variable classifying each post's sentiment as **positive**, **neutral**, or **negative**.

The dataset was filtered to retain only the columns relevant to this analysis: **`text`** and **`sentiment`**.

---

## **Research Goals**
1. **Primary Question**: Is there an association between the type of pronoun usage in social media posts (e.g., first-person vs. non-first-person pronouns) and the sentiment expressed in those posts?
2. **Hypothesis**: Certain types of pronouns, such as first-person pronouns (e.g., "I," "me," "my"), are more prevalent in specific sentiment categories (e.g., negative sentiment may show a higher frequency of self-focused pronouns).

---

## **Analysis Procedure**

### **1. Data Preparation**
- Filtered the dataset to include only the **`text`** and **`sentiment`** columns.
- Removed posts with missing or incomplete data.

### **2. Feature Engineering**
Added the following columns to quantify pronoun usage:
- **`first_person_count`**: Counts the number of first-person pronouns (e.g., "I," "me," "we") in each post.
- **`total_pronoun_count`**: Counts all personal pronouns (e.g., "you," "they") in each post.
- **`non_first_person_count`**: Derived by subtracting `first_person_count` from `total_pronoun_count`.
- **`personal`**: A binary indicator classifying whether a post contains a majority of personal pronouns based on a threshold (≥50%).

### **3. Statistical Testing**
- Constructed a **contingency table** summarizing the counts of posts by **sentiment** and whether they primarily used first-person pronouns (`personal` = 1).
- Performed a **Chi-Square Test of Independence** using the `svychisq()` function to evaluate whether there is a statistically significant association between **sentiment** and **pronoun usage**:
  - **Independent Variable**: `sentiment` (positive, neutral, negative).
  - **Dependent Variable**: `personal` (majority first-person pronouns or not).

### **4. Visualizations**
Generated visualizations to complement the statistical analysis:
- **Bar plots**: Displayed the distribution of pronoun usage across sentiment categories.
- **Heatmaps**: Illustrated the intensity of pronoun usage by sentiment.
- **Box plots**: Showed the distribution of `first_person_count` across sentiments.

---

## **Results**
1. **Statistical Significance**:
   - The Chi-Square test revealed a statistically significant association between pronoun usage and sentiment, with a p-value far below 0.05.

2. **Key Findings**:
   - **Neutral posts** showed the highest proportion of personal pronouns overall.
   - **Negative posts** had a higher frequency of first-person pronouns, reflecting a possible link between self-focus and negative emotions.
   - **Positive posts** showed a lower overall proportion of personal pronouns compared to neutral and negative posts.

---

## **Conclusion**
This analysis demonstrates that personal pronoun usage is significantly associated with the sentiment of social media posts. These findings suggest that pronoun choice is a meaningful linguistic marker for emotional tone, particularly with first-person pronouns being more prevalent in negative sentiments. This research highlights the potential of linguistic analysis to uncover subtle emotional cues in social media text.

---

## **Future Directions**
- Explore temporal patterns, such as how pronoun usage varies by time of day.
- Expand the analysis to include other linguistic features (e.g., verb tense, sentence structure).
- Investigate potential applications in mental health monitoring or automated sentiment analysis tools.
