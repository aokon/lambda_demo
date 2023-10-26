# frozen_string_literal: true

require "bundler"

stages = [:default]
stages.push(:development) if ENV["LAMBDA_ENV"] == "development"

Bundler.require(*stages)

loader = Zeitwerk::Loader.new
loader.push_dir(__dir__)
loader.setup

module LambdaDemo
  VERSION = "1.0"
end
