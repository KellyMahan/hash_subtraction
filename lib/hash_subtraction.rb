module HashSubtraction
  #extending with HashSubtraction allows for removal of duplicate keys by subtracting one hash from another. This is used to keep us from re-translating already translated text.
  def - (h)
    h.extend(HashSubtraction)
    self.deep_subtraction(h).extend(HashSubtraction).compact
  end
  
  def remove_duplicates(h)
    h.extend(HashSubtraction)
    self.deep_remove_duplicates(h).extend(HashSubtraction).compact
  end
  
  def remove_duplicate_keys(h)
    h.extend(HashSubtraction)
    self.deep_remove_duplicate_keys(h).extend(HashSubtraction).compact
  end
  
  def diff(h)
    h.extend(HashSubtraction)
    self.deep_diff(h).extend(HashSubtraction).compact
  end
  
  def compact(opts={})
    inject({}) do |new_hash, (k,v)|
      if !v.nil?
        new_hash[k] = opts[:recurse] && v.class == Hash ? v.compact(opts) : v
      end
      new_hash
    end
  end
  
  def deep_diff(h)
    self.merge(h) do |k, old, new|
      old.extend(HashSubtraction) if old.is_a?(Hash)
      case old
      when Hash then (new.class == Hash) ? (old.diff(new)) : old
      else (old != new) ? new : nil
      end
    end
  end
  
  def deep_subtraction(h)
    self.merge(h) do |k, old, new|
      old.extend(HashSubtraction) if old.is_a?(Hash)

      case old
      when Array then (new.class == Array) ? (old - new) : (old - [new])
      when Hash then (new.class == Hash) ? (old - new) : old
      when Fixnum, Float, Integer then (old - new)
      when String
        old = (new.class == String) ? old.gsub(new,'') : old
        old = nil if old.empty?
        old
      else (old == new) ? nil : old
      end
    end
  end
  
  def deep_remove_duplicates(h)
    self.merge(h) do |k, old, new|
      old.extend(HashSubtraction) if old.is_a?(Hash)
      case old
      when Hash then (new.class == Hash) ? (old.remove_duplicates(new)) : old
      else (old == new) ? nil : old
      end
    end
  end

  def deep_remove_duplicate_keys(h)
    self.merge(h) do |k, old, new|
      nil
    end
  end

    
end