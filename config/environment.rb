# require_relative '../lib/concerns/concerns'

require 'bundler'
Bundler.require

require 'open-uri'
require 'net/http'
require 'json'
require 'pry'
require 'colorize'
require 'launchy'

# Classes
require_relative "../lib/cli.rb"
require_relative "../lib/services/APIservice.rb"
require_relative "../lib/recipe.rb"

#
# module Concerns
# end
#
# require_all 'lib'
