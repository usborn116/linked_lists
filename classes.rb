class LinkedList
	attr_accessor :size, :head, :tail

	def initialize
		@head = nil
		@tail = nil
		@size = 0
	end

  def empty(node)
    return false unless self.head.nil?
    if self.head.nil?
      self.head = node
      self.tail = node
      return true
    end
  end

  def node(value)
    Node.new(value)
  end

	def create_node(value)
    self.size += 1
		node(value)
	end

	def append(value)
		new_node = create_node(value)
		if !empty(new_node)
			self.tail.next_node = new_node
			self.tail = new_node
		end
	end

	def prepend(value)
		new_node = create_node(value)
		if !empty(new_node)
			new_node.next_node = self.head
			self.head = new_node
		end
	end

	def at(index, node = head, i = 0)
		return "The node at index #{index} is #{node.data}" if index == i
		return "empty list" if head.nil?
		at(index, node.next_node, i + 1)
	end

	def at_node_only(index, node = head, i = 0)
		return node if index == i
		at_node_only(index, node.next_node, i + 1)
	end

	def pop(node = head)
		return "No nodes to remove" if self.head.nil?
		if node.next_node == tail
			entry = tail.data
			node.next_node = nil
			self.tail = node
			self.size -= 1
			return "Popped: #{entry}"
		else
			pop(node.next_node)
		end
	end

	def contains?(value, node = head)
		return true if node.data == value
		return false if node.next_node.nil?
		contains?(value, node.next_node)
	end

	def find(value, node = head, i = 0)
		return "The node at index #{i} contains #{value}" if node.data == value
		return "empty list" if @head.nil?
		find(value, node.next_node, i + 1)
	end

	def to_s(node = head, string = 'This is the complete list:')
    return string += " nothing!" if self.head.nil?
		if node == tail
			string += " #{node.data} -> nil"
			p string
		elsif node.next_node != nil
			string += " #{node.data} ->"
			to_s(node.next_node, string)
		end
	end

	def insert_at(value, index, i = 0)
    return insert_at(value, index, i + 1) unless index == i
    new_node = create_node(value)
    empty(new_node)
    new_node.next_node = at_node_only(i)
    at_node_only(i-1).next_node = new_node
    "New node #{new_node.data} at index #{index}"
	end

	def remove_at(index, i = 0)
    return "Nothing to remove!" if @head.nil?
    return remove_at(index, i+1) unless index == i
    entry = at_node_only(index)
    prev = at_node_only(i-1)
    after = at_node_only(i+1)
    entry.next_node = nil
    prev.next_node = after
    self.size -= 1
    "Removed: #{entry.data} from index #{index}"
	end
end

class Node
  attr_accessor :data, :next_node

  def initialize(data)
    @data = data
    @next_node = nil
  end

  def nice_print
    next_node.nil? ? "nil" : next_node.data
  end

  def to_s
    "My data is #{data} and I point to #{nice_print}"
  end

end
