require_relative '../../app/lib/string_calculator'
RSpec.describe StringCalculator do
  subject(:calculator) { described_class.new }

  describe "#add" do
    context "with empty string" do
      it "returns 0" do
        expect(calculator.add("")).to eq(0)
      end
    end
  end
end