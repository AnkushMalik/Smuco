class BusinessesController < ApplicationController
  before_action :authenticate_business!

  def show
  	@datasets = current_business.datasets
  end
end
