#!/usr/bin/env bash

#
# a204f167157a3f27959c66707c397638
# vlinux
# bash2
# v1
# necu20
# 2021-08-21 19:25:00
# v4.0.0 (2019-03-05)
#
# Generated 2021-08-21 21:25:00 by dbwebb lab-utility v4.0.0 (2019-03-05).
# https://github.com/dbwebb-se/lab
#

export ANSWER
. .dbwebb.bash
echo "${PROMPT}Ready to begin."



# ==========================================================================
# Lab 2 - vlinux 
# 
# A lab where you use Unix tools available from the command line interface
# together with a little Bash, to find and handle information in a [IRC
# loggfil](ircLog.txt).
#

# --------------------------------------------------------------------------
# Section 1. Bash 
# 
# Train Linux commands and use them together with Bash.
#
# I this exercise you will mainly use comands like `grep`, `wc`, `head` and
# `tail` to search for information in a log file from the irc-chat.
#
# Then you combine the output of the commands to variables in Bash. Use the
# man-pages when needed to find information on how to solve the exercises.
#

#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Exercise 1.1 (1 points) 
# 
# Create a variable named `FILE` and give it the value `ircLog.txt`.
#
# Answer with the value of `$FILE`.
#
# Write your code below and put the answer into the variable ANSWER.
#


FILE=ircLog.txt

ANSWER=$FILE

# I will now test your answer - change false to true to get a hint.
assertEqual "1.1" false

#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Exercise 1.2 (1 points) 
# 
# Use the `wc` command to count the number of lines in the irc log. Show only
# the number of lines and the name of the file, seperated by a space.
#
# Save the answer in a variable and answer with that variable.
#
# Write your code below and put the answer into the variable ANSWER.
#

ex1_2="$(cat $FILE | wc -l) $FILE"

ANSWER=$ex1_2

# I will now test your answer - change false to true to get a hint.
assertEqual "1.2" true 

#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Exercise 1.3 (1 points) 
# 
# Use `wc` together with `cut` to count the number of words in the irc log.
#
# Save only the number of words in a variable and answer with the variable.
#
# Tip: Use the pipe (`|`) command.
#
# Write your code below and put the answer into the variable ANSWER.
#

ex1_3=$(cat $FILE | wc -w)

ANSWER=$ex1_3

# I will now test your answer - change false to true to get a hint.
assertEqual "1.3" false

#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Exercise 1.4 (1 points) 
# 
# Find the row with 'pansars' opinion of 'notepad'.
#
# Save the answer in a variable and answer with that variable.
#
# Write your code below and put the answer into the variable ANSWER.
#

ex1_4=$(grep "pansar.*notepad" $FILE)

ANSWER=$ex1_4

# I will now test your answer - change false to true to get a hint.
assertEqual "1.4" true

#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Exercise 1.5 (1 points) 
# 
# Find the last four rows in the logfile.
#
# Write your code below and put the answer into the variable ANSWER.
#


ANSWER=$(tail -4 $FILE)

# I will now test your answer - change false to true to get a hint.
assertEqual "1.5" false

#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Exercise 1.6 (1 points) 
# 
# When was the log opened for the first time? Hint: 'Log opened'.
#
# Answer with the row that says when the log was opened for the first time.
#
# Write your code below and put the answer into the variable ANSWER.
#



ANSWER=$(grep "Log opened" $FILE | head -1)

# I will now test your answer - change false to true to get a hint.
assertEqual "1.6" true

#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Exercise 1.7 (1 points) 
# 
# What does the third line where 'wasa' says something say?
#
# Write your code below and put the answer into the variable ANSWER.
#


ANSWER=$(grep "wasa" $FILE | sed -n "3,3 p")

# I will now test your answer - change false to true to get a hint.
assertEqual "1.7" false

#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Exercise 1.8 (1 points) 
# 
# How many lines is logged at the time 11:15?
#
# Write your code below and put the answer into the variable ANSWER.
#



ANSWER=$( grep -c "11:15" $FILE )

# I will now test your answer - change false to true to get a hint.
assertEqual "1.8" false

#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Exercise 1.9 (1 points) 
# 
# Find the first row where 'pansar' says something when the time is 07:48.
#
# Write your code below and put the answer into the variable ANSWER.
#

ex1_9=$(grep "07:48.*pansar" $FILE | head -1)

ANSWER=$ex1_9

# I will now test your answer - change false to true to get a hint.
assertEqual "1.9" false

#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Exercise 1.10 (1 points) 
# 
# Find the first 10 lines from 'Wed Jun 17 2015'.
#
# Write your code below and put the answer into the variable ANSWER.
#

ex1_10=$(grep "Wed Jun 17 2015" $FILE -A 10 | sed -n "2,11 p")

ANSWER=$ex1_10

# I will now test your answer - change false to true to get a hint.
assertEqual "1.10" true 

# --------------------------------------------------------------------------
# Section 2. Extra assignments 
# 
# Solve these optional questions to earn extra points.
#

#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Exercise 2.1 (3 points) 
# 
# Find the lines that are from the 'forum' and contains details about
# 'projektet' and 'htmlphp'.
#
# Write your code below and put the answer into the variable ANSWER.
#

ex2_1=$(grep "Forumet.*htmlphp.*projektet" $FILE)


ANSWER=$ex2_1

# I will now test your answer - change false to true to get a hint.
assertEqual "2.1" true 

#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Exercise 2.2 (3 points) 
# 
# What did 'Bobbzorzen' say on the line, two lines before he said 'cewl'?
#
# Write your code below and put the answer into the variable ANSWER.
#

ex2_2=$(grep "<@Bobbzorzen>" $FILE | grep "cewl" -B 2 | head -1)


ANSWER=$ex2_2


# I will now test your answer - change false to true to get a hint.
assertEqual "2.2" true

#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Exercise 2.3 (3 points) 
# 
# How many words are there in the fourth to ninth row, under the day 'Mon Jun 08 2015'?
#
# Write your code below and put the answer into the variable ANSWER.
#

ex2_3=$(grep "Mon Jun 08 2015" $FILE -A 9 | tail -6 | wc -w)


ANSWER=$ex2_3

# I will now test your answer - change false to true to get a hint.
assertEqual "2.3" true 


exitWithSummary
