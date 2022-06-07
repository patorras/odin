module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    if block_given? 
      for ele in self 
        yield ele
      end
    else
      return self
    end
  end

 ####################################### 
  def my_each_with_index

    if block_given?
      i = 0
      for ele in self 
        yield ele, i
        i += 1
      end
    end

  end

  ###################################

  def my_count
    return size unless block_given?
    counter = 0
    my_each { |elem| counter += 1 if yield elem }
    counter

  end
###################################

def my_select

  if block_given?
    finish = is_a?(Hash) ? {} : []
    my_each { |elem| finish << elem if yield elem }
    finish
  else
    return to_enum(:select)
  end

end
###################################

def my_all?
  i = 0
  arr = []
  while i < length
    state = yield self[i]
    arr.push(state) if state == true
    i += 1
  end
  return false if arr.length != self.length

  true
end
###################################

def my_none?

  i = 0

  while i<self.length
      yield self[i]
          if yield self[i]
             return false
          end
     i = i+1
  end
  
  return true
  
end
###################################

def my_map
  finish = []
  self.my_each {|x| finish << yield(x)}
  return finish
end
###################################

def my_inject(start_value)
  acc = start_value
  my_each { |el| acc = (yield acc, el) }
  acc
end


end
