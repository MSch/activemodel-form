require 'simplecov'
SimpleCov.start
require 'minitest/spec'
require 'minitest/autorun'

lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activemodel-form'
