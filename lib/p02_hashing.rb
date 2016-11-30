class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    self.inject(0) { |sum, i| sum + (i.to_s.ord^sum) }
  end
end

class String
  def hash
    self.split("").map{|ch| ch.ord}.inject(0) { |sum, i| sum + (i^sum) }
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.keys.sort.inject(0) { |sum, i| sum + (i.to_s.ord)^sum }
  end
end
