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
  end
end