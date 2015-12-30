#!/usr/bun/env ruby

require './todolist.rb'

# Creates a new todo list
list = TodoList.new("Shawn's List")

# Add four new items
list.add_item("item1")
list.add_item("item2")
list.add_item("item3")
list.add_item("item4")

# Print the list
list.print_list

# Delete the first item
list.remove_item(1)

# Print the list
list.print_list

# Delete the second item
list.remove_item(2)

# Print the list
list.print_list

# Update the completion status of the first item to complete
list.complete(1)

# Print the list
list.print_list

# Update the title of the list
list.change_name("New List")

# Print the list
list.print_list
