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

  context "with one number" do
    it "returns the number itself" do
      expect(calculator.add("1")).to eq(1)
    end
  end

  context "with two comma-separated numbers" do
    it "returns their sum" do
      expect(calculator.add("1,5")).to eq(6)
    end
  end

  context "with multiple numbers" do
    it "returns their sum" do
      expect(calculator.add("1,2,3,4")).to eq(10)
    end
  end

  context "with newlines as delimiters" do
    it "returns the sum" do
      expect(calculator.add("1\n2\n3")).to eq(6)
    end
  end

end