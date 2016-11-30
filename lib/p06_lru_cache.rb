require_relative 'p05_hash_map'
require_relative 'p04_linked_list'
require "byebug"
class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @store = Array.new(max, nil)
    @hashMap = HashMap.new
    @proc = prc
  end

  def count
  end

  def get(key)
    node = nil
    @store.each {|el| node = el if (el != nil && el.key == key)}
    if node
      #look for the link based on the key
      # if it exists, return it, update.
      update_link!(node)
      return @store[0].val
    else
      #if it doesnt exist, insert thie new key into  @store
      #eject the last one.
      node = @hashMap.getLink(key)
      if node
        update_link!(node)
        return @store[0].val
      else
        value = @proc.call(key)
        link = Link.new(key, value)
        @hashMap.set(key, value)
        update_link!(link);
        return @store[0].val
      end
    end

    #in each of these statements,
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
  end

  def update_link!(link)
    # suggested helper method; move a link to the end of the list
    index = @store.index(link)
    if index
      @store.delete_at(index)
      @store.unshift(link)
    else
        @store.pop()
        @store.unshift(link)
    end
  end

  def eject!
  end
end
