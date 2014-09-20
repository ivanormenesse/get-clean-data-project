---
title: "code book"
author: "Ivan Ormenesse"
date: "Saturday, September 20, 2014"
output: html_document
---

#Course Project - Getting and Cleaning Data 007
##Brief explanation on building and structuring the dataset
*Table name: data*  
*File name: data.txt*  
Data was built based on a series of measurements made with the Samsung Galaxy S smartphone accelerometers.  
The purpose of this assignment was to create a tidy dataset considering the average per individual under study and activity measured for any mean or standard deviation variable.   
##Selecting "Mean" or "Standard deviation" variables
The variables to be kept on the final data base ('features_keep') where  defined through the grepl function.  
Grepl is a function for pattern matching. For this purpose grepl was used to filter out any variable names that did not contain the patterns 'mean ( )' or 'std ( )'.
##Renaming variables
One of the course project requests was to appropriately label the data set with descriptive variable names.  
The method applied to rename variables implied the gsub function, which is a function for pattern replacement.  
**Applied replacements where:**  
1.      The  parenthesis "()" were substituted by empty "";  
2.	The  Freq text  was substituted by Frequency;  
3.	The  -X  text  was substituted by XAxis;  
4.	The  -Y  text  was substituted by YAxis;  
5.	The  -Z  text  was substituted by ZAxis;  
6.	The  -std()text  was substituted by StandardDeviation;  
7.	The  -mean() text  was substituted by Mean;  
8.	The  "Jerk" text  was substituted by JerkSignal;  
9.	The  "Gyro" text  was substituted by Gyroscope ;  
10.	The  "Mag" text  was substituted by Magnitude;  
11.	The  "Acc" text  was substituted by Acceleration;  
12.	The  "^f" text  was substituted by FourierTransform;  
13.	The  "^t" text  was substituted by TimeDomain;  





#The resulting data set
**The resulting dataset is composed by 69 variables and 180 rows (6 types of activity x 30 individuals) listed and described below:**                                             
1.	activity  
Contains a numerical vector for each type of activity ranging from 1 to 6 where:  
*1        WALKING* 
*2        WALKING_UPSTAIRS*  
*3        WALKING_DOWNSTAIRS*  
*4        SITTING*  
*5        STANDING*  
*6        LAYING*                                                                  
2.	subject   
Contains a numerical vector ranging from 1 to 30 for each observed individual.                                                                
3.	activity_labels  
Complementary variable to activity contains a factor describing each of the 1 to 6 possibilities in numerical vector presented in activity variable as below:  
*1        WALKING*  
*2        WALKING_UPSTAIRS*  
*3        WALKING_DOWNSTAIRS*  
*4        SITTING*  
*5        STANDING*  
*6        LAYING*                                                 
4.	TimeDomainBodyAccelerationMeanXAxis          
The mean of the average time domain captured at a constant rate of 50 Hz for each individual and each activity for the Body Acceleration in the X axis.                                
5.	TimeDomainBodyAccelerationMeanYAxis  
The mean of the average time domain captured at a constant rate of 50 Hz for each individual and each activity for the Body Acceleration in the Y axis.                                                                     
6.	TimeDomainBodyAccelerationMeanZAxis   
The mean of the average time domain captured at a constant rate of 50 Hz for each individual and each activity for the Body Acceleration in the Z axis.                                                                                                       
7.	TimeDomainBodyAccelerationStandardDeviationXAxis  
The mean of the standard deviation time domain captured at a constant rate of 50 Hz for each individual and each activity for the Body Acceleration in the X axis.                                                       
8.	TimeDomainBodyAccelerationStandardDeviationYAxis   
The mean of the standard deviation time domain captured at a constant rate of 50 Hz for each individual and each activity for the Body Acceleration in the Y axis                         
9.	TimeDomainBodyAccelerationStandardDeviationZAxis  
 The mean of the standard deviation time domain captured at a constant rate of 50 Hz for each individual and each activity for the Body Acceleration in the Z axis                                               
