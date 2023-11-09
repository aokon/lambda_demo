# frozen_string_literal: true

require "logger"

module LambdaDemo
  # nodoc
  class Handler
    def self.process(payload)
      new(event: payload[:event]).call
    end

    def initialize(event:)
      @event = event
      @logger = Logger.new($stdout)
    end

    def call
      @logger.info "Running process..."
      @logger.info @event["message"]
      @logger.info "Done..."
    end
  end
end
