require_relative 'spec_helper'

describe ActiveModel::Form do
  it "can be set but doesn't influence subclasses" do
    class Parent < ActiveModel::Form
      self.model_name = 'the_parent'
    end
    class Child < ActiveModel::Form
      self.model_name = 'the_child'
    end

    ActiveModel::Form.model_name.must_equal 'ActiveModel::Form'
    Parent.model_name.must_equal 'the_parent'
    Child.model_name.must_equal 'the_child'
  end
end

