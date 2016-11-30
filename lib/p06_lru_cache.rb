require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
  end

  def count
  end

  def get(key)
    #look for the link based on the key
    # if it exists, return it, update.

    #if it doesnt exist, inse3rt thie new key into  @store
    #ject the last one.

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
  end

  def eject!
  end
end
