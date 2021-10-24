# frozen_string_literal: true

require "newrelic_rpm"
require "shoryuken"

module ShoryukenNewrelic
  # This class send transactions trace to newrelic
  class Instrumentation
    include NewRelic::Agent::Instrumentation::ControllerInstrumentation

    def call(worker_instance, _queue, _sqs_msg, _body, &block)
      perform_action_with_newrelic_trace({
                                           name: "perform",
                                           class_name: worker_instance.class.to_s,
                                           category: "OtherTransaction/ShoryukenJob"
                                         }, &block)
    end
  end
end

Shoryuken.server_middleware.add(ShoryukenNewrelic::Instrumentation)
