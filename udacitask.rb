#!/usr/bun/env ruby

require './todolist.rb'
require 'json'

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

# move item in the second position to the first position
list.move_to_do_up(2)

# Print the list
list.print_list

puts
begin
  # move item to to the first position
  list.move_to_do_up(1)

  # Print the list
  list.print_list
rescue
  puts "should throw error since we can't move the first item in the list up any futher"
end
puts

# Update the title of the list
list.change_name("New List")

# Print the list
list.print_list

# export the list object to JSON
puts
puts "the following is a json representation of the list"
puts JSON.dump(list)
puts

#Build list from JSON
list2 = TodoList.from_json("{\"name\":\"From List\",\"items\":[{\"description\":\"item5\",\"completed\":true},{\"description\":\"item6\",\"completed\":true}]}")

# Print the list
list2.print_list

# uncomplete item
list2.uncomplete(2)

# Print the list
list2.print_list

# Build list from JSON, from the original list, adding a new item to verify
list.add_item("itemAdded")
list3 = TodoList.from_json(list.to_json)

# print the list
list3.print_list

# edit task description
list3.edit_task_name(1, "This is the new task name")

# print the list
list3.print_list
