class HashMap
  attr_accessor :max_size, :bucket

  def initialize()
    @max_size = 16
    @buckets = []
    @capacity = 0
    @load_factor = 0.75
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = (prime_number * hash_code + char.ord) % @max_size} 

    hash_code
  end

  def set(key, value)
    @buckets[hash(key)] = Node.new(key, value)
    @capacity += 1
  end

  def get(key)
    if (self.has(key))
      return @buckets[self.hash(key)].value
    end

    nil
  end

  def has(key)
    @buckets[self.hash(key)].nil? ? false : true
  end

  def remove(key) 
    if (self.has(key))
      @capacity -= 1
      return @buckets.delete_at(self.hash(key)).value
    end

    nil
  end

  def length
    @capacity
  end

  def clear
    @capacity = 0

    @buckets.clear()
  end

  def keys
    keys_array = []
    @buckets.each do |key|
      if(!key.nil?)
        keys_array.append(key.key)
      end
    end
    keys_array
  end

  def values
    values_array = []
    @buckets.each do |key|
      if(!key.nil?) 
        values_array.append(key.value)
      end
    end
    values_array
  end

  def entries
    entries_array = []
    @buckets.each do |key|
      if (!key.nil?) 
        entries_array.append([key.key, key.value])
      end
    end
    entries_array
  end
end


class Node

  attr_accessor :key, :value
  def initialize(key, value)
    @key = key
    @value = value
  end
end

hash = HashMap.new
