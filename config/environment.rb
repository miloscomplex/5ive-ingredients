require_relative '../lib/concerns/concerns'

require 'bundler'
Bundler.require

require 'irb'
require 'open-uri'
require 'pry'
require 'colorize'

module Concerns
end

require_all 'lib'
