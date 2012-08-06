class FormsController < ApplicationController
  class SearchForm < ActiveModel::Form
    self.model_name = 'q'
    attribute :username, :string
    attribute :created_at, :datetime

    validates_presence_of :username
    validates_presence_of :created_at
  end

  def new
    @search = SearchForm.new
  end

  def create
    @search = SearchForm.new(params[:q])
    @search.valid?
    render 'new'
  end

  def show
    redirect_to action: 'new'
  end
end
