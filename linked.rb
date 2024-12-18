# create a linked list class and interatethrough all the methos listed
Class LinkedList
  attr_accessor :head

  def initialize
    self.head = nil
  end

  private

  Class Node
    attr_accessor :value, :nextNode

    def initialize(value, _nextNode)
      self.value = value
      self.nextNode = nextnode
    end
end 
end

def append
  LinkedList.append(value)
end

def prepend
  LinkedList.prepend(value)
end

def size
  LinkedList.size
end

def tail
  LinkedList.tail
end

def at
  LinkedList.at(index)
end

def pop
  LinkedList.pop
end

def contains
  LinkedList.contains?(value)
end

def find
  LinkedList.find(value)
end

def to_s
  LinkedList.to_s
end

def insert_at
  LinkedList.insert_at(value, index)
end

def remove_at
  LinkedList.remove_at(index)
end