10.	TimeDomainGravityAccelerationMeanXAxis   
The mean of the average time domain captured at a constant rate of 50 Hz for each individual and each activity for the Gravity Acceleration in the X axis                                   
11.	TimeDomainGravityAccelerationMeanYAxis  
The mean of the average time domain captured at a constant rate of 50 Hz for each individual and each activity for the Gravity Acceleration in the Y axis                                   
                                  
12.	 TimeDomainGravityAccelerationMeanZAxis  
The mean of the average time domain captured at a constant rate of 50 Hz for each individual and each activity for the Gravity Acceleration in the X axis                                                                   
13.	TimeDomainGravityAccelerationStandardDeviationXAxis  
The mean of the standard deviation time domain captured at a constant rate of 50 Hz for each individual and each activity for Gravity Acceleration in the X axis                                                                  
14.	TimeDomainGravityAccelerationStandardDeviationYAxis   
The mean of the standard deviation time domain captured at a constant rate of 50 Hz for each individual and each activity for Gravity Acceleration in the X axis                                                                                     
15.	TimeDomainGravityAccelerationStandardDeviationZAxis   
The mean of the standard deviation time domain captured at a constant rate of 50 Hz for each individual and each activity for Gravity Acceleration in the X axis                                                                                                          
16.	TimeDomainBodyAccelerationJerkSignalMeanXAxis  
The mean of the Jerk Signal time domain captured at a constant rate of 50 Hz for each individual and each activity for Body Acceleration in the X axis                             
17.	TimeDomainBodyAccelerationJerkSignalMeanYAxis  
The mean of the Jerk Signal time domain captured at a constant rate of 50 Hz for each individual and each activity for Body Acceleration in the Y axis                                                        
18.	TimeDomainBodyAccelerationJerkSignalMeanZAxis  
The mean of the Jerk Signal time domain captured at a constant rate of 50 Hz for each individual and each activity for Body Acceleration in the Z axis                                                       
19.	TimeDomainBodyAccelerationJerkSignalStandardDeviationXAxis  
The  standard deviation of  the Jerk Signal time domain captured at a constant rate of 50 Hz for each individual and each activity for Body Acceleration in the X axis                                           
20.	TimeDomainBodyAccelerationJerkSignalStandardDeviationYAxis  
The  standard deviation of  the Jerk Signal time domain captured at a constant rate of 50 Hz for each individual and each activity for Body Acceleration in the Y axis                                           
21.	TimeDomainBodyAccelerationJerkSignalStandardDeviationZAxis   
The  standard deviation of  the Jerk Signal time domain captured at a constant rate of 50 Hz for each individual and each activity for Body Acceleration in the Z axis                                           
22.	 TimeDomainBodyGyroscopeMeanXAxis  
The mean of the Body Giroscope of  time domain captured at a constant rate of 50 Hz for each individual and each activity for Gravity Acceleration in the X axis                                                                                                            
23.	 TimeDomainBodyGyroscopeMeanYAxis   
The mean of the Body Giroscope of  time domain captured at a constant rate of 50 Hz for each individual and each activity for Gravity Acceleration in the Y axis                                                                                                                                                   
24.	TimeDomainBodyGyroscopeMeanZAxis  
The mean of the Body Giroscope of  time domain captured at a constant rate of 50 Hz for each individual and each activity for Gravity Acceleration in the Z axis                                                                                                                                                    
25.	TimeDomainBodyGyroscopeStandardDeviationXAxis  
The standard deviation of the Body Giroscope of  time domain captured at a constant rate of 50 Hz for each individual and each activity for Gravity Acceleration in the X axis                                                                                                                                                                          
26.	TimeDomainBodyGyroscopeStandardDeviationYAxis  
The standard deviation of the Body Giroscope of  time domain captured at a constant rate of 50 Hz for each individual and each activity for Gravity Acceleration in the Y axis                                                                                                                                                                                                     
27.	TimeDomainBodyGyroscopeStandardDeviationZAxis  
The standard deviation of the Body Giroscope of  time domain captured at a constant rate of 50 Hz for each individual and each activity for Gravity Acceleration in the Z axis                                                                                                                                                                         
                           
