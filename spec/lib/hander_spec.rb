# frozen_string_literal: true

RSpec.describe LambdaDemo::Handler do
  subject(:handler) { described_class.new(event:) }

  let(:event) do
    {message: "Hello TRUG!"}
  end

  describe "#call" do
    let(:logger) { instance_double(Logger, info: nil) }

    before do
      allow(Logger).to receive(:new).and_return(logger)
    end

    it "calls logger" do
      expect(logger).to receive(:info)

      handler.call
    end
  end
end
