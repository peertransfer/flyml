require 'yaml'
require 'flyml/version'
require 'flyml/configuration'
require 'flyml/values'

module Flyml
  def self.config(root:, env:)
    Configuration.new(root, env)
  end
end
