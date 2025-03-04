#!/bin/bash

#The script has the purpose of managing the database of students applications to universities

#It acceses the file text with the initial data, and even if there is no data, the script has an option to add the necessary data to it, so all we need is a text file ready to use for this purpose

#The script outputs a menu with options to edit the list, options represented by commands like:

#1 Changing the current list data. First, we select a student (the line with the elements of the chosen student) and then type the word/name (element of the line) that we want to replace. For GPA, we did a loop with while in order to choose only from the available option (from 1 to 6) and for the status of the application we did a loop in order to only choose from the options displayed on the screen (a sub menu)

#2 Adding a student to the list. We only have to type the data requested on the screen. We have a loop that will keep the script asking you the GPA until you type the correct number (you can't finish/exit until you type a GPA from range 1 to 6). After that, the list will be sorted from A-Z everytime in order to maintain an order and a proper reading

#3 Deleting a student from the list. You have to choose the student (the line with the students data) that you want to be deleted. We even added a question to confirm the choice in case that you mistype the student.

#4 Sorting the list. For any visual preference, there is this option. Here we have another submenu with only 4 choices.

#5 Filter the list. If you want to only display the ACCEPTED/REJECTED/PENDING students, you can use this option of the menu.

#6 Show the full list. If you want to check the list after the changes made, you have this option.

#0 Exit. It closes the script.




clear
echo "In the list are the following: Last name, First Name, GPA, Application status"
nl studentLIST.txt

while [[ $REPLY != 0 ]]; do

 echo "
 Please Select:

    1. Change the data of the chosen student
    2. Add a new student to the list
    3. Delete a student from the list
    4. Sort the list (ascending, descending, alphabetical)
    5. Filter the students list
    6. Show the full list
    0. Quit
 "

 read -p "Enter selection [0-6] > "

 if [[ $REPLY =~ ^[0-6]$ ]]; then
   if [[ $REPLY == 1 ]]; then
     clear
     nl studentLIST.txt  #Here we output the data of the file numbered
     echo "Choose the student you want to edit: "
     read STUDnumber #We read the number of the line where the student we want to edit is
     clear
     sed -n "$STUDnumber p" "studentLIST.txt" #The student we want to edit is showed, to be sure we selected the good one. We used " " because of the variable STUDnumber use
     sed -n "$STUDnumber p" "studentLIST.txt" > contor.txt #We write the line in a new text file that we are going to edit and add later to the list
     echo "Type the element that you want to replace:"
     read element1
     if [[ $element1 == @(PENDING|ACCEPTED|REJECTED) ]]; then #With this condition we try to give only 3 choices when trying to change the status of the application (ACCEPTED/REJECTED/PENDING)

       x=0
#       while [[ $x != [1-3] ]]; do #x is the number typed from the keyboard for the question from this while loop
       for i in {1..1} #The for is for having the question displayed only 1 time. The difference between the versions with for and while is: for - if you type a number outside the range of (1-3), the script gets you back to the main menu and outputs the message from the if..else; while - if you type an incorrect option outside the range (1-3) the question is displayed again with the message from if..else until you type one of the 3 options, and then after you type a correct option you can come back to the main menu with the corresponding modification
       do
       echo "
              What is the new status of the application that you want to attribute to this student?
              1. ACCEPTED
              2. REJECTED
              3. PENDING
