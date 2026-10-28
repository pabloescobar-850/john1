//1. Shell Programming (CO1)
//Write a program to implement an address book with options given below:
//a) Create address book. b) View address book. c) Insert a record. d) Delete a record e) //Modify a
//record. f) Exit

//BASH

#!/bin/bash

# File to store address book records
file="addressbook.txt"

while true
do
    echo "----------------------------"
    echo "       ADDRESS BOOK"
    echo "----------------------------"
    echo "1. Create Address Book"
    echo "2. View Address Book"
    echo "3. Insert Record"
    echo "4. Delete Record"
    echo "5. Modify Record"
    echo "6. Exit"

    read -p "Enter your choice: " choice

    case $choice in

        1)
            # Create a new address book
            touch "$file"
            echo "Address Book Created Successfully!"
            ;;

        2)
            # Display all records
            if [ -s "$file" ]; then
                echo "Name | Phone | Email"
                cat "$file"
            else
                echo "Address Book is Empty!"
            fi
            ;;

        3)
            # Insert a new record
            read -p "Enter Name: " name
            read -p "Enter Phone: " phone
            read -p "Enter Email: " email

            # Save record in file
            echo "$name | $phone | $email" >> "$file"
            echo "Record Inserted Successfully!"
            ;;

        4)
            # Delete a record using name
            read -p "Enter Name to Delete: " name

            if [ -f "$file" ]; then
                grep -Fv "$name |" "$file" > temp.txt
                mv temp.txt "$file"
                echo "Record Deleted!"
            else
                echo "Address Book Not Found!"
            fi
            ;;

        5)
            # Modify an existing record
            read -p "Enter Name to Modify: " name

            if [ -f "$file" ]; then
                # Remove old record
                grep -Fv "$name |" "$file" > temp.txt
                mv temp.txt "$file"

                # Enter updated details
                read -p "Enter New Name: " newname
                read -p "Enter New Phone: " phone
                read -p "Enter New Email: " email

                # Add updated record
                echo "$newname | $phone | $email" >> "$file"
                echo "Record Modified Successfully!"
            else
                echo "Address Book Not Found!"
            fi
            ;;

        6)
            # Exit the program
            echo "Exiting Address Book..."
            exit 0
            ;;

        *)
            # Handle invalid menu choice
            echo "Invalid Choice! Try Again."
            ;;
    esac
done

//save as addressbook.sh


//after that 
chmod +x addressbook.sh
./addressbook.sh 
//above wala in terminal

