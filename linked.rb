class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    new_node = Node.new(value, nil)
    if @head.nil?
      @head = new_node
    else
      current = @head
      current = current.next_node while current.next_node
      current.next_node = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value, @head)
    @head = new_node
  end

  def size
    count = 0
    current = @head
    while current
      count += 1
      current = current.next_node
    end
    count
  end

  def tail
    return nil if @head.nil?
    current = @head
    current = current.next_node while current.next_node
    current
  end

  def at(index)
    return nil if index < 0
    current = @head
    index.times do
      return nil if current.nil?
      current = current.next_node
    end
    current
  end

  def pop
    return nil if @head.nil?
    if @head.next_node.nil?
      popped = @head
      @head = nil
      return popped
    end
    current = @head
    while current.next_node.next_node
      current = current.next_node
    end
    popped = current.next_node
    current.next_node = nil
    popped
  end

  def contains?(value)
    current = @head
    while current
      return true if current.value == value
      current = current.next_node
    end
    false
  end

  def find(value)
    current = @head
    index = 0
    while current
      return index if current.value == value
      current = current.next_node
      index += 1
    end
    nil
  end

  def to_s
    current = @head
    string = ""
    while current
      string += "( #{current.value} ) -> "
      current = current.next_node
    end
    string + "nil"
  end

  def insert_at(value, index)
    return prepend(value) if index == 0
    return nil if index < 0

    current = @head
    (index - 1).times do
      return nil if current.nil?
      current = current.next_node
    end
    return nil if current.nil?

    new_node = Node.new(value, current.next_node)
    current.next_node = new_node
  end

  def remove_at(index)
    return nil if @head.nil? || index < 0
    if index == 0
      removed = @head
      @head = @head.next_node
      return removed
    end

    current = @head
    (index - 1).times do
      return nil if current.nil?
      current = current.next_node
    end
    return nil if current.nil? || current.next_node.nil?

    removed = current.next_node
    current.next_node = current.next_node.next_node
    removed
  end

  private

  class Node
    attr_accessor :value, :next_node

    def initialize(value, next_node)
      @value = value
      @next_node = next_node
    end
  end
end
```

And here's how you can test it in a `main.rb` file:

```ruby
require_relative 'linked'

list = LinkedList.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')

puts list
puts "Size: #{list.size}"
puts "Contains 'cat'?: #{list.contains?('cat')}"
puts "Index of 'parrot': #{list.find('parrot')}"

list.insert_at('rabbit', 2)
puts "After inserting 'rabbit' at index 2:"
puts list

list.remove_at(3)
puts "After removing node at index 3:"
puts list
```
