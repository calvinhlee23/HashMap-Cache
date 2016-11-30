require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @count = 0
    @store = Array.new(num_buckets, [])
  end

  def insert(key)
    resize! if @count >= num_buckets
    hash = key.hash
    ind = hash % num_buckets
    @store[ind].push(key);
    @count +=1
  end

  def include?(key)
    hash = key.hash
    ind = hash % num_buckets
    @store[ind].each{|el| return true if el == key}
    false
  end

  def remove(key)
    hash = key.hash
    ind = hash % num_buckets
    @store[ind].delete(key)
    @count -= 1
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    newSize = num_buckets*2
    newStore = Array.new(newSize, []);
    @store.each do |el|
      el.each do |value|
        newInd = value % newSize
        newStore[newInd].push(value)
      end
    end

    @store = newStore
  end

end
