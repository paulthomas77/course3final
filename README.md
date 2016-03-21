# course3final
This contains the final project for Getting and Cleaning Data, Course 3 of the Coursera Class from JHU.

This repository contains four files, the script used to generate the tidy data sets for the final project (run_analysis.R) and a codebook (codebook.md) that explains the variables in the data tables. I have also included the final data tables. 

The analysis file is annotated and is based on downloading the data repository from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and using that as your working directory. It merges the test and train data sets, extracts the mean and standard deviation info for each variable, renames the activities, and adds the relevant variable names. It then writes this result into a csv file (dataset1). 

Then, using dplyr, it summarizes the data by subject and by activity, averaging the mean of each of the variables in the processed file above (dataset2).
