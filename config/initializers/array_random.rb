class Array
  def random(weights=nil)
    return random(map {|n| n.send(weights)}) if weights.is_a? Symbol

    weights ||= Array.new(length, 1.0)
    total = weights.inject(0.0) {|t,w| t+w}
    point = rand * total

    zip(weights).each do |n,w|
      return n if w >= point
      point -= w
    end
  end
  def randomize(weights=nil)
    return randomize(map {|n| n.send(weights)}) if weights.is_a? Symbol

    weights = weights.nil? ? Array.new(length, 1.0) : weights.dup

    #pick out elements until there are none left
    list, result = self.dup, []
    until list.empty?
      # pick an element
      result << list.random(weights)
      # remove the element from the temporary list and its weight
      weights.delete_at(list.index(result.last))
      list.delete result.last
    end

    result
  end
end
