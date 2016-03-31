require_relative 'core_ext/hash'

module Flyml
  class Values < Hash
    attr_writer :file

    def self.build(data, file=nil)
      setting_values = new.merge(data)
      setting_values.file = file
      setting_values
    end

    def initialize(*args)
      @symbolize_on_write = true
      super
    end

    def merge(*args)
      obj = super
      obj.recursive_symbolize_keys! if @symbolize_on_write
      obj
    end

    def merge!(*args)
      obj = super
      obj.recursive_symbolize_keys! if @symbolize_on_write
      obj
    end
    alias read []

    def recursive_symbolize_keys!
      @symbolize_on_write = false
      super
      @symbolize_on_write = true
    end

    def []=(key, value)
      super

      recursive_symbolize_keys! if @symbolize_on_write
    end
    alias write []=
  end
end