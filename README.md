# Students Database Management Script

## 📘 Project Overview
This Bash script is designed to manage a simple student database for university applications. It works with a plain text file and provides an interactive menu for handling student records.

## 🛠️ Features
- **1. Edit Student Data:** Update student details, including GPA (validated between 1–6) and application status (ACCEPTED/REJECTED/PENDING).
- **2. Add a Student:** Input student information, automatically sorting the list alphabetically.
- **3. Delete a Student:** Select a student to remove, with a confirmation step to prevent mistakes.
- **4. Sort the List:** Choose sorting options (A–Z, Z–A, GPA ascending/descending).
- **5. Filter Applications:** View only students with a specific application status.
- **6. View Full List:** Display the entire student database after any changes.
- **7. Exit:** Close the script safely.

The script ensures data integrity with input validation, user confirmations, and automatic list sorting. Perfect for small teams or projects that need a quick and lightweight student management system!

## 📂 File Requirement
A text file (`studentLIST.txt`) to store student data. If it doesn't exist, the script allows adding initial data.

## 🚀 How to Run
```bash
chmod +x student_db.sh  
./student_db.sh
```
