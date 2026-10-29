//1. Shell Programming (CO1)
//Write a program to implement an address book with options given below:
//a) Create address book. b) View address book. c) Insert a record. d) Delete a record e) //Modify a
//record. f) Exit

//BASH

#!/bin/bash

FILE="addressbook.txt"

# Create a new address book
create_book()
{
    > "$FILE"
    echo "Address book created successfully."
}

# View all records
view_book()
{
    if [ -f "$FILE" ]
    then
        if [ -s "$FILE" ]
        then
            printf "%-15s %-5s %-7s %-7s %-12s %-12s %-10s\n" "Name" "Age" "Grade" "Marks" "Gender" "Department" "Hosteller"
            echo "--------------------------------------------------------------------------"

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

# Insert a new record
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

# Delete a record by name
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

# Modify an existing record
modify_record()
{
    echo "Enter Name to modify:"
    read name

    if grep -q "^$name|" "$FILE"
    then
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

        sed -i "s/^$name|.*/$name|$age|$grade|$marks|$gender|$dept|$hosteller/" "$FILE"

        echo "Record modified successfully."
    else
        echo "Record not found."
    fi
}

# Display menu repeatedly
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

