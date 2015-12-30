class TodoList
  attr_reader :name, :items

  def initialize(name)
    @name = name
    @items = Array.new
  end

  def change_name(new_name)
    @name = new_name
  end

  def add_item(new_item)
    @items.push(Item.new(new_item))
  end

  def remove_item(index = 1)
    @items.delete_at(index - 1)
  end

  def complete(index = 1)
    @items[index - 1].completed = true
  end

  def print_list
    puts "-" * 25
    puts @name
    puts "-" * 25

    i = 1
    @items.each do |item|
      #puts "#{i} - #{item.description}#{item.description}\tCompleted: #{item.completed?}"
      puts "[#{item.completed? ? "X" : " "}] #{item.description}"
    end
  end
end

class Item
  attr_writer :completed
  attr_accessor :description

  def initialize(description)
    @description = description
    @completed = false
  end

  def completed?
    @completed
  end
end
