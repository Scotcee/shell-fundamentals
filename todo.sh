#!/bin/bash

TODO_FILE="todo.txt"

show_menu(){
    echo "ToDo MENU"
    echo "1. Add a new task"
    echo "2. View tasks"
    echo "3. Remove a task"
    echo "4. Exit"
}

view_tasks(){
    if [[ -s $TODO_FILE ]]; then
    echo "Current tasks available for me:"
    nl -w2 -s'. ' "$TODO_FILE"
  else
    echo "No tasks found."
  fi
}

add_task(){
    read -p "Please enter the task to the add to the todo list: " task
    echo "$task" >> "$TODO_FILE"
    echo "Successfully added the task to the todo list."
}

delete_task(){
    view_tasks
    read -p "Please enter task number for deletion:" num
   if [[ "$num" =~ ^[0-9]+$ ]]; then
    sed -i "${num}d" "$TODO_FILE"
    echo "Task number $num has been permanently deleted."
  else
    echo "Invalid task number."
  fi
}

while true; do
    show_menu
    read -p "Please select an option: " choice
    case $choice in
        1) add_task ;;
        2) view_tasks ;;
        3) delete_task ;;
        4) echo "closing ToDo"; exit 0 ;;
        *) echo "Invalid option, please try again." ;;
    esac
    echo
done