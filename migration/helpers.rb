class Object
  def try(*a, &b)
    if a.empty? && block_given?
      yield self
    else
      __send__(*a, &b)
    end
  end
end

class NilClass
  def try(*args)
    nil
  end
end

class String
  def from_json
    JSON.parse(self)
  end
end