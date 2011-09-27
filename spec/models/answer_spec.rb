require File.dirname(__FILE__) + '/../spec_helper'

describe Answer do
  it "should be valid" do
    Answer.new.should be_valid
  end
end