"
       read -p "Enter selection [1-3] > " x
       if [[ $x =~ ^[1-3]$ ]]; then
         if [[ $x == 1 ]]; then #For example 1 is for ACCCEPTED so here are the commands that change to this status
         sed -i "s/$element1/ACCEPTED/" "contor.txt" #Here we save the text file with the status changed in an intermediary one
         cat contor.txt >> studentLIST.txt #Now we update the main file with the previous one
         sed -i "$STUDnumber d" "studentLIST.txt" #And we delete the line with the initial status of the student
         sort studentLIST.txt > contor2.txt #We sort the list to be as it was before (the order)
         cat contor2.txt > studentLIST.txt #And here we save it, the sorted list, in the main text file
         clear
         echo "Done. The list has been updated: "
         nl studentLIST.txt #The output
         fi #And then the same goes for the rest of the ifs but with the corresponding status
         if [[ $x == 2 ]]; then
         sed -i "s/$element1/REJECTED/" "contor.txt"
         cat contor.txt >> studentLIST.txt
         sed -i "$STUDnumber d" "studentLIST.txt"
         sort studentLIST.txt > contor2.txt
         cat contor2.txt > studentLIST.txt
         clear
         echo "Done. The list has been updated: "
         nl studentLIST.txt
         fi
         if [[ $x == 3 ]]; then
         sed -i "s/$element1/PENDING/" "contor.txt"
         cat contor.txt >> studentLIST.txt
         sed -i "$STUDnumber d" "studentLIST.txt"
         sort studentLIST.txt > contor2.txt
         cat contor2.txt > studentLIST.txt
         clear
         echo "Done. The list has been updated: "
         nl studentLIST.txt
         fi
       else
         echo "This option is incorrect. The only available choices are from 1 to 3."
       fi
        done
#       done
     else
     if [[ $element1 == [1-6] ]]; then
       element2=0
       while [[ $element2 != [1-6] ]]; do
           echo "Type the new GPA (the GPA is on a range of 1 to 6): "
           read element2
       done
       sed -i "s/$element1/$element2/" "contor.txt"
       cat contor.txt >> studentLIST.txt #We add the text file with the updated data of the student to the list
       sed -i "$STUDnumber d" "studentLIST.txt" #We delete the line with the initial elements of the student
       sort studentLIST.txt > contor2.txt #We sort the list from A-Z to maintain an order and a proper reading
       cat contor2.txt > studentLIST.txt #We save the file with the list sorted
       clear
       echo "Done. The list has been updated: "
       nl studentLIST.txt #The output of the list
     else
     echo "Type the new element:"
     read element2
     sed -i "s/$element1/$element2/" "contor.txt"
     cat contor.txt >> studentLIST.txt #Here we add the text file with the updated data of the student to the list
     sed -i "$STUDnumber d" "studentLIST.txt" #We delete the line with the initial elements of the student
     sort studentLIST.txt > contor2.txt #We sort the list from A-Z to maintain an order and a proper reading
     cat contor2.txt > studentLIST.txt #We sort the list alphabetically for a proper reading
     clear
     echo "Done. The list has been updated: "
     nl studentLIST.txt #The list is showed with the final result
     fi
     fi
   fi
   if [[ $REPLY == 2 ]]; then
     clear
     nl studentLIST.txt #We show the list numbered
     echo "Enter the last name: "
     read lastNAME
     echo "Enter the first name: "
     read firstNAME
     GPA=0
     while [[ $GPA != [1-6] ]]; do
       echo "Enter the GPA (the GPA is ranged from 1 to 6): "
       read GPA
     done
     echo $lastNAME $firstNAME $GPA " PENDING" > contor3.txt #The elements are saved in a new text file so we can add the line (student) in the list
     cat contor3.txt >> studentLIST.txt #We add the student in the list
     sort studentLIST.txt > contor2.txt #We save the sorted list in a txt
     cat contor2.txt > studentLIST.txt #Now we update the list with the txt that contains the list sorted
     clear
     echo "Done. The student was added to the list: "
     nl studentLIST.txt #We output the result
   fi
   if [[ $REPLY == 3 ]]; then
     clear
     nl studentLIST.txt
     echo "Choose the student that you want to delete from the list: "
     read STUDnumber2 #We read the number of the line where the student what we want to delete is
     while [[ $REPLY != [1-2] ]]; do

       echo "Are you sure that you want to delete " $(sed -n "$STUDnumber2 p" "studentLIST.txt") " from the list?" #This line is for confirming that the student chosen is correct
           													   #By showing the line with the data of the corresponding student
       read -p "Enter 1 [YES] or 2 [NO] > " #By a simple choice of 1 or 2 the question is answered and then we have the commands for each one

       if [[ $REPLY =~ ^[1-2]$ ]]; then 
         if [[ $REPLY == 1 ]]; then
         clear
         sed "$STUDnumber2 d" "studentLIST.txt" > contor8.txt #The line with the student is deleted and saved on an intermediary file
         cat contor8.txt > studentLIST.txt #The list is updated with the deleted line
         echo "The student was succesfully deleted from the list: "
         nl studentLIST.txt
         fi
         if [[ $REPLY == 2 ]]; then #If the user changes his mind and press 2, nothing happens to the list
         clear
         echo "The student was not deleted from the list: "
         nl studentLIST.txt
         fi
       fi #We didn't write any else because if the user enters any other number than 1 or 2, the question appears again, until one of the 2 options is chose

     done


   fi
   if [[ $REPLY == 4 ]]; then
     clear
     z=10 #z is the variable for the REPLY to the while from the second menu.
     while [[ $z != 0 ]]; do #This while is used to create the same menu as the previous one, in order to choose what type of sorting do we need
       echo "
       Please Select:

         1. Sort the list from A-Z
         2. Sort the list from Z-A
         3. Sort the list GPA ascending
         4. Sort the list GPA descending
         0. Back
