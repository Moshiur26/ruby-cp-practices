# we have a Set class
require 'set'
s = Set.new         # <Set: {}>
s.add(1)            # <Set: {1}>
s.add(2)            # <Set: {1, 2}>
s.add(1)            # <Set: {1, 2}>
s.add(3)            # <Set: {1, 2, 3}>
s.add(2)            # <Set: {1, 2, 3}>
s.instance_of?(Set) # true

p s # #<Set: {1, 2, 3}>
