require "mountebank/version"
require "mountebank/network"
require "mountebank/imposter"

module Mountebank
  extend self

  def self.imposters
    imposters = []

    response = Network.get('/imposters')
    if response.success?
      response.body["imposters"].each do |imposter|
        imposters << Mountebank::Imposter.new(imposter)
      end
    end

    imposters
  end

  def self.reset
    response = Network.delete('/imposters')
    response.success?
  end
end