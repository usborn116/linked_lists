require_relative './classes'

list = LinkedList.new

list.append("one")
list.append("two")
list.prepend("three")
list.prepend("eight")

p "Head: #{list.head}"
p "Tail: #{list.tail}"
p "Size: #{list.size}"

p list.at(0)
p list.pop

p "Size: #{list.size}"

p "Head: #{list.head}"
p "Tail: #{list.tail}"
p "Size: #{list.size}"

p list.contains?("seven")

p list.find("three")

list.to_s

p "Size: #{list.size}"

p list.insert_at("seven", 1)

list.to_s

p "Size: #{list.size}"

p list.remove_at(1)

list.to_s

p "Size: #{list.size}"
