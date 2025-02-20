class CalculationsController < ApplicationController
  def create
    origin = City.find(params[:origin_id])
    destination = City.find(params[:destination_id])

    routes = Route.includes(:expressway)
                 .where(origin: origin, destination: destination)

    total_toll = routes.sum(:toll_fee)

    render json: {
      origin: origin.name,
      destination: destination.name,
      routes: routes.map { |r| {
        expressway: r.expressway.name,
        toll_fee: r.toll_fee
      }},
      total_toll: total_toll
    }
  end
end
