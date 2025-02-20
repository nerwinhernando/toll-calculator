class CalculationsController < ApplicationController
  def create
    origin = City.find(params[:origin_id])
    destination = City.find(params[:destination_id])
    vehicle_class = params[:vehicle_class].to_i

    # Find all routes between origin and destination for the specified vehicle class
    routes = Route.includes(:expressway)
                 .where(origin: origin,
                        destination: destination,
                        vehicle_class: vehicle_class)

    total_toll = routes.sum(:toll_fee)

    if routes.empty?
      # Check if there's an alternate route via other cities
      alternate_routes = find_alternate_routes(origin, destination, vehicle_class)

      if alternate_routes.present?
        render json: {
          origin: origin.name,
          destination: destination.name,
          vehicle_class: vehicle_class,
          routes: alternate_routes[:routes].map { |r| {
            expressway: r[:expressway].name,
            toll_fee: r[:toll_fee],
            via: r[:via]&.name
          }},
          total_toll: alternate_routes[:total_toll],
          is_alternate_route: true
        }
      else
        render json: {
          error: "No direct or alternate routes found between #{origin.name} and #{destination.name} for vehicle class #{vehicle_class}",
          status: :not_found
        }, status: :not_found
      end
    else
      render json: {
        origin: origin.name,
        destination: destination.name,
        vehicle_class: vehicle_class,
        routes: routes.map { |r| {
          expressway: r.expressway.name,
          toll_fee: r.toll_fee
        }},
        total_toll: total_toll,
        is_alternate_route: false
      }
    end
  end

  private

  def find_alternate_routes(origin, destination, vehicle_class)
    # Find possible intermediate cities that could connect origin and destination
    intermediate_cities = City.where.not(id: [origin.id, destination.id])

    alternate_routes = []
    total_toll = 0

    intermediate_cities.each do |city|
      # Check for route from origin to intermediate city
      first_leg = Route.includes(:expressway)
                     .where(origin: origin,
                            destination: city,
                            vehicle_class: vehicle_class)
                     .first

      # Check for route from intermediate city to destination
      second_leg = Route.includes(:expressway)
                      .where(origin: city,
                             destination: destination,
                             vehicle_class: vehicle_class)
                      .first

      if first_leg.present? && second_leg.present?
        # We found a viable alternate route through this city
        alternate_routes << {
          expressway: first_leg.expressway,
          toll_fee: first_leg.toll_fee,
          via: nil
        }

        alternate_routes << {
          expressway: second_leg.expressway,
          toll_fee: second_leg.toll_fee,
          via: city
        }

        total_toll += (first_leg.toll_fee + second_leg.toll_fee)
        break  # Stop after finding the first viable alternate route
      end
    end

    if alternate_routes.present?
      { routes: alternate_routes, total_toll: total_toll }
    else
      nil
    end
  end
end
