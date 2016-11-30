require 'byebug'
class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    @store[num] = true;
  end

  def remove(num)
    validate!(num)
    @store[num] = false;
  end

  def include?(num)
    validate!(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
    raise "Out of bounds" if (num > @store.length || num < 0)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets, []);
  end

  def insert(num)
    index = num % num_buckets
    @store[index].push(num);
    true;
  end

  def remove(num)
    index = num % num_buckets
    @store[index].delete(num)
  end

  def include?(num)
    index = num % num_buckets
    @store[index].each{|el| return true if el == num}
    return false;
  end

  private

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets)
    @count = 0;
    @store = Array.new(num_buckets, [])
  end

  def insert(num)
    resize! if @count >= num_buckets
    ind = num % num_buckets
    @store[ind].push(num)
    @count += 1
    true
  end

  def remove(num)
    ind = num % num_buckets
    @store[ind].delete(num)
    @count -=1
    true
  end

  def include?(num)
    ind = num % num_buckets
    @store[ind].each{ |el| return true if el == num}
    false;
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    if @count >= num_buckets
      newSize = num_buckets*2
      newStore = Array.new(newSize, [])
      @store.each do |el|
        el.each do |inEl|
          newInd = inEl % newSize
          newStore[newInd].push(newInd)
        end
      end
      @store = newStore;
    end

  end

end
