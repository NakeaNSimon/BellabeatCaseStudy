--Check the participation using distinct ids from the three tables - Activity, Sleep, and Weight
SELECT COUNT(DISTINCT `white-resolver-417617.Fitbit_data.Daily_activity `.id) AS Participants_Activity,
COUNT(DISTINCT `white-resolver-417617.Fitbit_data.Sleep_activity `.id) AS Sleep_Activity, 
COUNT(DISTINCT `white-resolver-417617.Fitbit_data.Weight_activity `.id) AS Weight_Activity, 

 FROM `white-resolver-417617.Fitbit_data.Daily_activity `, `white-resolver-417617.Fitbit_data.Sleep_activity `, `white-resolver-417617.Fitbit_data.Weight_activity `

 --We are now going to look at the AVG of daily activity averages of steps, distance, sedentary time, lightly active, fairly active and very active minutes and calories for all the participants.

 SELECT ROUND(AVG (TotalSteps)) AS Avg_Steps,
  ROUND(AVG(TotalDistance)) AS AVG_Distance, 
  ROUND(AVG(VeryActiveMinutes)) AS AVG_VeryActiveMinutes, 
  ROUND(AVG(FairlyActiveMinutes)) AS AVG_FairlyActiveMinutes,
  ROUND(AVG(LightlyActiveMinutes)) AS AVG_LightlyActiveMinutes, 
  ROUND(AVG(SedentaryMinutes)) AS AVG_SedentaryMinutes, 
  ROUND(AVG(Calories)) AS AVG_CaloriesBurned, 
 FROM `white-resolver-417617.Fitbit_data.Daily_activity `
 WHERE 
  TotalSteps <> 0; 

--AVG Sleep & Weight 
SELECT ROUND(AVG(WeightPounds)) AS AVG_Weight, 
  ROUND(AVG(TotalMinutesAsleep)) AS AVG_MinutesAsleep,
FROM `white-resolver-417617.Fitbit_data.Weight_activity `, `white-resolver-417617.Fitbit_data.Sleep_activity `

--Calculate how many hours is 419 minutes
SELECT ROUND(AVG(TotalMinutesAsleep),-1) / 60 AS Hours_Asleep 
FROM `white-resolver-417617.Fitbit_data.Sleep_activity `

--Most and Least Active Days 
SELECT 
  ActivityDate, 
  ROUND(AVG (TotalSteps)) AS AVG_Steps,
  ROUND(AVG(VeryActiveMinutes)) AS AVG_VeryActiveMinutes, 
  ROUND(AVG(FairlyActiveMinutes)) AS AVG_FairlyActiveMinutes,
  ROUND(AVG(LightlyActiveMinutes)) AS AVG_LightlyActiveMinutes, 
  ROUND(AVG(SedentaryMinutes)) AS AVG_SedentaryMinutes, 
 FROM `white-resolver-417617.Fitbit_data.Daily_activity `
 WHERE 
  TotalSteps <> 0
  GROUP BY ActivityDate 
  ORDER BY AVG_Steps DESC;


--Time of day most active 
SELECT ActivityHour_, StepTotal,
FROM `white-resolver-417617.Fitbit_data.hourly_steps `
ORDER BY StepTotal DESC
LIMIT 100


