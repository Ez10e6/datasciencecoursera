---
title: "README"
output: html_document
---


The run_analysis.R script does the following:
                        
                        Reads in the data from the files.
                        Adds the subject number and activity number to the test and train sets
                        Merges the test and train sets
                        changes the variable names in the resulting set to descriptive names
                        Extracs the mean and standart deviation of the measurements from the dataset
                        Replaces the activity numbers with actual activity names
                        Groups the data by subject and then activity
                        Calculates the mean of the measurements per group
                        Writes the table to a file
                        