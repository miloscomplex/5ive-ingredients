# require_relative '../lib/concerns/concerns'

require 'bundler'
Bundler.require

require 'irb'
require 'open-uri'
require 'net/http'
require 'json'
require 'pry'
require 'colorize'

# Classes
# require_relative "../lib/models/Character.rb"
# require_relative "../lib/services/APIService.rb"
require_relative "../lib/cli.rb"
require_relative "../lib/services/APIservice.rb"

#
# module Concerns
# end
#
# require_all 'lib'
