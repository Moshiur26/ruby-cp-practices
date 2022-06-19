# Hash incase of ruby
a = {} #(or a = Hash.new)
a['one'] = 1 # a = {"one"=>1}
a['two'] = 2 # a = {"one"=>1, "two"=>2}
a[:three] = 3 # a = {"one"=>1, "two"=>2, :three=>3}

p a # {"one"=>1, "two"=>2, :three=>3}
