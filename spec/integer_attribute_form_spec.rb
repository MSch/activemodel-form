require_relative 'spec_helper'

describe ActiveModel::Form do
  # Integr params generated by the Rails form helpers look like this
  let(:params) do
    { "form"=>
      {"zero"=>"0",
       "one"=>"1"}
    }
  end

  it "parses the Rails form helper boolean params" do
    class FormWithBooleans < ActiveModel::Form
      attribute :zero, :integer
      attribute :one, :integer
      attribute :not_set, :integer
    end

    form = FormWithBooleans.new(params['form'])
    form.zero.must_equal 0
    form.one.must_equal 1
    form.not_set.must_equal nil
  end
end
