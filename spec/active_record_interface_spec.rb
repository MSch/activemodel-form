require_relative 'spec_helper'

describe ActiveModel::Form do
  it "implements the active_record interface" do
    class Form < ActiveModel::Form
      attribute :username, :string
    end

    form = Form.new(username: 'test')

    form.column_for_attribute(:username).must_equal ActiveModel::Form::StringAttribute
    form.column_for_attribute(:created_at).must_equal nil

    form.has_attribute?(:username).must_equal true
    form.has_attribute?(:created_at).must_equal false
  end
end
