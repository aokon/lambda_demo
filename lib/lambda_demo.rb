# frozen_string_literal: true

require "bundler"
require "zeitwerk"

module LambdaDemo
  VERSION = "1.0"

  def self.setup_zeitwerk
    loader = Zeitwerk::Loader.new
    loader.tag = "lambda-demo"
    loader.push_dir(__dir__)
    loader.setup
  end

  def self.setup_dependencies
    stages = [:default]
    stages.push(:development) if ENV["LAMBDA_ENV"] == "development"

    Bundler.require(*stages)
  end
end

LambdaDemo.setup_zeitwerk
LambdaDemo.setup_dependencies
