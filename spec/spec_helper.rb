require 'json'
require 'rspec'
require "pry-byebug"

def parse_json(json)
  JSON.parse(json, symbolize_names: true)
end
