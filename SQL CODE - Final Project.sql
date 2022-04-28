-- Final Project: COVID-19 and its impact on education, social life and mental health of students

-- VIEW THE WHOLE TABLE:

SELECT * 
FROM project_education.covid19_and_education;


 
 -- AVG, MIN AND MAX AGE OF STUDENT: 20, 7, 59
 
SELECT AVG(age_of_subject) AS "Avg Age", MIN(Age_of_Subject) AS "Min Age", MAX(Age_of_Subject) AS "Max Age"
FROM project_education.covid19_and_education;


 
 -- HOW MANY STUDENTS?: 1171
 
  SELECT COUNT(age_of_subject) AS "No. of Students"
 FROM project_education.covid19_and_education;


 
-- RATING EXPERIENCES BY AGE GROUP: Highest and Lowest rating only - Under 18s / 18-25 / 25 & Over
-- 18-25 had the highest very poor rating out of the age groups in comparion to their excellent ratings

SELECT ID, Age_of_Subject, Rating_of_Online_Class_experience
FROM project_education.covid19_and_education
WHERE Rating_of_Online_Class_experience = "Excellent"
AND age_of_subject < 18;

SELECT ID, Age_of_Subject, Rating_of_Online_Class_experience
FROM project_education.covid19_and_education
WHERE Rating_of_Online_Class_experience = "Excellent" 
AND age_of_subject BETWEEN 18 AND 25;

SELECT ID, Age_of_Subject, Rating_of_Online_Class_experience
FROM project_education.covid19_and_education
WHERE Rating_of_Online_Class_experience = "Excellent"
AND age_of_subject BETWEEN 25 AND 60
ORDER BY 2;

SELECT ID, Age_of_Subject, Rating_of_Online_Class_experience
FROM project_education.covid19_and_education
WHERE Rating_of_Online_Class_experience = "Very poor"
AND age_of_subject < 18 
ORDER BY 2;

SELECT ID, Age_of_Subject, Rating_of_Online_Class_experience
FROM project_education.covid19_and_education
WHERE Rating_of_Online_Class_experience = "Very poor"
AND age_of_subject BETWEEN 18 AND 25
ORDER BY 2;

SELECT ID, Age_of_Subject, Rating_of_Online_Class_experience
FROM project_education.covid19_and_education
WHERE Rating_of_Online_Class_experience = "Very poor"
AND age_of_subject BETWEEN 25 AND 60 
ORDER BY 2;



-- AVERAGE TIME SPENT IN CLASS AND SELF STUDY: Under 18s / 18-25 / 25 & Over
-- 18-25 year olds spent more time on self study than in online class may have contributed to the high very poor ratings

SELECT age_of_subject, time_spent_on_online_class, (SELECT AVG(time_spent_on_online_class) FROM project_education.covid19_and_education) AS "AVG Time spent in class", time_spent_on_self_study, (SELECT AVG(time_spent_on_self_study) FROM project_education.covid19_and_education) AS "AVG Time spent on self study"
FROM project_education.covid19_and_education
WHERE age_of_subject < 18
ORDER BY 2 DESC;

SELECT age_of_subject, time_spent_on_online_class, (SELECT AVG(time_spent_on_online_class) FROM project_education.covid19_and_education) AS "AVG Time spent in class", time_spent_on_self_study, (SELECT AVG(time_spent_on_self_study) FROM project_education.covid19_and_education) AS "AVG Time spent on self study"
FROM project_education.covid19_and_education
WHERE age_of_subject BETWEEN 18 AND 25 AND time_spent_on_self_study > 1
ORDER BY 4 DESC;

SELECT age_of_subject, time_spent_on_online_class, (SELECT AVG(time_spent_on_online_class) FROM project_education.covid19_and_education) AS "AVG Time spent in class", time_spent_on_self_study, (SELECT AVG(time_spent_on_self_study) FROM project_education.covid19_and_education) AS "AVG Time spent on self study"
FROM project_education.covid19_and_education
WHERE age_of_subject > 25 AND time_spent_on_self_study > 1
ORDER BY 4 DESC;


-- TOTAL TIME SPENT IN CLASS AND SELF STUDY BY AGE: Under 18s / 18-25 / 25 & Over

SELECT age_of_subject AS "Ages", sum(time_spent_on_self_study) AS "Total time spent on self study", sum(time_spent_on_online_class) AS "Total time spent online class"
FROM project_education.covid19_and_education
WHERE Age_of_Subject < 18
GROUP BY age_of_subject
ORDER BY 1;

SELECT age_of_subject AS "Ages", sum(time_spent_on_self_study) AS "Total time spent on self study", sum(time_spent_on_online_class) AS "Total time spent online class"
FROM project_education.covid19_and_education
WHERE Age_of_Subject BETWEEN 18 AND 25
GROUP BY age_of_subject
ORDER BY 1;

