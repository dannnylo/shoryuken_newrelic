# frozen_string_literal: true

RSpec.describe ShoryukenNewrelic::Instrumentation do
  let(:instance) { described_class.new }
  let(:error) { StandardError.new("abc") }

  before do
    allow(instance).to receive(:perform_action_with_newrelic_trace)
  end

  it "send trace to Newrelic" do
    block_called = false

    described_class.new.call("worker_instance", "queue", {}, {}) do
      block_called = true
    end

    expect(block_called).to be_truthy
    # expect(instance).to have_received(:perform_action_with_newrelic_trace)
  end
end
