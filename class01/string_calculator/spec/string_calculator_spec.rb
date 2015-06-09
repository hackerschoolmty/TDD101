require 'spec_helper'
require 'string_calculator'

describe StringCalculator do
  describe ".add" do
    context "when it adds from 0 to 2 numbers" do
      it "returns 0 for an empty string" do
        expect( StringCalculator.add("") ).to eql 0
        #StringCalculator.add("").should == 0
      end

      it "returns 1 for a '1'" do
        expect( StringCalculator.add("1") ).to eql 1
      end

      it "returns 3 for '1,2'" do
        expect( StringCalculator.add("1,2") ).to eql 3
      end

      it "returns 15 for '10,5'" do
        expect( StringCalculator.add("10,5") ).to eql 15
      end
    end

    context "when it adds n numbers" do
      it "returns 10 for '1,2,3,4'" do
        expect( StringCalculator.add("1,2,3,4") ).to eql 10
      end
    end

    context "when it adds numbers separated by a newline and commas" do
      it "returns 6 for '1\n2,3'" do
        expect( StringCalculator.add("1\n2,3") ).to eql 6
      end
    end

    context "when it add numbers separated by a custom delimeter" do
      it "returns 3 for '//;\n1;2'" do
        expect( StringCalculator.add("//;\n1;2") ).to eql 3
      end

      it "returns 10 for '//;\n1;2\n3;4'" do
        expect( StringCalculator.add("//;\n1;2\n3;4") ).to eql 10
      end
    end

    context "when adding negative numbers" do
      it "raises an error for '1,-2'" do
        expect { StringCalculator.add("1,-2") }.to raise_error("negatives not allowed: -2")
      end

      it "raises an error for '1,-2,-3,-4'" do
        expect { StringCalculator.add("1,-2,-3,-4") }.to raise_error("negatives not allowed: -2,-3,-4")
      end

      it "does not raise an error for '//-\n1-2-3-4'" do
        expect { StringCalculator.add("//-\n1-2-3-4") }.to_not raise_error
      end
    end
  end
end