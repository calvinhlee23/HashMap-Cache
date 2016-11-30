include Enumerable
require "byebug"
class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "{#{@key}:#{@val}}"
  end
end

class LinkedList
  attr_reader :list
  def initialize
    @list = nil
  end


  def [](i)
    target = self.first;
    return target if i == 0
    j = 0;
    while j < i
      target = target.next
      j+=1
    end
    target;
  end

  def first
    @list
  end

  def last
    self.each{|node| return node if node.next == nil} if @list
    nil
  end

  def empty?
    return true if !@list
    false
  end

  def get(key)
    self.each do |node|
      return node.val if node.key == key
    end
  end

# helper method
  def getLink(key)
    self.each do |node|
      return node if node.key == key
    end
  end

  def include?(key)
    self.each{|node| return true if node.key == key}
    false;
  end

  def insert(key, val)
    newLink = Link.new(key, val)
    if @list
      lst = self.last
      lst.next = newLink
      newLink.prev = lst
    else
      @list = newLink
    end
  end

  def remove(key)
    target = getLink(key)
    if target
      if target == @list
        @list = nil
      else
        target.prev.next = target.next if target.prev
        target.next.prev = target.prev if target.next
      end
    end
  end

  def each
    node = @list
    while node != nil
      yield(node)
      node = node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  # end
end
