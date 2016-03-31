require 'yaml'
require 'flyml/version'
require 'flyml/values'

module Flyml
  class << self
    attr_accessor :env, :root

    def [](file)
      @config ||= {}
      @config[file.to_sym] = load_settings(file) unless @config[file.to_sym]
      @config[file.to_sym]
    end

    private

    def prepare_hash(data)
      hash = data.is_a?(Hash) && data[env.to_s] ? data[env.to_s] : {}
      Values.build(hash)
    end

    def file_path(name)
      File.join(root, 'config', "#{name}.yml")
    end

    def load_settings(file)
      path = file_path(file)
      return unless File.exist?(path)

      content = load_file_content(path)
      data = YAML.load(content)
      prepare_hash(data)
    end

    def load_file_content(path)
      File.read(path)
    end
  end
end
