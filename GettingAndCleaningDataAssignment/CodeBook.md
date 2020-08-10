---
title: "CodeBook"
output: html_document
---
All the measurements were normalized and bounded withing [-1,1] before taking the mean.

subject_number:         Subjects were given a number of 1 to 30, this indicates to which subject the
                        data in the row belongs.


activity:               The activity that the subject was doing when the data was produced:

                        1. walking
                        2. walking upstairs
                        3. walking downstairs
                        4. sitting
                        5. standing
                        6. laying

The rest of the variables are the mean of the measurement for a subject during an activity where:

        f: indicates frequency domain signals
        t: indicates time domain signals
        Body: indicates body signals
        Gravity: indicates gravity signals
        Gyro: indicates data from a gyroscope
        Acc: indicates data form a accelerometer
        Jerk: indicates that de data is derived from acceleration and angular velocity
        Mag: indicates that the data was produced by taking the Euclidean norm to calculate the magnitude
        x: the measurement was measured along the x-axis
        y: the measurement was measured along the y-axis
        z: the measurement was measured along the z-axis
        

