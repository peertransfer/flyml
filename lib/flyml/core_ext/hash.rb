require 'active_support/core_ext/hash/keys'

class Hash
  def recursive_symbolize_keys!
    symbolize_keys!
    # symbolize each hash in .values
    values.each { |h| h.recursive_symbolize_keys! if h.is_a?(Hash) }
    # symbolize each hash inside an array in .values
    values.select { |v| v.is_a?(Array) }.flatten.each { |h| h.recursive_symbolize_keys! if h.is_a?(Hash) }
    self
  end

  def deep_fetch(*args, &block)
    return self if args.empty?
    value = fetch(args.shift, &block)
    if value.is_a?(Hash)
      value.deep_fetch(*args, &block)
    elsif value.is_a?(Array) && !args.empty?
      value = value[args.shift]
      value.deep_fetch(*args, &block)
    else
      value
    end
  end
end
