require_relative 'p02_hashing'
require_relative 'p04_linked_list'
require "byebug"
include Enumerable
class HashMap
  attr_reader :count

  def initialize(num_buckets = 8)
    @count = 0
    @store = Array.new(num_buckets, LinkedList.new);
  end

  def include?(key)
    ind = key.hash % num_buckets
    @store[ind].include?(key)
  end

  def set(key, val)
    ind = key.hash % num_buckets
    if self.include?(key)
      @store[ind].getLink(key).val = val
      return true
    end
    resize! if count >= num_buckets
    @store[ind].insert(key, val)
    @count +=1
    true
  end

  def get(key)
    ind = key.hash % num_buckets
    @store[ind].get(key)
  end

  def getLink(key)
    ind = key.hash % num_buckets
    @store[ind].getLink(key)
  end
  def delete(key)
    ind = key.hash % num_buckets
    @count -= 1
    @store[ind].remove(key)
  end

  def each

  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    newSize = num_buckets*2
    newStore = Array.new(newSize, LinkedList.new)
    @store.each do |list|
      list.each do |node|
        ind = node.key.hash % newSize
        newStore[ind].insert(node.key, node.val)
      end
    end
    @store = newStore
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
