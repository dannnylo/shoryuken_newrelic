# frozen_string_literal: true

RSpec.describe ShoryukenNewrelic::ErrorLogger do
  let(:error) { StandardError.new("abc") }

  before do
    allow(NewRelic::Agent).to receive(:notice_error)
  end

  it "log error on Newrelic" do
    expect do
      described_class.new.call("worker_instance", "queue", {}, {}) do
        raise error
      end
    end.to raise_error(error)

    expect(NewRelic::Agent).to have_received(:notice_error).with(error)
  end

  it "keep raises the error" do
    expect do
      described_class.new.call("worker_instance", "queue", {}, {}) { raise error }
    end.to raise_error(error)
  end
end
