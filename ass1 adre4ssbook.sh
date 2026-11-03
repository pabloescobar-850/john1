//1. Shell Programming (CO1)
//Write a program to implement an address book with options given below:
//a) Create address book. b) View address book. c) Insert a record. d) Delete a record e) //Modify a
//record. f) Exit

//BASH

#!/bin/bash

FILE="addressbook.txt"

while true
do
    echo "------ADDRESS BOOK-------"
    echo "1. Create an address book"
    echo "2. View an address book"
    echo "3. Insert a record"
    echo "4. Delete a record"
    echo "5. Modify a record"
    echo "6. Exit"

    read -r -p "Enter your choice: " choice

    case "$choice" in
        1)
            printf "NAME\tADDRESS\tPHONE\tBRANCH\tCGPA\tHOSTEL\n" > "$FILE"
            echo "Address book created successfully"
            ;;

        2)
            if [ -f "$FILE" ] && [ -s "$FILE" ]; then
                cat "$FILE"
            else
                echo "Address book is empty or does not exist"
            fi
            ;;

        3)
            if [ ! -f "$FILE" ]; then
                printf "NAME\tADDRESS\tPHONE\tBRANCH\tCGPA\tHOSTEL\n" > "$FILE"
            fi

            read -r -p "Enter name: " name
            read -r -p "Enter address: " add
            read -r -p "Enter phone: " phone
            read -r -p "Enter branch: " branch
            read -r -p "Enter CGPA: " cgpa
            read -r -p "Hostellite? (y/n): " hostel

            printf "%s\t%s\t%s\t%s\t%s\t%s\n" "$name" "$add" "$phone" "$branch" "$cgpa" "$hostel" >> "$FILE"
            echo "Record inserted successfully"
            ;;

        4)
            if [ ! -f "$FILE" ]; then
                echo "Address book does not exist"
                continue
            fi

            read -r -p "Enter the name of the record to delete: " name

            if grep -q "^${name}$(printf '\t')" "$FILE"; then
                grep -v "^${name}$(printf '\t')" "$FILE" > temp
                mv temp "$FILE"
                echo "Record deleted successfully"
            else
                echo "Record not found"
            fi
            ;;

        5)
            if [ ! -f "$FILE" ]; then
                echo "Address book does not exist"
                continue
            fi

            read -r -p "Enter the name of the record to modify: " name

            if grep -q "^${name}$(printf '\t')" "$FILE"; then
                grep -v "^${name}$(printf '\t')" "$FILE" > temp
                mv temp "$FILE"

                read -r -p "Enter new name: " newname
                read -r -p "Enter new address: " newadd
                read -r -p "Enter new phone: " newphone
                read -r -p "Enter new branch: " newbranch
                read -r -p "Enter new CGPA: " newcgpa
                read -r -p "New hostellite status (y/n): " newhostel

                printf "%s\t%s\t%s\t%s\t%s\t%s\n" "$newname" "$newadd" "$newphone" "$newbranch" "$newcgpa" "$newhostel" >> "$FILE"
                echo "Record modified successfully"
            else
                echo "Record not found"
            fi
            ;;

        6)
            echo "Exiting..."
            exit 0
            ;;

        *)
            echo "Invalid input, try again"
            ;;
    esac
done
//save as addressbook.sh


//after that 
chmod +x addressbook.sh
./addressbook.sh 
//above wala in terminal
