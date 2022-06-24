class LinkedList
	attr_accessor :total, :name

	def initialize
		@head = nil
		@tail = nil
		@total = 0
	end

	def create_node(value, next_node = nil)
		value = Node.new(value)
		value.next_node = nil
		value
	end

	def append(value)
		p new_node = create_node(value)
		if @head.nil?
			@head = new_node
			@tail = new_node
		else
			@tail.next_node = new_node
			@tail = new_node
		end
		@total += 1
	end

	def prepend(value)
		new_node = create_node(value)
		if head.nil?
			@head = new_node
			@tail = new_node
		else
			new_node.next_node = @head
			@head = new_node
			p new_node.next_node
		end
		@total += 1
	end

	def size
		@total
	end

	def head
		@head
	end

	def tail
		@tail
	end

	def at(index, node = @head, i = 0)
		return "The node at index #{index} is #{node.data}" if index == i
		"empty list" if @head.nil?
		at(index, node.next_node, i + 1)
	end

	def at_node_only(index, node = @head, i = 0)
		return node if index == i
		at_node_only(index, node.next_node, i + 1)
	end

	def pop(node = @head)
		return "No nodes to remove" if @head.nil?
		if node.next_node == @tail
			entry = @tail
			node.next_node = nil
			@tail = node
			@total -= 1
			return "Popped: #{entry}"
		else
			pop(node.next_node)
		end
	end

	def contains?(value, node = @head)
		return true if node.data == value
		return false if node.next_node.nil?
		contains?(value, node.next_node)
	end

	def find(value, node = @head, i = 0)
		return "The node at index #{i} contains #{value}" if node.data == value
		"empty list" if @head.nil?
		find(value, node.next_node, i + 1)
	end

	def to_s(node = @head, string = 'This is the complete list:')
		if node == @tail
			string += " #{node.data} -> nil"
			p string
		elsif node.data != nil
			string += " #{node.data} ->"
			to_s(node.next_node, string)
		end
	end

	def insert_at(value, index, i = 0)
		p new_node = create_node(value)
		if @head.nil?
			@head = new_node
			@tail = new_node
		end
		if index == i
			new_node.next_node = at_node_only(i)
			at_node_only(i-1).next_node = new_node
			@total += 1
			return "New node #{new_node.data} at index #{index}"
		else
		  insert_at(value, index, i + 1)
		end
	end

	def remove_at(index, i = 0)
		if @head.nil?
			@head = new_node
			@tail = new_node
		end
		if index == i
			entry = at_node_only(index)
			entry.next_node = nil
			at_node_only(i-1).next_node = at_node_only(i+1)
			@total -= 1
			return "Removed: #{entry.data} from index #{index}"
		else
			remove_at(index, i+1)
		end
	end
end
  
  class Node
    attr_accessor :data, :next_node
    def initialize(data)
      @data = data
      @next_node = nil
    end

		def nice_print
			if next_node.nil?
				"nil"
			else
				next_node.data
			end
		end

    def to_s
      "My data is #{data} and I point to #{nice_print}"
    end
  end
