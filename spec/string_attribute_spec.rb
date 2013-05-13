require_relative 'spec_helper'

describe ActiveModel::Form::StringAttribute do
  it "parses '' as nil" do
    ActiveModel::Form::StringAttribute.parse('').must_equal nil
  end

  it "parses ' ' as nil" do
    ActiveModel::Form::StringAttribute.parse(' ').must_equal nil
  end

  it "parses nil as nil" do
    ActiveModel::Form::StringAttribute.parse(nil).must_equal nil
  end

  it "parses 'A String' as that string" do
    ActiveModel::Form::StringAttribute.parse('A String').must_equal 'A String'
  end
end
