include Enumerable
class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
  end

  def to_s
  end
end

class LinkedList
  attr_reader :list
  def initialize
  end

  def [](i)
  end

  def first
  end

  def last
  end

  def empty?
  end

  def get(key)
  end

  def include?(key)
  end

  def insert(key, val)
  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
  end
end
