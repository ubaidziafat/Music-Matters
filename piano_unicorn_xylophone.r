#1: # Load libraries
library(tidyverse)
library(ggplot2)

#2: # Read in the 'Music Matters' data set
musicm <- read.csv("Music_Matters.csv")

#3: # Identify the format of each column
str(musicm)

#4: # Calculate the mean number of years of study
mean_years_study <- mean(music_matters$Years)

#5: # Calculate the median number of years of study
median_years_study <- median(music_matters$Years)

#6: # Calculate the mode of the number of years of study
mode_years_study <- 	unique(sort(table(music_matters$Years)))

#7: # Calculate the standard deviation of the number of years of study
sd_years_study <- sd(music_matters$Years)

#8: # Show basic summary statistics
summary(music_matters)

#9: # Create a histogram to visualize the distribution of years of study
ggplot(data = music_matters, aes(x=Years)) + 
  geom_histogram(binwidth = 1, fill="steelblue", color="black") +
  ggtitle("Years of Study") +
  xlab("Years") +
  ylab("Number of Students")

#10: # Create a boxplot to visualize the distribution of years of study
ggplot(data = music_matters, aes(x=Years)) + 
  geom_boxplot(alpha=0.7, fill="steelblue", color="black") +
  ggtitle("Years of Study") +
  xlab("Years") +
  ylab("Number of Students")

#11: # Create a scatterplot to display the relationship between years of music study and grade
ggplot(data = music_matters, aes(x=Years, y=Grade)) +
  geom_point(alpha=0.7, shape=1, color="steelblue") +
  geom_smooth(span=0.7, color="black") +
  ggtitle("Years of Study and Grade") +
  xlab("Years") +
  ylab("Grade")

#12: # Run linear regression to determine the relationship between years of study and grade
lm_years_grade <- lm(Grade ~ Years, data = music_matters)

#13: # Make predictions based on the linear regression
predict_years_grade <- predict(lm_years_grade, newdata = music_matters)

#14: # Calculate the R-squared value
rsquared_years_grade <- summary(lm_years_grade)$r.squared

#15: # Create a bar chart to visualise the number of students with each grade
ggplot(data = music_matters, aes(x=Grade)) + 
  geom_bar(fill="steelblue", color="black") +
  ggtitle("Grade Level") +
  xlab("Grade") +
  ylab("Number of Students")

#16: # Calculate the mean grade
mean_grade <- mean(music_matters$Grade)

#17: # Calculate the median grade
median_grade <- median(music_matters$Grade)

#18: # Calculate the mode of grades
mode_grade <- unique(sort(table(music_matters$Grade)))

#19: # Calculate the standard deviation of grades
sd_grade <- sd(music_matters$Grade)

#20: # Group students by grade
group_by_grade <- group_by(music_matters, Grade)

#21: # Calculate the mean years of study for each grade
mean_years_grade <- summarise(group_by_grade, mean_years = mean(Years))

#22: # Create a new column with the mean years of study
new_musicm <- mutate(music_matters, mean_years = mean_years_grade)

#23: # Create a scatterplot to visualize the relationship between grade and mean years of study
ggplot(data = new_musicm, aes(x=Grade, y=mean_years)) +
  geom_point(alpha=0.7, shape=1, color="steelblue") +
  geom_smooth(span=0.7, color="black") +
  ggtitle("Grade and Mean Years of Study") +
  xlab("Grade") +
  ylab("Mean Years of Study")

#24: # Run linear regression to determine the relationship between grade and mean years of study
lm_grade_mean_years <- lm(mean_years ~ Grade, data = new_musicm)

#25: # Make predictions based on the linear regression
predict_grade_mean_years <- predict(lm_grade_mean_years, newdata = new_musicm)

#26: # Calculate the R-squared value
rsquared_grade_mean_years <- summary(lm_grade_mean_years)$r.squared

#27: # Group students by years of study
group_by_years <- group_by(music_matters, Years)

#28: # Calculate the mean grade for each year
mean_grade_years <- summarise(group_by_years, mean_grade = mean(Grade))

#29: # Create a new column with the mean grade
new_musicm <- mutate(music_matters, mean_grade = mean_grade_years)

#30: # Create a scatterplot to visualize the relationship between years of study and mean grade
ggplot(data = new_musicm, aes(x=Years, y=mean_grade)) +
  geom_point(alpha=0.7, shape=1, color="steelblue") +
  geom_smooth(span=0.7, color="black") +
  ggtitle("Years of Study and Mean Grade") +
  xlab("Years") +
  ylab("Mean Grade")

#31: # Run linear regression to determine the relationship between years of study and mean grade
lm_years_mean_grade <- lm(mean_grade ~ Years, data = new_musicm)

#32: # Make predictions based on the linear regression
predict_years_mean_grade <- predict(lm_years_mean_grade, newdata = new_musicm)

#33: # Calculate the R-squared value
rsquared_years_mean_grade <- summary(lm_years_mean_grade)$r.squared

#34: # Group data by grade and years of study
group_by_gy <- group_by(music_matters, Grade, Years)

#35: # Calculate the mean grade for each grade and year
mean_grade_gy <- summarise(group_by_gy, mean_grade = mean(Grade))

#36: # Create a new column with the mean grade
new_musicm <- mutate(music_matters, mean_grade_gy = mean_grade_gy)

#37: # Create a scatterplot to visualize the relationship between Grade and Years of Study
# and the mean grade
ggplot(data = new_musicm, aes(x=Grade, y=Years, fill = mean_grade_gy)) +
  geom_point(alpha=0.7, shape=1, color="steelblue") +
  geom_smooth(span=0.7, color="black") +
  ggtitle("Grade and Years of Study and Mean Grade") +
  xlab("Grade") +
  ylab("Years of Study") +
  scale_fill_gradient(low="white", high="steelblue")

