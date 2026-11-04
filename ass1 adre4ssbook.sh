//1. Shell Programming (CO1)
//Write a program to implement an address book with options given below:
//a) Create address book. b) View address book. c) Insert a record. d) Delete a record e) //Modify a
//record. f) Exit

//BASH

#!/bin/bash

FILE="addressbook.txt"

create_book()
{
    > "$FILE"
    echo "Address book created successfully."
}

view_book()
{
    if [ -f "$FILE" ]
    then
        if [ -s "$FILE" ]
        then
            printf "%-15s %-5s %-7s %-7s %-12s %-12s %-10s\n" "Name" "Age" "Grade" "Marks" "Gender" "Department" "Hosteller"

            while IFS="|" read -r name age grade marks gender dept hosteller
            do
                printf "%-15s %-5s %-7s %-7s %-12s %-12s %-10s\n" "$name" "$age" "$grade" "$marks" "$gender" "$dept" "$hosteller"
            done < "$FILE"
        else
            echo "Address book is empty."
        fi
    else
        echo "Address book does not exist."
    fi
}

insert_record()
{
    echo "Enter Name:"
    read name
    echo "Enter Age:"
    read age
    echo "Enter Grade:"
    read grade
    echo "Enter Marks:"
    read marks
    echo "Enter Gender:"
    read gender
    echo "Enter Department:"
    read dept
    echo "Enter Hosteller (Yes/No):"
    read hosteller

    echo "$name|$age|$grade|$marks|$gender|$dept|$hosteller" >> "$FILE"
    echo "Record inserted successfully."
}

delete_record()
{
    echo "Enter Name to delete:"
    read name

    if grep -q "^$name|" "$FILE"
    then
        sed -i "/^$name|/d" "$FILE"
        echo "Record deleted successfully."
    else
        echo "Record not found."
    fi
}

modify_record()
{
    echo "Enter Name to modify:"
    read name

    if grep -q "^$name|" "$FILE"
    then
        echo "Enter New Name:"
        read newname
        echo "Enter New Age:"
        read age
        echo "Enter New Grade:"
        read grade
        echo "Enter New Marks:"
        read marks
        echo "Enter New Gender:"
        read gender
        echo "Enter New Department:"
        read dept
        echo "Enter New Hosteller (Yes/No):"
        read hosteller

        sed -i "s/^$name|.*/$newname|$age|$grade|$marks|$gender|$dept|$hosteller/" "$FILE"
        echo "Record modified successfully."
    else
        echo "Record not found."
    fi
}

while true
do
    echo
    echo "============================== ADDRESS BOOK =============================="
    echo "1. Create Address Book"
    echo "2. View Address Book"
    echo "3. Insert Record"
    echo "4. Delete Record"
    echo "5. Modify Record"
    echo "6. Exit"
    echo "==========================================================================="
    echo "Enter your choice:"
    read choice

    case $choice in
        1)
            create_book
            ;;
        2)
            view_book
            ;;
        3)
            insert_record
            ;;
        4)
            delete_record
            ;;
        5)
            modify_record
            ;;
        6)
            echo "Exiting Address Book..."
            break
            ;;
        *)
            echo "Invalid choice."
            ;;
    esac
done
//save as addressbook.sh


//after that 
chmod +x addressbook.sh
./addressbook.sh 
//above wala in terminal



COde part 2 

#!/bin/bash
FILE="addressbook.txt"

while true
do
        echo "------ADDRESS BOOK-------"
        echo "1. Create a address book"
        echo "2. View a addrress book"
        echo "3. Insert a record into book"
        echo "4. Delete a record into book"
        echo "5. Modify a record into book"
        echo "6. Exit"
        read -r -p "Enter the choice " choice
        case "$choice" in

        1)
            echo -e "NAME\tADDRESS\tPHONE\tBRANCH\tCGPA\tHOSTEL" > "$FILE"
            echo "Address book created successfully"
            ;;

        2)
            if [ -f "$FILE" ] && [ -s "$FILE" ]; then
                cat "$FILE"
            else
                 echo "BOOK IS EMPTY NOTHING TO SHOW"
            fi
            ;;

        3)
           if [ ! -f "$FILE" ]; then
              echo -e "NAME\tADDRESS\tPHONE\tBRANCH\tCGPA\tHOSTEL" > "$FILE"
           fi
           read -r -p "Enter the name to insert:- " name
           read -r -p "Enter the address of student:- " add
           read -r -p "Enter the phone of student:- " phone
           read -r -p "Enter the branch of student:- " branch
           read -r -p "Enter the cgpa of student:- " cgpa
           read -r -p "Enter hostellite or not(y/n):- " hostel
           echo -e "$name\t$add\t$phone\t$branch\t$cgpa\t$hostel" >> "$FILE"
           echo "Record inserted successfully"
           ;;

        4)
           read -r -p "Enter the name of the recordd to delete:- " name
           grep -v "^${name}$(printf '\t')" "$FILE" > temp
           mv temp "$FILE"
           echo "Record deleted successfulyy"
           ;;

        5)
           read -r -p "Enter the name of the record to modify:- " name
           grep -v "^${name}$(printf '\t')" "$FILE" > temp
           mv temp "$FILE"
           read -r -p "ENter the new name :- " newname
           read -r -p "Enter the new add:- " newadd
           read -r -p "Enter the new phone:- " newphone
           read -r -p "Enter the new branch:- " newbranch
           read -r -p "Enter the new cgpa:- " newcgpa
           read -r -p "Enter the new status of hostellite(y/n)?:- " newhostel
           printf "%s\t%s\t%s\t%s\t%s\t%s\n" "$newname" "$newadd" "$newphone" "$newbranch" "$newcgpa" "$newhostel" >> "$FILE"
           echo "Record modified succesfully"
           ;;
        6)
           echo "Exiting, thank you!!!"
           exit
           ;;
        *)
           echo "Inavlid input , try again"
           ;;
        esac
done

//save as addressbook.sh


//after that 
chmod +x addressbook.sh
./addressbook.sh 
//above wala in terminal