28.	TimeDomainBodyGyroscopeJerkSignalMeanXAxis  
The mean of the Body Giroscope of  time domain captured at a constant rate of 50 Hz for each individual and each activity for Jerk Signal in the X axis                                
29.	TimeDomainBodyGyroscopeJerkSignalMeanYAxis                                
The mean of the Body Giroscope of  time domain captured at a constant rate of 50 Hz for each individual and each activity for Jerk Signal in the Y axis                                
30.	TimeDomainBodyGyroscopeJerkSignalMeanZAxis  
The mean of the Body Giroscope of  time domain captured at a constant rate of 50 Hz for each individual and each activity for Jerk Signal in the Zaxis                                                             
31.	TimeDomainBodyGyroscopeJerkSignalStandardDeviationXAxis  
 The standard deviation of the Body Giroscope of  time domain captured at a constant rate of 50 Hz for each individual and each activity for Jerk Signal in the X axis                                                                          
32.	TimeDomainBodyGyroscopeJerkSignalStandardDeviationYAxis  
The standard deviation of the Body Giroscope of  time domain captured at a constant rate of 50 Hz for each individual and each activity for Jerk Signal in the Y axis                                                                            
33.	TimeDomainBodyGyroscopeJerkSignalStandardDeviationZAxis  
The standard deviation of the Body Giroscope of  time domain captured at a constant rate of 50 Hz for each individual and each activity for Jerk Signal in the Z axis                                                                              
34.	TimeDomainBodyAccelerationMagnitudeMean  
The mean of the Body Accelaration Magnitude of  time domain captured at a constant rate of 50 Hz for each individual and each activity   
35.	TimeDomainBodyAccelerationMagnitudeStandardDeviation   
The standard deviation of the Body Accelaration Magnitude of  time domain captured at a constant rate of 50 Hz for each individual and each activity                      
36.	TimeDomainGravityAccelerationMagnitudeMean  
The mean of the Gravity Accelaration Magnitude of  time domain captured at a constant rate of 50 Hz for each individual and each activity                                                    
37.	TimeDomainGravityAccelerationMagnitudeStandardDeviation  
The standard deviation of the Gravity Accelaration Magnitude of  time domain captured at a constant rate of 50 Hz for each individual and each activity                                       
38.	TimeDomainBodyAccelerationJerkSignalMagnitudeMean  
The mean of the Body Accelaration Magnitude of  time domain captured at a constant rate of 50 Hz for each individual and each activity for Jerk Signal                                                   
39.	TimeDomainBodyAccelerationJerkSignalMagnitudeStandardDeviation 
The standard deviation  of the Body Accelaration Magnitude of  time domain captured at a constant rate of 50 Hz for each individual and each activity for Jerk Signal                                                       
40.	TimeDomainBodyGyroscopeMagnitudeMean  
The mean  of the Body Gyroscope Magnitude of  time domain captured at a constant rate of 50 Hz for each individual and each activity                                      
41.	TimeDomainBodyGyroscopeMagnitudeStandardDeviation   
The standard deviation  of the Body Gyroscope Magnitude of  time domain captured at a constant rate of 50 Hz for each individual and each activity                                                            
42.	TimeDomainBodyGyroscopeJerkSignalMagnitudeMean  
The mean  of the Body Gyroscope Magnitude Jerk signal  of  time domain captured at a constant rate of 50 Hz for each individual and each activity                                      
                           
