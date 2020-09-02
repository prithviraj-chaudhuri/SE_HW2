# HW3 - GAME OF LIFE EVALUATION
## REPORT
*Languages considered- Rust, Fortran and Go*

**Methods:**

Web based user friendly approach used for the human trials.
User was provided with token via email/slack during the start of the session, and asked to log in to the web page.
The 1st page was a pre-debugging survey, to gauge the user comfort with debugging the code in various languages. This survey was a rating, on a scale from 1-5. This scale is useful and convenient for evaluation of the 3 languages, and form a weighing metric in the evaluation formula.
The next page, consisted of instructions to the user, the buggy code and link to ide for debugging in all the 3 languages. Prior to experiment evaluation on the difficulty level of the bugs were performed and care was taken such that most of the users could complete debugging in all 3 languages in the given time slot. 1 logical bug per coding language of similar nature was introduced.
This page also had a start and stop button to note down the debugging time taken as an evaluation metric. 


**Materials:**

*User Material -*

1) bare minimal- just a link to the web page, self-driven and 95% automated. Only the token needs to be provided manually by the admin.
2) Stable internet connection.

*Admin Materials-*

1) Maintain the web server and client, and a database where the evaluation data is collected.
2) A script to fetch the metrics and evaluate languages and compare the 3 languages.
3) AWS server keys and service of the server.
4) Access to online IDE for every language.

*Observation-*

1)	The pre-debugging survey consists of eight questions whose responses are metrics to the evaluation script. The result of the evaluation script incorporates data of all the users to show which language seemed easiest to debug in.  
The responses are the choices from 1 to 5 for each question so that it is convenient for the admin to use it in the formula.

2)	The Questions were :

  Q1. How well do you know Game Of Life?

  Q2. How comfortable are you in coding GOL from scratch?

  Q3. How familiar are you with rules of GOL?

  Q4. Rate your programming skills.

  Q5. How long have you been coding? 1 means 1+ years, 2 means 2 + years etc.

  Q6. Rate your programming experience with Go

  Q7.Rate your programming experience with Rust.

  Q8. Rate your programming experience with Fortran

3)	The formula is as follows:

   *Go:*
          {∑all users(Q1 response + Q2 response + Q3 response + Q4 response)(Q5 response)(Q6 response)} / {∑all users (TimeGD  )}

   *Rust:*
          {∑all users(Q1 response + Q2 response + Q3 response + Q4 response)(Q5 response)(Q7 response)} / {∑all users (TimeRD  )}

   *Fortran:*
          {∑all users(Q1 response + Q2 response + Q3 response + Q4 response)(Q5 response)(Q8 response)} / {∑all users (TimeFD  )}

    Where,

          Q1 response = Answer to question 1 on the scale of 1 to 5

          Q2 response = Answer to question 2 on the scale of 1 to 5

          Q3 response = Answer to question 3 on the scale of 1 to 5

          Q4 response = Answer to question 4 on the scale of 1 to 5

          Q5 response = Answer to question 5 on the scale of 1 to 5

          Q6 response = Answer to question 6 on the scale of 1 to 5

          Q7 response = Answer to question 7 on the scale of 1 to 5

          Q8 response = Answer to question 8 on the scale of 1 to 5

          TimeGD = Debugging time for Go

          TimeRD = Debugging time for Rust

          TimeFD = Debugging time for Fortran

For each language, the result is calculated by taking summation of every user’s response pertaining to that language.

The formula is derived by considering the responses on the scale of 1 to 5 and mapping them as weights in the formula.

The weights of first four questions are added because they do not count as much towards finding the better language to debug in, as they just test the user’s knowledge towards game of life.
The weight of next question is multiplied as it indicates how much the user is experienced in coding and it will surely contribute a lot towards how easily a user can debug the code.

The next weight in the formula is to show how familiar is the user with that particular language, say Go. This will also be multiplied because if a user is experienced in Go, it will be easy for him to debug that code and it will directly contribute towards the ease in debugging in that language.

The final weight is the time taken to debug in the language, which is in the denominator part of the formula. So, if a person takes 7 minutes to debug in Go and 5 minutes to debug in Fortran, it will indicate that it was easier to figure things out in Fortran as compared to Go. If the denominator is higher the fraction result will be smaller. Higher the denominator => Smaller the result => More difficulty in debugging

So, the highest number in the result suggests the easiest language to debug in. Similarly, lowest number specifies the most difficult language to debug in.

4)	Following is the snapshot of the evaluation script.

 ![image (4)](https://user-images.githubusercontent.com/59896588/92016788-d5355500-ed20-11ea-96a3-ea1998344f98.png)

According to the script, Rust seems to be the easiest language to debug in, followed by Fortran and then Go.

**Conclusion:**

The experiment was successful, and most of the subjects were able to find the bugs in all 3 languages in the given time frame. User experience was hassle free due to automated nature. Overall, the experiment seemed to be little biased due to implementation of same logic in all 3 languages.

**Threats to Validity:**

1) Results seemed to be biased as the implementation of the logic in all 3 languages was same. This gave biased results towards the language user 1st debugs in. An observation was made that based on the language user picked up first, took the largest time, the remaining two took about the same time. As a learning, to avoid this, we may attempt to change the logic a little bit in all three languages.
2) Number of data sets were too less to come to conclusive results. Larger subjects would give us better results.
3) The part of monitoring the participants during the study was not automated as we yet need to verify whether the participant correctly debugged the programs or not. We have used online IDEs, where user debugs the code and run the program. However, it could happen that the participant does not actually debug the program and go ahead and close their session by breaking the assumed trust. This makes our study prone to false information because of dishonesty of participant. Thus, we had to verify what output that were displayed on their screens and tell them to stop the session. This could have been solved by using any free code editor APIs, if available.