"
       read -p "Enter selection [0-4] > " z

       if [[ $z =~ ^[0-4]$ ]]; then
         if [[ $z == 1 ]]; then
         clear
         sort studentLIST.txt > contor4.txt #This line is the one where we sort the list in every if, with the corresponding command
         cat contor4.txt > studentLIST.txt #And in this line we save the sorted list in the main file
         echo "Done. The list has been sorted: "
         nl studentLIST.txt #And finally the sorted list is showed
         fi
         if [[ $z == 2 ]]; then
         clear
         sort -r studentLIST.txt > contor5.txt #The list is sorted reversed
         cat contor5.txt > studentLIST.txt
         echo "Done. The list has been sorted: "
         nl studentLIST.txt
         fi
         if [[ $z == 3 ]]; then
         clear
         sort -k 3n studentLIST.txt > contor6.txt #Here we sort the lines by the numbers from the third column of the lines
         cat contor6.txt > studentLIST.txt
         echo "Done. The list has been sorted: "
         nl studentLIST.txt
         fi
         if [[ $z == 4 ]]; then
         clear
         sort -k 3r studentLIST.txt > contor7.txt #This sort is the same as the one from the third if, but reversed
         cat contor7.txt > studentLIST.txt
         echo "Done. The list has been sorted: "
         nl studentLIST.txt
         fi
       else #This else is for any number typed that is not in the options menu
         echo "Invalid entry. Choose one of the options displayed on the screen (from 0 to 4)."
       fi
     done
     clear
     echo "In the list are the following: Last Name, First Name, GPA, Application status"
     nl studentLIST.txt
   fi
   if [[ $REPLY == 5 ]]; then #Shows the list with a filter (only ACCEPTED, REJECTED or PENDING)
   clear
   y=0 #y is the REPLY for the second menu (while)
   while [[ $y != [1-3] ]]; do #y is the number typed from the keyboard that represents the option for ACCEPTED, REJECTED or PENDING
   echo "
   What are the applications that you want to see on the screen?
   1. ACCEPTED applications
   2. REJECTED applications
   3. PENDING applications
"
   read -p "Enter selection [1-3] > " y
   if [[ $y =~ ^[1-3]$ ]]; then #Here are the ifs that show the list with the chosen filter
     if [[ $y == 1 ]]; then
     clear
     echo "The list of the accepted students is: "
     grep ACCEPTED studentLIST.txt
     fi
     if [[ $y == 2 ]]; then
     clear
     echo "The list of the rejected students is: "
     grep REJECTED studentLIST.txt
     fi
     if [[ $y == 3 ]]; then
     clear
     echo "The list of the pending students is: "
     grep PENDING studentLIST.txt
     fi
   else
     echo "Invalid entry. Please choose one of the options on the screen (from 1 to 3)."
   fi
   done
   fi
   if [[ $REPLY == 6 ]]; then #Only a way to check the current list after you entered the 5 option from the menu with the filters for example
   clear
   echo "In the list are the following: Last name, First name, GPA, Application status"
   echo "The list of students is: "
   nl studentLIST.txt
   fi
 else #This else is for any number typed that is not in the options menu
   echo "Invalid entry." >&2
   exit 1
 fi

done
echo "Program terminated."