43.	 TimeDomainBodyGyroscopeJerkSignalMagnitudeStandardDeviation   
The standard deviation  of the Body Gyroscope Magnitude Jerk signal  of  time domain captured at a constant rate of 50 Hz for each individual and each activity              
44.	 FourierTransformBodyAccelerationMeanXAxis    
The mean of the Body Acceleration mean Fourier Transform each individual and each activity in X Axis                                             
45.	FourierTransformBodyAccelerationMeanYAxis  
The mean of the Body Acceleration mean Fourier Transform each individual and each activity in Y Axis                                             
46.	FourierTransformBodyAccelerationMeanZAxis                                 
The mean of the Body Acceleration mean Fourier Transform each individual and each activity in Z Axis              
47.	FourierTransformBodyAccelerationStandardDeviationXAxis  
The mean of the Body Acceleration standard deviation Fourier Transform each individual and each activity in X Axis                           
48.	FourierTransformBodyAccelerationStandardDeviationYAxis   
The mean of the Body Acceleration standard deviation Fourier Transform each individual and each activity in Y Axis              
49.	FourierTransformBodyAccelerationStandardDeviationZAxis   
The mean of the Body Acceleration standard deviation Fourier Transform each individual and each activity in Z Axis                               
50.	FourierTransformBodyAccelerationJerkSignalMeanXAxis  
The mean of the Body Acceleration mean Jerk Signal for  each individual and each activity in X Axis                               
51.	FourierTransformBodyAccelerationJerkSignalMeanYAxis                       
The mean of the Body Acceleration mean Jerk Signal for  each individual and each activity in Y Axis                               
52.	FourierTransformBodyAccelerationJerkSignalMeanZAxis  
The mean of the Body Acceleration mean Jerk Signal for  each individual and each activity in Z Axis                                                    
53.	FourierTransformBodyAccelerationJerkSignalStandardDeviationXAxis  
The mean of the Body Acceleration standard deviation Jerk Signal for each individual and each activity in X Axis                                                            
54.	FourierTransformBodyAccelerationJerkSignalStandardDeviationYAxis    
The mean of the Body Acceleration standard deviation Jerk Signal for each individual and each activity in Y Axis                                                                 
55.	FourierTransformBodyAccelerationJerkSignalStandardDeviationZAxis  
The mean of the Body Acceleration standard deviation Jerk Signal for each individual and each activity in X Axis                                                                    
56.	FourierTransformBodyGyroscopeMeanXAxis  
The mean of the Body Gyroscope Fourier Transform mean for each individual and each activity in X Axis                                                                                                     
57.	FourierTransformBodyGyroscopeMeanYAxis  
The mean of the Body Gyroscope Fourier Transform mean for each individual and each activity in Y Axis                                                                                                                                      
58.	[58] FourierTransformBodyGyroscopeMeanZAxis   
The mean of the Body Gyroscope Fourier Transform mean for each individual and each activity in Z Axis                                                                                                                                                                       
59.	FourierTransformBodyGyroscopeStandardDeviationXAxis   
The mean of the Body Gyroscope Fourier Transform standard deviation for each individual and each activity in X Axis                                                                                                                                                                       
60.	FourierTransformBodyGyroscopeStandardDeviationYAxis  
The mean of the Body Gyroscope Fourier Transform standard deviation for each individual and each activity in Y Axis                                                                                                                                                                                            
61.	FourierTransformBodyGyroscopeStandardDeviationZAxis     
The mean of the Body Gyroscope Fourier Transform standard deviation for each individual and each activity in Z Axis                                                                                                                                                                                         
62.	FourierTransformBodyAccelerationMagnitudeMean   
The mean of the Body acceleration Magnitude Fourier Transform mean for each individual and each activity                           
63.	FourierTransformBodyAccelerationMagnitudeStandardDeviation  
The mean of the Body acceleration Magnitude Fourier Transform standard deviation for each individual and each activity                                          
64.	FourierTransformBodyBodyAccelerationJerkSignalMagnitudeMean  
The mean of the Body acceleration Magnitude Jerk Signal mean for each individual and each activity                                     
65.	FourierTransformBodyBodyAccelerationJerkSignalMagnitudeStandardDeviation  
The mean of the Body acceleration Magnitude Jerk Signal standard deviation for each individual and each activity                                        
66.	FourierTransformBodyBodyGyroscopeMagnitudeMean          
The mean of the Body Gyroscope Magnitude Jerk Signal mean  for each individual and each activity                                                         
67.	FourierTransformBodyBodyGyroscopeMagnitudeStandardDeviation  
The mean of the Body Gyroscope Magnitude Jerk Signal standard deviation  for each individual and each activity                                                                      
68.	FourierTransformBodyBodyGyroscopeJerkSignalMagnitudeMean  
The mean of the Fourier Transform of Body Gyroscope Magnitude Jerk Signal mean for each individual and each activity                                                                                      
69.	FourierTransformBodyBodyGyroscopeJerkSignalMagnitudeStandardDeviation  
The mean of the Fourier Transform of Body Gyroscope Magnitude Jerk Signal standard deviation  for each individual and each activity                                                                                      

