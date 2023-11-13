# frozen_string_literal: true

require "bundler"
require "zeitwerk"

module LambdaDemo
  VERSION = "1.1"

  def self.loader
    @loader ||= begin
      loader = Zeitwerk::Loader.new
      loader.tag = "lambda-demo"
      loader.push_dir(__dir__)
      loader
    end
  end

  def self.setup_dependencies
    stages = [:default]
    stages.push(:development) if ENV["LAMBDA_ENV"] == "development"

    Bundler.require(*stages)
  end

  def self.logger
    @logger ||= Logger.new($stdout)
  end

  def self.boot
    return if @booted

    loader.setup
    setup_dependencies
    @booted = true
  end
end

LambdaDemo.boot
