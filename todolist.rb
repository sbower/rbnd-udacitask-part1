class TodoList
  attr_reader :name, :items

  def initialize(name)
    @name = name
    @items = Array.new
  end

  def change_name(new_name)
    @name = new_name
  end

  def add_item(new_item, completed = false)
    @items.push(Item.new(new_item, completed))
  end

  def remove_item(index = 1)
    valid_index?(index)
    @items.delete_at(index - 1)
  end

  def complete(index = 1)
    valid_index?(index)
    @items[index - 1].completed = true
  end

  def uncomplete(index = 1)
    valid_index?(index)
    @items[index - 1].completed = false
  end

  def move_to_do_up(index)
    reorder_to_do(index, index - 1)
  end

  def move_to_do_down(index)
    reorder_to_do(index, index + 1)
  end

  def reorder_to_do(from, to)
    valid_index?(from)
    valid_index?(to)

    temp = @items[from - 1]
    @items[from - 1] = @items[to - 1]
    @items[to - 1]  = temp
  end

  def to_hash
    {name: @name, items: @items.map { |item| item.to_hash}}
  end

  def to_json(*args)
    to_hash.to_json(*args)
  end

  def self.from_json(string)

    data = JSON.load(string)
    temp = self.new(data['name'])

    data['items'].each do |item|
      temp.add_item(item['description'],item['completed'])
    end
    temp
  end

  def print_list
    puts "-" * 25
    puts @name
    puts "-" * 25

    @items.each do |item|
      item.print_item
    end
  end

  private

  def valid_index?(index)
    raise ArgumentError, 'index is out of bounds' unless index > 0 and index <= @items.length
  end

end

class Item
  attr_writer :completed
  attr_accessor :description

  def initialize(description, completed = false)
    @description = description
    @completed = completed
  end

  def completed?
    @completed
  end

  def print_item
    puts "[#{@completed ? "X" : " "}] #{@description}"
  end

  def to_hash
    {description: @description, completed: @completed}
  end

  def to_json(*args)
    to_hash.to_json(*args)
  end

  def self.from_json(string)
    data = JSON.load(string)
    self.new(data['description'], data['completed'])
  end
end
