# Congress-LES-scores
Legislative effectiveness can be quantified by Legislative Effectiveness Scores.
This project examines the question: how does one’s vote percent needed to enter congress affect congressional legislative effectiveness?
The dataset comes from the Center for Effective Lawmaking through https://thelawmakers.org/data-download labeled “Legislative Effectiveness Data from 93rd-110th Congress (1973-2008)”. 

# Background 
The score is calculated by finding the sum of  “five large terms [that] represent the member’s fraction of bills (1) introduced, (2) receiving action in committee, (3) receiving action beyond committee, (4) passing the House, and (5) becoming law, relative to all N legislators” (Center for Effective Lawmaking).

# Method 
I used linear regressions to determine how vote percent received to enter Congress affects LES. I controlled for previous LES, seniority, majority party status, the interaction between previous LES and vote percent received, and added the unique member ID as a fixed effect. 

# Substantive Findings
The outcome variable les is affected in the following ways: a one unit increase of votepct is associated with a 0.0064 point decrease in les, a one unit increase of leslag is associated with a 0.123 point decrease in LES, a one unit increase of seniority is associated with a 0.097 point increase in LES, a one unit increase in majority (member is a part of the majority party) is associated with a 1.308 point increase in LES, and the interaction term between votepct and leslag is associated with a 0.0059 point increase in les. All of these effects are observed while holding all other variables constant. 
The findings imply increased vote percent is negatively associated with Legislative Effectiveness Score. This is problematic because it may suggest that legislators who are more popular are less effective. 
