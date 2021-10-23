# frozen_string_literal: true

RSpec.describe ShoryukenNewrelic do
  it "has a version number" do
    expect(ShoryukenNewrelic::VERSION).not_to be nil
  end

  it "load Instrumentation middleware on server shoryuken" do
    expect(Shoryuken.server_middleware.exists?(ShoryukenNewrelic::Instrumentation)).to be_truthy
  end

  it "load ErrorLogger middleware on server shoryuken" do
    expect(Shoryuken.server_middleware.exists?(ShoryukenNewrelic::ErrorLogger)).to be_truthy
  end
end