#38: # Calculate the correlation between grade and years of study
cor_grade_years <- cor(music_matters$Grade, music_matters$Years)

#39: # Group students by gender
group_by_gender <- group_by(music_matters, Gender)

#40: # Calculate the mean grade for each gender
mean_grade_gender <- summarise(group_by_gender, mean_grade = mean(Grade))

#41: # Create a new column with the mean grade
new_musicm <- mutate(music_matters, mean_grade = mean_grade_gender)

#42: # Create a bar chart to visualize the mean grade for each gender
ggplot(data = new_musicm, aes(x=Gender, y=mean_grade)) + 
  geom_bar(fill="steelblue", color="black") +
  ggtitle("Gender and Mean Grade") +
  xlab("Gender") +
  ylab("Mean Grade")

#43: # Calculate the mean years of study by gender
mean_years_gender <- summarise(group_by_gender, mean_years = mean(Years))

#44: # Create a new column with the mean years of study
new_musicm <- mutate(music_matters, mean_years = mean_years_gender)

#45: # Create a bar chart to visualize the mean years of study for each gender
ggplot(data = new_musicm, aes(x=Gender, y=mean_years)) + 
  geom_bar(fill="steelblue", color="black") +
  ggtitle("Gender and Mean Years of Study") +
  xlab("Gender") +
  ylab("Mean Years of Study")

#46: # Group students by gender and grade
group_by_gg <- group_by(music_matters, Gender, Grade)

#47: # Calculate the mean years of study for each gender and grade
mean_years_gg <- summarise(group_by_gg, mean_years = mean(Years))

#48: # Create a new column with the mean years of study
new_musicm <- mutate(music_matters, mean_years_gg = mean_years_gg)

#49: # Create a scatterplot to visualize the relationship between Gender and Grade
# and the mean years of study
ggplot(data = new_musicm, aes(x=Gender, y=Grade, fill = mean_years_gg)) +
  geom_point(alpha=0.7, shape=1, color="steelblue") +
  geom_smooth(span=0.7, color="black") +
  ggtitle("Gender and Grade and Mean Years of Study") +
  xlab("Gender") +
  ylab("Grade") +
  scale_fill_gradient(low="white", high="steelblue")

#50: # Calculate the correlation between grade, gender, and years of study
cor_grade_gender_years <- cor(music_matters$Grade, music_matters$Gender, music_matters$Years)

#51: # Group students by gender and years of study
group_by_gy <- group_by(new_musicm, Gender, Years)

#52: # Calculate the mean grade for each gender and year
mean_grade_gy <- summarise(group_by_gy, mean_grade = mean(Grade))

#53: # Create a new column with the mean grade
new_musicm <- mutate(new_musicm, mean_grade_gy = mean_grade_gy)

#54: # Create a scatterplot to visualize the relationship between Gender and Years of Study
# and the mean grade
ggplot(data = new_musicm, aes(x=Gender, y=Years, fill = mean_grade_gy)) +
  geom_point(alpha=0.7, shape=1, color="steelblue") +
  geom_smooth(span=0.7, color="black") +
  ggtitle("Gender and Years of Study and Mean Grade") +
  xlab("Gender") +
  ylab("Years of Study") +
  scale_fill_gradient(low="white", high="steelblue")

#55: # Calculate the correlation between grade, gender, and years of study
cor_grade_gender_years <- cor(music_matters$Grade, music_matters$Gender, music_matters$Years)

#56: # Create a boxplot to visualize the distribution of grade by gender
ggplot(data = music_matters, aes(x=Gender, y=Grade)) + 
  geom_boxplot(alpha=0.7, fill="steelblue", color="black") +
  ggtitle("Grade Level by Gender") +
  xlab("Gender") +
  ylab("Grade")

#57: # Create a boxplot to visualize the distribution of years of study by gender
ggplot(data = music_matters, aes(x=Gender, y=Years)) + 
  geom_boxplot(alpha=0.7, fill="steelblue", color="black") +
  ggtitle("Years of Study by Gender") +
  xlab("Gender") +
  ylab("Years")

#58: # Group students by practice
group_by_practice <- group_by(music_matters, Practice)

#59: # Calculate the mean grade for each practice
mean_grade_practice <- summarise(group_by_practice, mean_grade = mean(Grade))

#60: # Create a new column with the mean grade
new_musicm <- mutate(music_matters, mean_grade = mean_grade_practice)

#61: # Create a bar chart to visualize the mean grade for each practice
ggplot(data = new_musicm, aes(x=Practice, y=mean_grade)) + 
  geom_bar(fill="steelblue", color="black") +
  ggtitle("Practice and Mean Grade") +
  xlab("Practice") +
  ylab("Mean Grade")

#62: # Calculate the mean years of study by practice
mean_years_practice <- summarise(group_by_practice, mean_years = mean(Years))

#63: # Create a new column with the mean years of study
new_musicm <- mutate(music_matters, mean_years = mean_years_practice)

#64: # Create a bar chart to visualize the mean years of study for each practice
ggplot(data = new_musicm, aes(x=Practice, y=mean_years)) + 
  geom_bar(fill="steelblue", color="black") +
  ggtitle("Practice and Mean Years of Study") +
  xlab("Practice") +
  ylab("Mean Years of Study")

#65: # Group students by practice and grade
group_by_pg <- group_by(music_matters, Practice, Grade)

#66: # Calculate the mean years of study for each practice and grade
mean_years_pg <- summarise(group_by_pg, mean_years = mean(Years))

#67: # Create a new column with the mean years of study
new_musicm <-