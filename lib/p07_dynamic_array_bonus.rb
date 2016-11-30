include Enumerable
class StaticArray
  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    @store[i]
  end

  def []=(i, val)
    validate!(i)
    @store[i] = val
  end

  def length
    @store.length
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, @store.length - 1)
  end
end

class DynamicArray
  attr_reader :count

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
  end

  def [](i)
    return nil if (@count + i) < 0
    unless i <0
      @store[i]
    else
      @store[@count+i]
    end
  end

  def []=(i, val)
    @store[i] = val
  end

  def capacity
    @store.length
  end

  def include?(val)
    i = 0
    while i < @count
      return true if @store[i] = val
      i += 1
    end
    false
  end

  def push(val)
    @store[@count] = val
    @count += 1
  end

  def unshift(val)
    if @count >= @store.length
      resized = resize!

    end
    (0..@count)
  end

  def pop
    unless @count == 0
      val = @store[count-1]
      @store[@count-1] = nil
      @count -= 1
    end
      val
  end

  def shift
    val = @store[0]
    (0...@count).each do |x|
      @store[x] = @store[x + 1]
    end
    @count -= 1
    val

  end

  def first
    @store[0]
  end

  def last
    @store[@count-1]
  end

  def each
    0.upto(@count) do |i|
      yield(@store[i])
    end
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    # ...

  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
    new_arr = StaticArray.new(@store.length * 2)
    new_arr
  end
end
