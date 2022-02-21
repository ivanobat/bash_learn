#!/bin/bash

#Script to find the killer

#First we review the clues
grep "CLUE" crimescene

#Then we try to trace the witness by the name Annabel and female on the people file
grep "Annabel\|\sF\s" people

#We get three matches but only two are female so we focus on those by looking up their address details on streets files
head -n 179 streets/Buckingham_Place | tail -n 1
head -n 40 streets/Hart_Place | tail -n 1

#We get two interview numbers to review
cat interviews/interview-699607
cat interviews/interview-47246024

#One interview clearly shows the person is not from New Zealand so we follow the other one by looking at the details of the vehicle
grep -A 5 "L337\|Honda\|Blue" vehicles

#One hit with all three characterics, so to add proof this is the right person we double check the match with its memberships
cat memberships/AAA memberships/Delta_SkyMiles memberships/Museum_of_Bash_History | grep "Jacqui Maher"

#We get three matches and the height is also closely match so this is for now our main suspect