# frozen_string_literal: true

require "newrelic_rpm"
require "shoryuken"

module ShoryukenNewrelic
  # This class sent errors to Newrelic
  class ErrorLogger
    def call(_worker_instance, _queue, _sqs_msg, _body)
      yield
    rescue StandardError => e
      NewRelic::Agent.notice_error(e)

      raise e
    end
  end
end

Shoryuken.server_middleware.add(ShoryukenNewrelic::ErrorLogger)
