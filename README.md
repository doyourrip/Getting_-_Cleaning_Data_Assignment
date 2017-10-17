# Getting_-_Cleaning_Data_Assignment

This is my submission for the final Assignemtn of Getting & Cleaning Data module of the Data Science Specialisation on Coursera.

For this assignment the task is to download and tidy a dataset containing "wearbale tech" data from 30 volunteers.  

The submission is a script whcih performs all the necessary tasks to clean and write a new table taht has been "tidied".

the R scrpit in my submission is broken down into these steps:

## Getting the Data ##
    Download the dataset if it does not already exist in the working directory

## Reading the files into R training and test files separately ##
    Loads the training and test datasets
  
## Reading Features & Activity Labels ##
    Load the activity and feature info

## MERGE ##
    Merges the two datasets

## Mean and StDev Calcs for each Measurement ##
    Keep only those columns which reflect a mean or standard deviation
    Merge activity and subject data with corresponding columns 
  
## Merge Activity ID's & Write new tidy table ##
    Creates and write tidy dataset
