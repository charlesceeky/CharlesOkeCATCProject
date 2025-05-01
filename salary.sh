#!/usr/bin/env bash

read -p "Enter starting salary: " start_salary
read -p "Enter number of points on the salary scale: " points
read -p "Enter salary increment per year: " increment
read -p "Is the employee a manager? (yes/no): " is_manager

# Set increment multiplier (2 for managers)
if [[ "$is_manager" == "yes" ]]; then
    yearly_increment=$(echo "$increment * 2" | bc)
else
    yearly_increment=$increment
fi

current_year=$(date +%Y)
salary=$start_salary

echo
echo "Salary Scale Table:"
echo "--------------------"
for (( i=0; i<points; i++ ))
do
    echo "Year $((current_year + i)): €${salary}"
    salary=$(echo "$salary+($salary * $yearly_increment/100)" | bc)
done
