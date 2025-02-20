class CalculatorController < ApplicationController
  def index
    @cities = City.all.order(:name)
    @expressways = Expressway.all.order(:name)
  end
end