SELECT age_of_subject AS "Ages", sum(time_spent_on_self_study) AS "Total time spent on self study", sum(time_spent_on_online_class) AS "Total time spent online class"
FROM project_education.covid19_and_education
WHERE Age_of_Subject > 25
GROUP BY age_of_subject
ORDER BY 1;


-- USE OF MEDIDUM: Even split of students who used smart phone or laptop however, there were more Very Poor ratings when using a smartphone

SELECT ID, Age_of_Subject, Medium_for_online_class, Rating_of_Online_Class_experience
FROM project_education.covid19_and_education
WHERE medium_for_online_class = 'Smartphone' AND Rating_of_Online_Class_experience = "Excellent";

SELECT ID, Age_of_Subject, Medium_for_online_class, Rating_of_Online_Class_experience
FROM project_education.covid19_and_education
WHERE medium_for_online_class = 'Smartphone' AND Rating_of_Online_Class_experience = "Very Poor";

SELECT ID, Age_of_Subject, Medium_for_online_class, Rating_of_Online_Class_experience
FROM project_education.covid19_and_education
WHERE medium_for_online_class = 'Laptop/Desktop' AND Rating_of_Online_Class_experience = "Excellent";

SELECT ID, Age_of_Subject, Medium_for_online_class, Rating_of_Online_Class_experience
FROM project_education.covid19_and_education
WHERE medium_for_online_class = 'Laptop/Desktop' AND Rating_of_Online_Class_experience = "Very poor";



-- HEALTH ISSUES: Under 18s / 18-25 / 25 & Over 
-- Overall no significant trend in age groups for people who had health issues during lockdown. An even split or most people did not suffer with any health issues

SELECT Age_of_Subject, count(health_issue_during_lockdown)
FROM project_education.covid19_and_education
WHERE Health_issue_during_lockdown = "NO" AND Age_of_Subject < 18 
GROUP BY Age_of_Subject
ORDER BY 1;

SELECT Age_of_Subject, count(health_issue_during_lockdown)
FROM project_education.covid19_and_education
WHERE Health_issue_during_lockdown = "YES" AND Age_of_Subject < 18
GROUP BY Age_of_Subject
ORDER BY 1;

SELECT Age_of_Subject, count(health_issue_during_lockdown)
FROM project_education.covid19_and_education
WHERE Health_issue_during_lockdown = "NO" AND Age_of_Subject BETWEEN 18 AND 25
GROUP BY Age_of_Subject
ORDER BY 1;

SELECT Age_of_Subject, count(health_issue_during_lockdown)
FROM project_education.covid19_and_education
WHERE Health_issue_during_lockdown = "YES" AND Age_of_Subject BETWEEN 18 AND 25
GROUP BY Age_of_Subject
ORDER BY 1;

SELECT Age_of_Subject, count(health_issue_during_lockdown)
FROM project_education.covid19_and_education
WHERE Health_issue_during_lockdown = "NO" AND Age_of_Subject > 25
GROUP BY Age_of_Subject
ORDER BY 1;

SELECT Age_of_Subject, count(health_issue_during_lockdown)
FROM project_education.covid19_and_education
WHERE Health_issue_during_lockdown = "YES" AND Age_of_Subject > 25
GROUP BY Age_of_Subject
ORDER BY 1;

-- HEALTH ISSUES: Comparing number of meals a day to change in weight
-- when students had more than 3 meals a day 45% of them said their weight had increased 
-- when students had 3 meals a day 48% or less than 3 meals a day 42% said their weight remained constant 

SELECT 
CASE
WHEN number_of_meals_per_day <= 2 THEN "Less than 3 meals a day"
WHEN number_of_meals_per_day = 3 THEN "3 meals a day"
WHEN number_of_meals_per_day > 3 THEN "More than 3 meals a day"
END AS "Number of meals a day"
, change_in_your_weight, count(change_in_your_weight) AS "Number of students"
FROM project_education.covid19_and_education
GROUP BY 1, 2
ORDER BY 1;

-- SOCIAL LIFE: 755 students said that actitives that usually invovle interaction was missed the most 

SELECT What_you_miss_the_most
FROM project_education.covid19_and_education
WHERE What_you_miss_the_most LIKE "%Friends%" OR 
      What_you_miss_the_most LIKE "%relatives%" OR 
      What_you_miss_the_most LIKE "%school%" OR 
      What_you_miss_the_most LIKE "%college%" OR
	  What_you_miss_the_most LIKE "%roaming%" OR 
      What_you_miss_the_most LIKE "%colleauges%";










