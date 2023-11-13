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
    end

    def call
      LambdaDemo.logger.info "Running process..."
      LambdaDemo.logger.info @event["message"]
      LambdaDemo.logger.info "Done..."
    end
  end
end
