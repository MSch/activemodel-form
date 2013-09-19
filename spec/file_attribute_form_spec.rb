require_relative 'spec_helper'
require 'action_dispatch'

describe ActiveModel::Form do
  let(:params) do
    { "form"=>
      {"upload" => ActionDispatch::Http::UploadedFile.new(:tempfile => __FILE__, :filename => 'file_attribute_form_spec.rb'),
      "whatever" => "yeah" } }
  end

  it "parses the Rails form helper file params" do
    class FormWithDateTime < ActiveModel::Form
      attribute :upload, :file
      attribute :whatever, :string
    end

    form = FormWithDateTime.new(params['form'])
    form.upload.must_be_kind_of ActionDispatch::Http::UploadedFile
    form.whatever.must_equal "yeah"
  end
end
